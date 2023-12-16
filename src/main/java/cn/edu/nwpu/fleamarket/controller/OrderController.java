package cn.edu.nwpu.fleamarket.controller;

import cn.edu.nwpu.fleamarket.dao.OrdersDao;
import cn.edu.nwpu.fleamarket.enums.OrderStatusEnum;
import cn.edu.nwpu.fleamarket.exception.BusinessException;
import cn.edu.nwpu.fleamarket.pojo.Goods;
import cn.edu.nwpu.fleamarket.pojo.Student;
import cn.edu.nwpu.fleamarket.service.GoodsService;
import cn.edu.nwpu.fleamarket.service.OrdersService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrdersService orderService;

    @Autowired
    private OrdersDao ordersDao;

    @Autowired
    private GoodsService goodsService;

    @GetMapping("/add")
    @ResponseBody
    public String addOrder(HttpServletRequest request, @RequestParam("id") Integer goodsId) {
        try {
            System.out.println(goodsId);
            Goods goods = goodsService.checkIsReviewedAndNotSold(goodsId);
            Student student = (Student) request.getSession().getAttribute("student");
            orderService.addOrder(goods, student.getStudentNo());
        }catch (BusinessException e) {
            return e.getMessage();
        }
        return "ok";
    }

    @GetMapping("/sellerconfirm")
    @ResponseBody
    public String sellerConfirmOrder(HttpServletRequest request, @RequestParam("id") Integer goodsId) {
        try {
            Student student = (Student) request.getSession().getAttribute("student");
            orderService.sellerConfirm(goodsId, Integer.valueOf(student.getStudentNo()));
        }catch (BusinessException e) {
            return e.getMessage();
        }
        return "ok";
    }

    @GetMapping("/buyerconfirm")
    @ResponseBody
    public String buyerConfirmOrder(HttpServletRequest request, @RequestParam("id") Integer goodsId) {
        try {
            Student student = (Student) request.getSession().getAttribute("student");
            orderService.buyerConfirm(goodsId, Integer.valueOf(student.getStudentNo()));
        }catch (BusinessException e) {
            return e.getMessage();
        }
        return "ok";
    }

    @GetMapping("/delete")
    @ResponseBody
    public String deleteOrder(HttpServletRequest request, @RequestParam("id") Integer goodsId) {
        try {
            Student student = (Student) request.getSession().getAttribute("student");
            orderService.deleteOrder(goodsId, Integer.valueOf(student.getStudentNo()));
        }catch (BusinessException e) {
            return e.getMessage();
        }
        return "ok";
    }

    @GetMapping("/buyercancel")
    @ResponseBody
    public String buyerCancelOrder(HttpServletRequest request, @RequestParam("id") Integer goodsId) {
        try {
            orderService.checkForCancel(goodsId);
            Student student = (Student) request.getSession().getAttribute("student");
            orderService.buyerCancel(goodsId, Integer.valueOf(student.getStudentNo()));
        }catch (BusinessException e) {
            return e.getMessage();
        }
        return "ok";
    }

    @GetMapping("/sellercancel")
    @ResponseBody
    public String sellerCancelOrder(HttpServletRequest request, @RequestParam("id") Integer goodsId) {
        try {
            orderService.checkForCancel(goodsId);
            Student student = (Student) request.getSession().getAttribute("student");
            orderService.sellerCancel(goodsId, Integer.valueOf(student.getStudentNo()));
        }catch (BusinessException e) {
            return e.getMessage();
        }
        return "ok";
    }

    @GetMapping("/check")
    @ResponseBody
    public Boolean checkOrder(HttpServletRequest request,
                             @RequestParam("status") String status,
                             @RequestParam("id") Integer goodsId) {
        if (status.equals(OrderStatusEnum.BUYER_CANCELED.getDesc())){
            return ordersDao.isBuyerCanceled(goodsId)==1;
        }
        if (status.equals(OrderStatusEnum.SELLER_CANCELED.getDesc())){
            return ordersDao.isSellerCanceled(goodsId)==1;
        }
        if (status.equals(OrderStatusEnum.SELLER_CONFIRM.getDesc())){
            return ordersDao.isSellerConfirmed(goodsId)==1;
        }
        return false;
    }

}
