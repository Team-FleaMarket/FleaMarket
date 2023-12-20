package cn.edu.nwpu.fleamarket.service.impl;

import cn.edu.nwpu.fleamarket.dao.CartDao;
import cn.edu.nwpu.fleamarket.pojo.Cart;
import cn.edu.nwpu.fleamarket.pojo.Goods;
import cn.edu.nwpu.fleamarket.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @author xh254
* @description 针对表【cart】的数据库操作Service实现
* @createDate 2023-12-15 16:21:25
*/
@Service
public class CartServiceImpl implements CartService{
    /**
     * 购物车
     */
    @Autowired
    private CartDao cartDao;

    /**
     * 添加购物车项目
     *
     * @param studentNo 学生编号
     * @param goodsId   商品编号
     * @param num       数字
     */
    @Override
    public void addCartItem(String studentNo, int goodsId, int num) {
        System.out.println(num);
        if (cartDao.getCartItemByStudentNoAndGoodsId(studentNo, goodsId)==null){
            cartDao.addCartItem(studentNo, goodsId);
        }else {
            cartDao.cartItemIncrementCount(studentNo, goodsId, num);
        }
    }

    /**
     * 获取购物车列表
     *
     * @param studentNo 学生编号
     * @return {@link List}<{@link Cart}>
     */
    @Override
    public List<Cart> getCartList(String studentNo) {
        return cartDao.getCartByStudentNo(studentNo);
    }

    /**
     * 检测是否在购物车中
     *
     * @param studentNo 学生编号
     * @param goodsId   商品编号
     * @return {@link Boolean}
     */
    @Override
    public Boolean checkIsInCart(String studentNo, int goodsId) {
        return cartDao.getCartItemByStudentNoAndGoodsId(studentNo, goodsId)!=null;
    }

}




