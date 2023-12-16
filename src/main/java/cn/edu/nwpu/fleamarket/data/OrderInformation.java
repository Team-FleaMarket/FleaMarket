package cn.edu.nwpu.fleamarket.data;

import cn.edu.nwpu.fleamarket.pojo.Goods;
import cn.edu.nwpu.fleamarket.pojo.Student;
import lombok.Data;

@Data
public class OrderInformation {
    private Goods goods;

    private Integer orderId;

    private Student seller;

    private Student buyer;

    private Integer sellerConfirm;

    private Integer buyerConfirm;

    private Integer buyerCancel;

    private Integer sellerCancel;

}
