package cn.edu.nwpu.fleamarket.service;

import cn.edu.nwpu.fleamarket.pojo.Goods;

/**
 * @author xh254
 * @description 针对表【orders】的数据库操作Service
 * @createDate 2023-12-16 01:15:59
 */
public interface OrdersService {

    void addOrder(Goods goods, String studentNo);

    void sellerConfirm(Integer orderId, Integer sellerNo);

    void buyerConfirm(Integer orderId, Integer buyerNo);

    void checkForCancel(Integer goodsId);

    void cancelOrder(Integer orderId, Integer studentNo);
}
