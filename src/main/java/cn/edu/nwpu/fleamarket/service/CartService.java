package cn.edu.nwpu.fleamarket.service;

import cn.edu.nwpu.fleamarket.pojo.Cart;

import java.util.List;

/**
* @author xh254
* @description 针对表【cart】的数据库操作Service
* @createDate 2023-12-15 16:21:25
*/
public interface CartService {

    /**
     * 添加购物车项
     * @param studentNo 学号
     * @param goodsId 商品id
     * */
    void addCartItem(String studentNo, int goodsId, int num);

    /**
     * 获取购物车列表
     * @param studentNo 学号
     * */
    List<Cart> getCartList(String studentNo);

    /**
     * 查看是否在购物车中
     * @param studentNo 学号
     * @param goodsId 商品id
     * */
    Boolean checkIsInCart(String studentNo, int goodsId);
}
