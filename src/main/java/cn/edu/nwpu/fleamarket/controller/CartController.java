package cn.edu.nwpu.fleamarket.controller;

import cn.edu.nwpu.fleamarket.data.CartItem;
import cn.edu.nwpu.fleamarket.pojo.Cart;
import cn.edu.nwpu.fleamarket.service.CartService;
import com.alibaba.fastjson2.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/cart")
public class CartController {
    @Autowired
    private CartService cartService;

    @PostMapping("/add")
    public void addCart(@RequestBody CartItem cartItem) {
        cartService.addCartItem(cartItem.getStudentNo(), cartItem.getGoodsId(), cartItem.getNum());
    }

    @GetMapping("/{studentNo}")
    public String getCart(@PathVariable("studentNo") String studentNo) {
        int studentNoInt = Integer.parseInt(studentNo);
        List<Cart> carts = cartService.getCartList(studentNoInt);
        return JSON.toJSONString(carts);
    }

}
