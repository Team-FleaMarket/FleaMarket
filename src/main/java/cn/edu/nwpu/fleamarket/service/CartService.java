package cn.edu.nwpu.fleamarket.service;

import cn.edu.nwpu.fleamarket.pojo.Cart;

import java.util.List;

/**
* @author xh254
* @description 针对表【cart】的数据库操作Service
* @createDate 2023-12-15 16:21:25
*/
public interface CartService {

    void addCartItem(int studentNo, int goodsId, int num);

    List<Cart> getCartList(int studentNo);
}
