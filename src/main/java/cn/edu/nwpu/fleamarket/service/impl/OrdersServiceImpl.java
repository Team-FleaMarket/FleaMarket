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
import org.springframework.web.bind.annotation.GetMapping;

/**
* @author xh254
* @description 针对表【orders】的数据库操作Service实现
* @createDate 2023-12-16 01:15:59
*/
@Service
public class OrdersServiceImpl implements OrdersService{

    @Autowired
    private OrdersDao ordersDao;

    @Autowired
    private GoodsDao goodsDao;

    @Override
    public void addOrder(Goods goods, String studentNo) {
        ordersDao.addOrder(goods, Integer.valueOf(studentNo));
        goodsDao.setGoodsStatus(goods.getId(), GoodsStatusEnum.IN_PROGRESS.getCode());
    }

    @Override
    public void sellerConfirm(Integer orderId, Integer sellerNo) {
        System.out.println("sellerconfirm goodsId: " + orderId + " sellerNo: " + sellerNo);
        ordersDao.sellerConfirm(orderId, sellerNo);
    }

    @Override
    public void buyerConfirm(Integer orderId, Integer buyerNo) {
        if(ordersDao.isSellerConfirmed(orderId) == 0){
            throw new BusinessException("卖家未确认");
        }
        ordersDao.buyerConfirm(orderId, buyerNo);
        Orders orders = ordersDao.selectById(orderId);
        Goods goods = goodsDao.selectById(orders.getGoodsId());
        goodsDao.setGoodsStatus(goods.getId(), GoodsStatusEnum.SOLD.getCode());
    }

    @Override
    public void deleteOrder(Integer orderId, Integer id) {
        ordersDao.deleteOrder(orderId, id);
    }

    @Override
    public void buyerCancel(Integer orderId, Integer buyerNo) {
        System.out.println("buyerCancel goodsId: " + orderId + " buyerNo: " + buyerNo);
        Goods goods = goodsDao.selectById(orderId);
        if (ordersDao.isSellerCanceled(orderId) == 1) {
            ordersDao.setBuyerCancel(orderId);
            goodsDao.setGoodsStatus(goods.getId(), GoodsStatusEnum.NOT_SOLD.getCode());
        }else{
            ordersDao.setBuyerCancel(orderId);
        }
    }

    @Override
    public void sellerCancel(Integer goodsId, Integer sellerNo) {

        if (ordersDao.isBuyerCanceled(goodsId) == 1) {
            ordersDao.setSellerCancel(goodsId);
            goodsDao.setGoodsStatus(goodsId, GoodsStatusEnum.NOT_SOLD.getCode());
        }else{
            ordersDao.setSellerCancel(goodsId);
        }
    }

    @Override
    public void checkForCancel(Integer goodsId) {
        Goods goods = goodsDao.selectById(goodsId);
        if(goods==null){
            throw new BusinessException("商品不存在");
        }
        if(goods.getGoodsStatus()==GoodsStatusEnum.SOLD.getCode()){
            throw new BusinessException("商品已售出，不能取消订单");
        }
        if(goods.getGoodsStatus()==GoodsStatusEnum.NOT_SOLD.getCode()){
            throw new BusinessException("商品未售出，不能取消订单");
        }
    }

    @Override
    public void cancelOrder(Integer orderId, Integer studentNo) {
        Goods goods = goodsDao.selectById(ordersDao.selectById(orderId).getGoodsId());
        ordersDao.logicCancelOrder(orderId);
        goodsDao.setGoodsStatus(goods.getId(), GoodsStatusEnum.NOT_SOLD.getCode());
    }

}




