package cn.edu.nwpu.fleamarket.data;

import cn.edu.nwpu.fleamarket.pojo.Goods;
import cn.edu.nwpu.fleamarket.pojo.Student;
import lombok.Data;
import lombok.ToString;

/**
 * 订购信息
 *
 * @author lsy
 * @date 2023/12/15
 */
@Data
public class OrderInformation {
    /**
     * 货物
     */
    private Goods goods;

    /**
     * 订单编号
     */
    private Integer orderId;

    /**
     * 卖方
     */
    private Student seller;

    /**
     * 买方
     */
    private Student buyer;

    /**
     * 卖家确认
     */
    private Integer sellerConfirm;

    /**
     * 买家确认
     */
    private Integer buyerConfirm;

    /**
     * 是 cancel
     */
    private Integer isCancel;

    /**
     * 到字符串
     *
     * @return {@link String}
     */
    @Override
    public String toString() {
        return "OrderInformation{" +
                "goods=" + goods +
                ", orderId=" + orderId +
                ", seller=" + seller +
                ", buyer=" + buyer +
                ", sellerConfirm=" + sellerConfirm +
                ", buyerConfirm=" + buyerConfirm +
                ", isCancel=" + isCancel +
                '}';
    }
}
