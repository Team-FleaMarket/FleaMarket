package cn.edu.nwpu.fleamarket.service;

import cn.edu.nwpu.fleamarket.pojo.Goods;
import cn.edu.nwpu.fleamarket.pojo.Orders;

/**
* @author xh254
* @description 针对表【orders】的数据库操作Service
* @createDate 2023-12-16 01:15:59
*/
public interface OrdersService {


    void addOrder(Goods goods, String studentNo);

    void sellerConfirm(Integer goodsId, Integer sellerNo);

    void buyerConfirm(Integer goodsId, Integer buyerNo);

    void deleteOrder(Integer goodsId, Integer studentNo);

    void buyerCancel(Integer goodsId, Integer buyerNo);

    void sellerCancel(Integer goodsId, Integer sellerNo);

    void checkForCancel(Integer goodsId);
}
