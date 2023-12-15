package cn.edu.nwpu.fleamarket.dao;

import cn.edu.nwpu.fleamarket.pojo.Cart;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* @author xh254
* @description 针对表【cart】的数据库操作Mapper
* @createDate 2023-12-15 16:21:25
* @Entity cn.edu.nwpu.fleamarket.pojo.Cart
*/
@Mapper
public interface CartDao {

    Cart getCartItemByStudentNoAndGoodsId(@Param("studentNo") int studentNo, @Param("goodsId") int goodsId);

    void addCartItem(@Param("studentNo") int studentNo, @Param("goodsId") int goodsId);

    void cartItemIncrementCount(@Param("studentNo") int studentNo, @Param("goodsId") int goodsId, @Param("num") int num);

    List<Cart> getCartByStudentNo(@Param("studentNo") int studentNo);
}




