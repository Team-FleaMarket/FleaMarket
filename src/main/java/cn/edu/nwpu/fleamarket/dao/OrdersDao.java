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

    void sellerConfirm(@Param("goodsId") Integer goodsId, @Param("sellerNo") Integer sellerNo);

    Integer isSellerConfirmed(@Param("goodsId") Integer goodsId);

    void buyerConfirm(@Param("goodsId") Integer goodsId, @Param("buyerNo") Integer buyerNo);

    void deleteOrder(@Param("goodsId") Integer goodsId, Integer id);

    int isSellerCanceled(@Param("goodsId") Integer goodsId);

    void setBuyerCancel(@Param("goodsId") Integer goodsId);

    int isBuyerCanceled(@Param("goodsId") Integer goodsId);

    void setSellerCancel(@Param("goodsId") Integer goodsId);

    Orders selectByGoodsId(@Param("goodsId") int id);

    List<Orders> getByBuyerId(@Param("buyerId") Integer buyerId);
}




