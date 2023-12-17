package cn.edu.nwpu.fleamarket.data;

import lombok.Data;
import lombok.ToString;

/**
 * 购物车项
 * */
@Data
public class CartItem {
    private int goodsId;

    private String studentNo;

    private int num;
}
