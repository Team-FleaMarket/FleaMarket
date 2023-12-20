package cn.edu.nwpu.fleamarket.dao;

import cn.edu.nwpu.fleamarket.pojo.Cart;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 购物车道
 *
 * @author xh254
 * @description 针对表【cart】的数据库操作Mapper
 * @createDate 2023-12-15 16:21:25
 * @Entity cn.edu.nwpu.fleamarket.pojo.Cart
 */
@Mapper
public interface CartDao {

    /**
     * 按学生编号和商品 ID 获取购物车商品
     *
     * @param studentNo 学生编号
     * @param goodsId   商品编号
     * @return {@link Cart}
     */
    Cart getCartItemByStudentNoAndGoodsId(@Param("studentNo") String studentNo, @Param("goodsId") int goodsId);

    /**
     * 添加购物车商品
     *
     * @param studentNo 学生编号
     * @param goodsId   商品编号
     */
    void addCartItem(@Param("studentNo") String studentNo, @Param("goodsId") int goodsId);

    /**
     * 购物车商品增量计数
     *
     * @param studentNo 学生编号
     * @param goodsId   商品编号
     * @param num       数字
     */
    void cartItemIncrementCount(@Param("studentNo") String studentNo, @Param("goodsId") int goodsId, @Param("num") int num);

    /**
     * 按学生编号获取购物车
     *
     * @param studentNo 学生编号
     * @return {@link List}<{@link Cart}>
     */
    List<Cart> getCartByStudentNo(@Param("studentNo") String studentNo);
}




