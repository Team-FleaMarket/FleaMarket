package cn.edu.nwpu.fleamarket.controller;

import cn.edu.nwpu.fleamarket.dao.OrdersDao;
import cn.edu.nwpu.fleamarket.enums.OrderStatusEnum;
import cn.edu.nwpu.fleamarket.exception.BusinessException;
import cn.edu.nwpu.fleamarket.pojo.Goods;
import cn.edu.nwpu.fleamarket.pojo.Orders;
import cn.edu.nwpu.fleamarket.pojo.Student;
import cn.edu.nwpu.fleamarket.service.GoodsService;
import cn.edu.nwpu.fleamarket.service.OrdersService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
    public String addOrder(HttpServletRequest request, @RequestParam("goodsId") Integer goodsId) {
        try {
            System.out.println(goodsId);
            Goods goods = goodsService.checkIsReviewedAndNotSold(goodsId);
            Student student = (Student) request.getSession().getAttribute("student");
            orderService.addOrder(goods, student.getStudentNo());
        } catch (BusinessException e) {
            System.out.println(e.getMessage());
            return e.getMessage();
        }
        return "ok";
    }

    @GetMapping("/sellerconfirm")
    @ResponseBody
    public String sellerConfirmOrder(HttpServletRequest request, @RequestParam("id") String orderId) {
        try {
            Student student = (Student) request.getSession().getAttribute("student");
            orderService.sellerConfirm(Integer.valueOf(orderId), Integer.valueOf(student.getStudentNo()));
        } catch (BusinessException e) {
            return e.getMessage();
        }

        return "ok";
    }

    @GetMapping("/buyerconfirm")
    @ResponseBody
    public String buyerConfirmOrder(HttpServletRequest request, @RequestParam("id") Integer orderId) {
        try {
            Student student = (Student) request.getSession().getAttribute("student");
            orderService.buyerConfirm(orderId, Integer.valueOf(student.getStudentNo()));
        } catch (BusinessException e) {
            return e.getMessage();
        }
        return "ok";
    }


//    public String deleteOrder(HttpServletRequest request, @RequestParam("id") Integer orderId) {
//        try {
//            Student student = (Student) request.getSession().getAttribute("student");
//            orderService.deleteOrder(orderId, Integer.valueOf(student.getStudentNo()));
//        }catch (BusinessException e) {
//            return e.getMessage();
//        }
//        return "ok";
//    }

    @GetMapping("/cancel")
    @ResponseBody
    public String cancelOrder(HttpServletRequest request, @RequestParam("id") Integer orderId) {
        try {
            Orders orders = ordersDao.selectById(orderId);
            Goods goods = goodsService.selectById(orders.getGoodsId());
            //Goods goods = goodsService.checkIsReviewedAndNotSold(orders.getGoodsId());
            orderService.checkForCancel(goods.getId());
            Student student = (Student) request.getSession().getAttribute("student");
            orderService.cancelOrder(orderId, Integer.valueOf(student.getStudentNo()));
        } catch (BusinessException e) {
            System.out.println(e.getMessage());
            return e.getMessage();
        }
        return "ok";
    }

    @GetMapping("/check")
    @ResponseBody
    public Boolean checkOrder(HttpServletRequest request,
                              @RequestParam("status") String status,
                              @RequestParam("id") String orderId) {
        System.out.println("SSSSSSSSSSSSSSSSSS" + orderId);
        if (status.equals(OrderStatusEnum.IS_CANCELED.getDesc())) {
            return ordersDao.isCanceled(Integer.valueOf(orderId)) == 1;
        }
        if (status.equals(OrderStatusEnum.BUYER_CONFIRM.getDesc())) {
            return ordersDao.isBuyerConfirmd(Integer.valueOf(orderId)) == 1;
        }
        if (status.equals(OrderStatusEnum.SELLER_CONFIRM.getDesc())) {
            return ordersDao.isSellerConfirmed(Integer.valueOf(orderId)) == 1;
        }
        return false;
    }

}
