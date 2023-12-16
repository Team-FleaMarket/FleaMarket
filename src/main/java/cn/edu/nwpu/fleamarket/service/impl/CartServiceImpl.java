package cn.edu.nwpu.fleamarket.service.impl;

import cn.edu.nwpu.fleamarket.dao.CartDao;
import cn.edu.nwpu.fleamarket.pojo.Cart;
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
    @Autowired
    private CartDao cartDao;


    @Override
    public void addCartItem(String studentNo, int goodsId, int num) {
        if (cartDao.getCartItemByStudentNoAndGoodsId(studentNo, goodsId)==null){
            cartDao.addCartItem(studentNo, goodsId);
        }else {
            cartDao.cartItemIncrementCount(studentNo, goodsId, num);
        }
    }

    @Override
    public List<Cart> getCartList(String studentNo) {
        return cartDao.getCartByStudentNo(studentNo);
    }

}




