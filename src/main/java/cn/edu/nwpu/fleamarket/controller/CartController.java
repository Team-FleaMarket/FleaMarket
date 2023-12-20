package cn.edu.nwpu.fleamarket.controller;

import cn.edu.nwpu.fleamarket.data.CartItem;
import cn.edu.nwpu.fleamarket.data.GoodsItem;
import cn.edu.nwpu.fleamarket.pojo.Cart;
import cn.edu.nwpu.fleamarket.pojo.Goods;
import cn.edu.nwpu.fleamarket.pojo.Student;
import cn.edu.nwpu.fleamarket.service.CartService;
import cn.edu.nwpu.fleamarket.service.GoodsService;
import cn.edu.nwpu.fleamarket.service.StudentService;
import com.alibaba.fastjson2.JSON;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * 购物车控制器
 *
 * @author lsy
 * @date 2023/12/15
 */
@RestController
@RequestMapping("/cart")
public class CartController {
    /**
     * 购物车服务
     */
    @Autowired
    private CartService cartService;
    /**
     * 商品服务
     */
    @Autowired
    private GoodsService goodsService;
    /**
     * 学生服务
     */
    @Autowired
    private StudentService studentService;
    /**
     * 添加购物车
     * @param request
     * @param goodsId
     * @return
     * */
    @PostMapping("/add")
    public String addCart(HttpServletRequest request,  @RequestParam("goodsId") String goodsId) {
        Student loginStudent = (Student) request.getSession().getAttribute("student");
        cartService.addCartItem(loginStudent.getStudentNo(), Integer.parseInt(goodsId), 0);
        List<Cart> cartList = cartService.getCartList(loginStudent.getStudentNo());
        request.getSession().setAttribute("cartList", cartList);
        return "ok";
    }

    /**
     * 获取购物车列表
     * @return
     *
     * */
    @GetMapping("")
    public String getCart(HttpServletRequest request) {
        Student loginStudent = (Student) request.getSession().getAttribute("student");
        List<GoodsItem> goodsItemList = new ArrayList<>();
        List<Cart> cartList = cartService.getCartList(loginStudent.getStudentNo());
        for (Cart cart : cartList) {
            GoodsItem goodsItem = new GoodsItem();
            Goods goods = goodsService.selectById(cart.getGoodsId());
            goodsItem.setGoods(goods);
            Student student = studentService.getStudentByStudentNo(goods.getStudentNo());
            student.setPassword(null);
            goodsItem.setStudent(student);
            goodsItem.setInCart(true);
            goodsItemList.add(goodsItem);
        }
        return JSON.toJSONString(goodsItemList);
    }
}
