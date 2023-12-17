package cn.edu.nwpu.fleamarket.controller;

import cn.edu.nwpu.fleamarket.data.CartItem;
import cn.edu.nwpu.fleamarket.pojo.Cart;
import cn.edu.nwpu.fleamarket.service.CartService;
import com.alibaba.fastjson2.JSON;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/cart")
public class CartController {
    @Autowired
    private CartService cartService;

    /**
     * 添加购物车
     * @param request
     * @param cartItem
     * @return
     * */
    @PostMapping("/add")
    public String addCart(HttpServletRequest request,  @RequestBody CartItem cartItem) {
        cartService.addCartItem(cartItem.getStudentNo(), cartItem.getGoodsId(), cartItem.getNum());
        List<Cart> cartList = cartService.getCartList(cartItem.getStudentNo());
        request.getSession().setAttribute("cartList", cartList);
        return "ok";
    }

    /**
     * 获取购物车列表
     * @param studentNo
     * @return
     *
     * */
    @GetMapping("/{studentNo}")
    public String getCart(@PathVariable("studentNo") String studentNo) {
        List<Cart> carts = cartService.getCartList(studentNo);
        return JSON.toJSONString(carts);
    }
}
