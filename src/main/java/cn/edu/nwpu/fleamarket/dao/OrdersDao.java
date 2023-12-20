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

    /**
     * 添加订单
     *
     * @param goods 商品
     * @param buyer 买方
     */
    void addOrder(@Param("goods") Goods goods, @Param("buyer") Integer buyer);

    /**
     * 卖家确认
     *
     * @param orderId  订单编号
     * @param sellerNo 卖家编号
     */
    void sellerConfirm(@Param("orderId") Integer orderId, @Param("sellerNo") Integer sellerNo);

    /**
     * 卖家已确认
     *
     * @param orderId 订单编号
     * @return {@link Integer}
     */
    Integer isSellerConfirmed(@Param("orderId") Integer orderId);

    /**
     * 买家确认
     *
     * @param orderId 订单编号
     * @param buyerNo 买家编号
     */
    void buyerConfirm(@Param("orderId") Integer orderId, @Param("buyerNo") Integer buyerNo);

    /**
     * 删除订单
     *
     * @param goodsId 商品编号
     * @param id      编号
     */
    void deleteOrder(@Param("goodsId") Integer goodsId, Integer id);

    /**
     * 卖家是否被取消
     *
     * @param orderId 订单编号
     * @return int
     */
    int isSellerCanceled(@Param("orderId") Integer orderId);

    /**
     * 设置买家取消
     *
     * @param orderId 订单编号
     */
    void setBuyerCancel(@Param("orderId") Integer orderId);

    /**
     * 买家是否被取消
     *
     * @param goodsId 商品编号
     * @return int
     */
    int isBuyerCanceled(@Param("goodsId") Integer goodsId);

    /**
     * 设置卖家取消
     *
     * @param goodsId 商品编号
     */
    void setSellerCancel(@Param("goodsId") Integer goodsId);

    /**
     * 按商品 ID 选择
     *
     * @param id 编号
     * @return {@link Orders}
     */
    Orders selectByGoodsId(@Param("goodsId") int id);

    /**
     * 通过买家 ID 获取
     *
     * @param buyerId 买家 ID
     * @return {@link List}<{@link Orders}>
     */
    List<Orders> getByBuyerId(@Param("buyerId") Integer buyerId);

    /**
     * 逻辑取消订单
     *
     * @param orderId 订单编号
     */
    void logicCancelOrder(@Param("orderId") Integer orderId);

    /**
     * 按 ID 选择
     *
     * @param orderId 订单编号
     * @return {@link Orders}
     */
    Orders selectById(@Param("orderId") Integer orderId);

    /**
     * 已取消
     *
     * @param orderId 订单编号
     * @return int
     */
    int isCanceled(@Param("orderId") Integer orderId);

    /**
     * 买家是否确认
     *
     * @param orderId 订单编号
     * @return int
     */
    int isBuyerConfirmd(Integer orderId);
}




