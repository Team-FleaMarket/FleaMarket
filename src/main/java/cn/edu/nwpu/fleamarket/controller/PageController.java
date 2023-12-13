package cn.edu.nwpu.fleamarket.controller;

import cn.edu.nwpu.fleamarket.pojo.Goods;
import cn.edu.nwpu.fleamarket.pojo.Student;
import cn.edu.nwpu.fleamarket.service.GoodsService;
import cn.edu.nwpu.fleamarket.service.StudentService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("")
public class PageController {

    @Autowired
    private GoodsService goodsService;
    @Autowired
    private StudentService userService;

 /*   @RequestMapping("")
    public ModelAndView home(HttpServletRequest request)throws Exception{
        System.out.println(1231312);
        ModelAndView modelAndView = new ModelAndView();
        List<Goods> goodsList = goodsService.selectByStatusAndGoodsStatus();
        List<Goods> bookList = new ArrayList<Goods>();
        List<Goods> storeList = new ArrayList<Goods>();
        List<Goods> amazeList = new ArrayList<Goods>();

        ByCate(goodsList, bookList, storeList, amazeList);

        modelAndView.addObject("bookList", bookList);
        modelAndView.addObject("storeList", storeList);
        modelAndView.addObject("amazeList", amazeList);
        modelAndView.setViewName("home");
        return modelAndView;
    }*/

