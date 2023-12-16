package cn.edu.nwpu.fleamarket.service.impl;

import cn.edu.nwpu.fleamarket.dao.GoodsDao;
import cn.edu.nwpu.fleamarket.dao.OrdersDao;
import cn.edu.nwpu.fleamarket.enums.GoodsStatusEnum;
import cn.edu.nwpu.fleamarket.exception.BusinessException;
import cn.edu.nwpu.fleamarket.pojo.Goods;
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
    public void sellerConfirm(Integer goodsId, Integer sellerNo) {
        System.out.println("sellerconfirm goodsId: " + goodsId + " sellerNo: " + sellerNo);
        ordersDao.sellerConfirm(goodsId, sellerNo);
    }

    @Override
    public void buyerConfirm(Integer goodsId, Integer buyerNo) {
        if(ordersDao.isSellerConfirmed(goodsId) == 0){
            throw new BusinessException("卖家未确认");
        }
        ordersDao.buyerConfirm(goodsId, buyerNo);
        goodsDao.setGoodsStatus(goodsId, GoodsStatusEnum.SOLD.getCode());
    }

    @Override
    public void deleteOrder(Integer goodsId, Integer id) {
        ordersDao.deleteOrder(goodsId, id);
    }

    @Override
    public void buyerCancel(Integer goodsId, Integer buyerNo) {
        System.out.println("buyerCancel goodsId: " + goodsId + " buyerNo: " + buyerNo);

        if (ordersDao.isSellerCanceled(goodsId) == 1) {
            ordersDao.setBuyerCancel(goodsId);
            goodsDao.setGoodsStatus(goodsId, GoodsStatusEnum.NOT_SOLD.getCode());
        }else{
            ordersDao.setBuyerCancel(goodsId);
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

}




