package cn.edu.nwpu.fleamarket.dao;

import cn.edu.nwpu.fleamarket.pojo.Goods;
import cn.edu.nwpu.fleamarket.pojo.Orders;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* @author xh254
* @description 针对表【orders】的数据库操作Mapper
* @createDate 2023-12-16 01:15:59
* @Entity cn.edu.nwpu.fleamarket.pojo.Orders
*/
public interface OrdersDao {

    void addOrder(@Param("goods") Goods goods, @Param("buyer") Integer buyer);

    void sellerConfirm(@Param("orderId") Integer orderId, @Param("sellerNo") Integer sellerNo);

    Integer isSellerConfirmed(@Param("orderId") Integer orderId);

    void buyerConfirm(@Param("orderId") Integer orderId, @Param("buyerNo") Integer buyerNo);

    void deleteOrder(@Param("goodsId") Integer goodsId, Integer id);

    int isSellerCanceled(@Param("orderId") Integer orderId);

    void setBuyerCancel(@Param("orderId") Integer orderId);

    int isBuyerCanceled(@Param("goodsId") Integer goodsId);

    void setSellerCancel(@Param("goodsId") Integer goodsId);

    Orders selectByGoodsId(@Param("goodsId") int id);

    List<Orders> getByBuyerId(@Param("buyerId") Integer buyerId);

    void logicCancelOrder(@Param("orderId") Integer orderId);

    Orders selectById(@Param("orderId") Integer orderId);

    int isCanceled(@Param("orderId") Integer orderId);

    int isBuyerConfirmd(Integer orderId);
}




