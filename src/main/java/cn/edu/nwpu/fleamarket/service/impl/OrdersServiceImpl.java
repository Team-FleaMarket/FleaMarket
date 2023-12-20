package cn.edu.nwpu.fleamarket.service.impl;

import cn.edu.nwpu.fleamarket.dao.GoodsDao;
import cn.edu.nwpu.fleamarket.dao.OrdersDao;
import cn.edu.nwpu.fleamarket.enums.GoodsStatusEnum;
import cn.edu.nwpu.fleamarket.exception.BusinessException;
import cn.edu.nwpu.fleamarket.pojo.Goods;
import cn.edu.nwpu.fleamarket.pojo.Orders;
import cn.edu.nwpu.fleamarket.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author xh254
 * @description 针对表【orders】的数据库操作Service实现
 * @createDate 2023-12-16 01:15:59
 */
@Service
public class OrdersServiceImpl implements OrdersService {

    /**
     * 订单
     */
    @Autowired
    private OrdersDao ordersDao;

    /**
     * 商品
     */
    @Autowired
    private GoodsDao goodsDao;

    /**
     * 添加订单
     *
     * @param goods     货物
     * @param studentNo 学生编号
     */
    @Override
    public void addOrder(Goods goods, String studentNo) {
        ordersDao.addOrder(goods, Integer.valueOf(studentNo));
        goodsDao.setGoodsStatus(goods.getId(), GoodsStatusEnum.IN_PROGRESS.getCode());
    }

    /**
     * 卖家确认
     *
     * @param orderId  订单编号
     * @param sellerNo 卖家编号
     */
    @Override
    public void sellerConfirm(Integer orderId, Integer sellerNo) {
        System.out.println("sellerconfirm goodsId: " + orderId + " sellerNo: " + sellerNo);
        ordersDao.sellerConfirm(orderId, sellerNo);
    }

    /**
     * 买家确认
     *
     * @param orderId 订单编号
     * @param buyerNo 买家编号
     */
    @Override
    public void buyerConfirm(Integer orderId, Integer buyerNo) {
        if (ordersDao.isSellerConfirmed(orderId) == 0) {
            throw new BusinessException("卖家未确认");
        }
        ordersDao.buyerConfirm(orderId, buyerNo);
        Orders orders = ordersDao.selectById(orderId);
        Goods goods = goodsDao.selectById(orders.getGoodsId());
        goodsDao.setGoodsStatus(goods.getId(), GoodsStatusEnum.SOLD.getCode());
    }


    /**
     * 检查是否取消
     *
     * @param goodsId 商品编号
     */
    @Override
    public void checkForCancel(Integer goodsId) {
        Goods goods = goodsDao.selectById(goodsId);
        if (goods == null) {
            throw new BusinessException("商品不存在");
        }
        if (goods.getGoodsStatus() == GoodsStatusEnum.SOLD.getCode()) {
            throw new BusinessException("商品已售出，不能取消订单");
        }
        if (goods.getGoodsStatus() == GoodsStatusEnum.NOT_SOLD.getCode()) {
            throw new BusinessException("商品未售出，不能取消订单");
        }
    }

    /**
     * 取消订单
     *
     * @param orderId   订单编号
     * @param studentNo 学生编号
     */
    @Override
    public void cancelOrder(Integer orderId, Integer studentNo) {
        Goods goods = goodsDao.selectById(ordersDao.selectById(orderId).getGoodsId());
        ordersDao.logicCancelOrder(orderId);
        goodsDao.setGoodsStatus(goods.getId(), GoodsStatusEnum.NOT_SOLD.getCode());
    }

}




