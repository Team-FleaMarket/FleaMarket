package cn.edu.nwpu.fleamarket.data;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;

/**
 * 购物车项
 * */
@Data
@AllArgsConstructor
public class CartItem {
    /**
     * 商品编号
     */
    private int goodsId;

    /**
     * 学生编号
     */
    private String studentNo;

    /**
     * 总数
     */
    private int num;
}
