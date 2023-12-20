package cn.edu.nwpu.fleamarket.service;

import cn.edu.nwpu.fleamarket.pojo.Goods;

/**
 * @author xh254
 * @description 针对表【orders】的数据库操作Service
 * @createDate 2023-12-16 01:15:59
 */
public interface OrdersService {

    /**
     * 添加订单
     *
     * @param goods     商品
     * @param studentNo 学生编号
     */
    void addOrder(Goods goods, String studentNo);

    /**
     * 卖家确认
     *
     * @param orderId  订单编号
     * @param sellerNo 卖家编号
     */
    void sellerConfirm(Integer orderId, Integer sellerNo);

    /**
     * 买家确认
     *
     * @param orderId 订单编号
     * @param buyerNo 买家编号
     */
    void buyerConfirm(Integer orderId, Integer buyerNo);

    /**
     * 检查取消
     *
     * @param goodsId 商品编号
     */
    void checkForCancel(Integer goodsId);

    /**
     * 取消订单
     *
     * @param orderId   订单编号
     * @param studentNo 学生编号
     */
    void cancelOrder(Integer orderId, Integer studentNo);
}
