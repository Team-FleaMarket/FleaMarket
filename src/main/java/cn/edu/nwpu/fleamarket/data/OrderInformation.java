package cn.edu.nwpu.fleamarket.data;

import cn.edu.nwpu.fleamarket.pojo.Goods;
import cn.edu.nwpu.fleamarket.pojo.Student;
import lombok.Data;
import lombok.ToString;

@Data
public class OrderInformation {
    private Goods goods;

    private Integer orderId;

    private Student seller;

    private Student buyer;

    /**
     * 卖家确认
     * 1表示未确认
     * 0表示已确认
     */
    private Integer sellerConfirm;

    private Integer buyerConfirm;

    private Integer isCancel;
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