    @RequestMapping("/login")
    public ModelAndView login() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        return modelAndView;
    }

    @RequestMapping("/register")
    public ModelAndView register(HttpServletRequest request)throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("register");
        return modelAndView;
    }

    @RequestMapping("/views/managecenter")
    public ModelAndView managecenter(HttpServletRequest request)throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        String status = request.getParameter("status");
        Student student = (Student) request.getSession().getAttribute("student");
        if("".equals(status) || status == null) {
            status = "0";
            List<Goods> list = goodsService.selectByStatusAndStudentNo(Integer.valueOf(status), student.getStudentNo());
            modelAndView.addObject("status", status);
            modelAndView.addObject("goodsList", list);
        }
        else if("0".equals(status)||"1".equals(status))
        {
            List<Goods> list = goodsService.selectByStatusAndStudentNo(Integer.valueOf(status), student.getStudentNo());
            modelAndView.addObject("status", status);
            modelAndView.addObject("goodsList", list);
        }
        else if("2".equals(status)){
            System.out.println("select status==2");
            List<Goods> list = goodsService.selectByGoodsStatusAndStudentNo(Integer.valueOf("1"), student.getStudentNo());
            modelAndView.addObject("status", status);
            modelAndView.addObject("goodsList", list);
        }
        modelAndView.setViewName("managecenter");
        return modelAndView;
    }

    private void ByCate(List<Goods> goodsList, List<Goods> bookList, List<Goods> storeList, List<Goods> amazeList) {
        for (Goods goods : goodsList) {
            if ("1".equals(goods.getCate())) {
                bookList.add(goods);
            }
            if ("2".equals(goods.getCate())) {
                storeList.add(goods);
            }
            if ("3".equals(goods.getCate())) {
                amazeList.add(goods);
            }
        }
    }


    @RequestMapping("/checkout")
    public ModelAndView checkout(HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("checkout");
        return modelAndView;
    }



    @RequestMapping("/views/insert")
    public ModelAndView insert(HttpServletRequest request)throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("manage/insert");
        return modelAndView;
    }

    @RequestMapping("/products")
    public ModelAndView products(HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("goods/products");
        return modelAndView;
    }

    @RequestMapping("/views/books")
    public ModelAndView books(HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("navigation", "教材");
        List<Goods> goodsList = goodsService.selectAllGoods();
        List<Goods> bookList = new ArrayList<Goods>();
        List<Goods> storeList = new ArrayList<Goods>();
        List<Goods> amazeList = new ArrayList<Goods>();
        ByCate(goodsList, bookList, storeList, amazeList);
        modelAndView.addObject("bookCount", goodsService.selectCountByCateList(Arrays.asList(1, 2, 3)));
        modelAndView.addObject("storeCount", goodsService.selectCountByCateList(Arrays.asList(4, 5, 6)));
        modelAndView.addObject("amazeCount", goodsService.selectCountByCateList(Arrays.asList(7, 8, 9)));
        modelAndView.setViewName("goods/goodsview");
        return modelAndView;
    }

    @RequestMapping("/views/tests")
    public ModelAndView tests(HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("navigation", "考试");
        List<Goods> goodsList = goodsService.selectAllGoods();
        List<Goods> bookList = new ArrayList<Goods>();
        List<Goods> storeList = new ArrayList<Goods>();
        List<Goods> amazeList = new ArrayList<Goods>();
        ByCate(goodsList, bookList, storeList, amazeList);
        modelAndView.addObject("bookCount", goodsService.selectCountByCateList(Arrays.asList(1, 2, 3)));
        modelAndView.addObject("storeCount", goodsService.selectCountByCateList(Arrays.asList(4, 5, 6)));
        modelAndView.addObject("amazeCount", goodsService.selectCountByCateList(Arrays.asList(7, 8, 9)));
        modelAndView.setViewName("goods/goodsview");
        return modelAndView;
    }

    @RequestMapping("/views/literature")
    public ModelAndView literature(HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("navigation", "文学");
        List<Goods> goodsList = goodsService.selectAllGoods();
        List<Goods> bookList = new ArrayList<Goods>();
        List<Goods> storeList = new ArrayList<Goods>();
        List<Goods> amazeList = new ArrayList<Goods>();
        ByCate(goodsList, bookList, storeList, amazeList);
        modelAndView.addObject("bookCount", goodsService.selectCountByCateList(Arrays.asList(1, 2, 3)));
        modelAndView.addObject("storeCount", goodsService.selectCountByCateList(Arrays.asList(4, 5, 6)));
        modelAndView.addObject("amazeCount", goodsService.selectCountByCateList(Arrays.asList(7, 8, 9)));
        modelAndView.setViewName("goods/goodsview");
        return modelAndView;
    }

    @RequestMapping("/views/stationery")
    public ModelAndView stationery(HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("navigation", "文具");
        List<Goods> goodsList = goodsService.selectAllGoods();
        List<Goods> bookList = new ArrayList<Goods>();
        List<Goods> storeList = new ArrayList<Goods>();
        List<Goods> amazeList = new ArrayList<Goods>();
        ByCate(goodsList, bookList, storeList, amazeList);
        modelAndView.addObject("bookCount", goodsService.selectCountByCateList(Arrays.asList(1, 2, 3)));
        modelAndView.addObject("storeCount", goodsService.selectCountByCateList(Arrays.asList(4, 5, 6)));
        modelAndView.addObject("amazeCount", goodsService.selectCountByCateList(Arrays.asList(7, 8, 9)));
        modelAndView.setViewName("goods/goodsview");
        return modelAndView;
    }

    @RequestMapping("/views/life")
    public ModelAndView life(HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("navigation", "生活");
        List<Goods> goodsList = goodsService.selectAllGoods();
        List<Goods> bookList = new ArrayList<Goods>();
        List<Goods> storeList = new ArrayList<Goods>();
        List<Goods> amazeList = new ArrayList<Goods>();
        ByCate(goodsList, bookList, storeList, amazeList);
        modelAndView.addObject("bookCount", goodsService.selectCountByCateList(Arrays.asList(1, 2, 3)));
        modelAndView.addObject("storeCount", goodsService.selectCountByCateList(Arrays.asList(4, 5, 6)));
        modelAndView.addObject("amazeCount", goodsService.selectCountByCateList(Arrays.asList(7, 8, 9)));
        modelAndView.setViewName("goods/goodsview");
        return modelAndView;
    }

    @RequestMapping("/views/sports")
    public ModelAndView sports(HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("navigation", "运动");
        List<Goods> goodsList = goodsService.selectAllGoods();
        List<Goods> bookList = new ArrayList<Goods>();
        List<Goods> storeList = new ArrayList<Goods>();
        List<Goods> amazeList = new ArrayList<Goods>();
        ByCate(goodsList, bookList, storeList, amazeList);
        modelAndView.addObject("bookCount", goodsService.selectCountByCateList(Arrays.asList(1, 2, 3)));
        modelAndView.addObject("storeCount", goodsService.selectCountByCateList(Arrays.asList(4, 5, 6)));
        modelAndView.addObject("amazeCount", goodsService.selectCountByCateList(Arrays.asList(7, 8, 9)));
        modelAndView.setViewName("goods/goodsview");
        return modelAndView;
    }

    @RequestMapping("/views/beautymakeup")
    public ModelAndView beautymakeup(HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("navigation", "美妆");
        List<Goods> goodsList = goodsService.selectAllGoods();
        List<Goods> bookList = new ArrayList<Goods>();
        List<Goods> storeList = new ArrayList<Goods>();
        List<Goods> amazeList = new ArrayList<Goods>();
        ByCate(goodsList, bookList, storeList, amazeList);
        modelAndView.addObject("bookCount", goodsService.selectCountByCateList(Arrays.asList(1, 2, 3)));
        modelAndView.addObject("storeCount", goodsService.selectCountByCateList(Arrays.asList(4, 5, 6)));
        modelAndView.addObject("amazeCount", goodsService.selectCountByCateList(Arrays.asList(7, 8, 9)));
        modelAndView.setViewName("goods/goodsview");
        return modelAndView;
    }

    @RequestMapping("/views/electronicproducts")
    public ModelAndView electronicproducts(HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("navigation", "电子产品");
        List<Goods> goodsList = goodsService.selectAllGoods();
        List<Goods> bookList = new ArrayList<Goods>();
        List<Goods> storeList = new ArrayList<Goods>();
        List<Goods> amazeList = new ArrayList<Goods>();
        ByCate(goodsList, bookList, storeList, amazeList);
        modelAndView.addObject("bookCount", goodsService.selectCountByCateList(Arrays.asList(1, 2, 3)));
        modelAndView.addObject("storeCount", goodsService.selectCountByCateList(Arrays.asList(4, 5, 6)));
        modelAndView.addObject("amazeCount", goodsService.selectCountByCateList(Arrays.asList(7, 8, 9)));
        modelAndView.setViewName("goods/goodsview");
        return modelAndView;
    }

/*    @RequestMapping("/single")
    public ModelAndView single(HttpServletRequest request)throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        String goodsId = request.getParameter("goodsId");
        Goods goods = goodsService.selectById(Integer.valueOf(goodsId));
        User user = userService.findUser(goods.getStudentNo());

        List<Goods> goodsList = goodsService.selectByStatusAndGoodsStatus();
        List<Goods> bookList = new ArrayList<Goods>();
        List<Goods> storeList = new ArrayList<Goods>();
        List<Goods> amazeList = new ArrayList<Goods>();

        ByCate(goodsList, bookList, storeList, amazeList);

        modelAndView.addObject("bookList", bookList);
        modelAndView.addObject("storeList", storeList);
        modelAndView.addObject("amazeList", amazeList);

        modelAndView.addObject("user", student);
        modelAndView.addObject("goods", goods);
        modelAndView.setViewName("single");
        return modelAndView;
    }*/

}
