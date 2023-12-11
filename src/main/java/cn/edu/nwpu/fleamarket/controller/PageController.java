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
import java.util.List;

@Controller
@RequestMapping("")
public class PageController {

    @Autowired
    private GoodsService goodsService;
    @Autowired
    private StudentService userService;

    @RequestMapping("/home")
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
    }

    private void ByCate(List<Goods> goodsList, List<Goods> bookList, List<Goods> storeList, List<Goods> amazeList) {
        for(Goods goods : goodsList) {
            if("1".equals(goods.getCate())){
                bookList.add(goods);
            }
            if("2".equals(goods.getCate())) {
                storeList.add(goods);
            }
            if("3".equals(goods.getCate())) {
                amazeList.add(goods);
            }
        }
    }

    @RequestMapping("/beautymakeup")
    public ModelAndView beautymakeup(HttpServletRequest request)throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        List<Goods> goodsList = goodsService.selectByStatusAndGoodsStatus();
        List<Goods> bookList = new ArrayList<Goods>();
        List<Goods> storeList = new ArrayList<Goods>();
        List<Goods> amazeList = new ArrayList<Goods>();

        ByCate(goodsList, bookList, storeList, amazeList);

        modelAndView.addObject("bookList", bookList);
        modelAndView.addObject("storeList", storeList);
        modelAndView.addObject("amazeList", amazeList);
        modelAndView.setViewName("beautymakeup");
        return modelAndView;
    }

    @RequestMapping("/books")
    public ModelAndView books(HttpServletRequest request)throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        List<Goods> goodsList = goodsService.selectByStatusAndGoodsStatus();
        List<Goods> bookList = new ArrayList<Goods>();
        List<Goods> storeList = new ArrayList<Goods>();
        List<Goods> amazeList = new ArrayList<Goods>();
        ByCate(goodsList, bookList, storeList, amazeList);
        modelAndView.addObject("bookList", bookList);
        modelAndView.addObject("storeList", storeList);
        modelAndView.addObject("amazeList", amazeList);
        modelAndView.setViewName("books");
        return modelAndView;
    }

    @RequestMapping("/checkout")
    public ModelAndView checkout(HttpServletRequest request)throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("checkout");
        return modelAndView;
    }

    @RequestMapping("/electronicproducts")
    public ModelAndView electronicproducts(HttpServletRequest request)throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        List<Goods> goodsList = goodsService.selectByStatusAndGoodsStatus();
        List<Goods> bookList = new ArrayList<Goods>();
        List<Goods> storeList = new ArrayList<Goods>();
        List<Goods> amazeList = new ArrayList<Goods>();
        ByCate(goodsList, bookList, storeList, amazeList);
        modelAndView.addObject("bookList", bookList);
        modelAndView.addObject("storeList", storeList);
        modelAndView.addObject("amazeList", amazeList);
        modelAndView.setViewName("electronicproducts");
        return modelAndView;
    }


    @RequestMapping("/insert")
    public ModelAndView insert(HttpServletRequest request)throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("insert");
        return modelAndView;
    }

    @RequestMapping("/life")
    public ModelAndView life(HttpServletRequest request)throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        List<Goods> goodsList = goodsService.selectByStatusAndGoodsStatus();
        List<Goods> bookList = new ArrayList<Goods>();
        List<Goods> storeList = new ArrayList<Goods>();
        List<Goods> amazeList = new ArrayList<Goods>();

        ByCate(goodsList, bookList, storeList, amazeList);

        modelAndView.addObject("bookList", bookList);
        modelAndView.addObject("storeList", storeList);
        modelAndView.addObject("amazeList", amazeList);
        modelAndView.setViewName("life");
        return modelAndView;
    }

    @RequestMapping("/literature")
    public ModelAndView literature(HttpServletRequest request)throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        List<Goods> goodsList = goodsService.selectByStatusAndGoodsStatus();
        List<Goods> bookList = new ArrayList<Goods>();
        List<Goods> storeList = new ArrayList<Goods>();
        List<Goods> amazeList = new ArrayList<Goods>();

        ByCate(goodsList, bookList, storeList, amazeList);

        modelAndView.addObject("bookList", bookList);
        modelAndView.addObject("storeList", storeList);
        modelAndView.addObject("amazeList", amazeList);
        modelAndView.setViewName("literature");
        return modelAndView;
    }

    @RequestMapping("/login")
    public String login() {
        return "login";
    }
    @RequestMapping("/managecenter")
    public ModelAndView managecenter(HttpServletRequest request)throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        String status = request.getParameter("status");
        Student student = (Student) request.getSession().getAttribute("student");
        if("".equals(status) || status == null) {
            status = "0";
        }
        List<Goods> list = goodsService.selectByStatusAndStudentNo(Integer.valueOf(status), student.getStudentNo());
        modelAndView.addObject("status", status);
        modelAndView.addObject("goodsList", list);
        modelAndView.setViewName("managecenter");
        return modelAndView;
    }
    @RequestMapping("/products")
    public ModelAndView products(HttpServletRequest request)throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("products");
        return modelAndView;
    }
    @RequestMapping("/register")
    public ModelAndView register(HttpServletRequest request)throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("register");
        return modelAndView;
    }


    @RequestMapping("/sports")
    public ModelAndView sports(HttpServletRequest request)throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        List<Goods> goodsList = goodsService.selectByStatusAndGoodsStatus();
        List<Goods> bookList = new ArrayList<Goods>();
        List<Goods> storeList = new ArrayList<Goods>();
        List<Goods> amazeList = new ArrayList<Goods>();

        ByCate(goodsList, bookList, storeList, amazeList);

        modelAndView.addObject("bookList", bookList);
        modelAndView.addObject("storeList", storeList);
        modelAndView.addObject("amazeList", amazeList);
        modelAndView.setViewName("sports");
        return modelAndView;
    }

    @RequestMapping("/stationery")
    public ModelAndView stationery(HttpServletRequest request)throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        List<Goods> goodsList = goodsService.selectByStatusAndGoodsStatus();
        List<Goods> bookList = new ArrayList<Goods>();
        List<Goods> storeList = new ArrayList<Goods>();
        List<Goods> amazeList = new ArrayList<Goods>();

        ByCate(goodsList, bookList, storeList, amazeList);

        modelAndView.addObject("bookList", bookList);
        modelAndView.addObject("storeList", storeList);
        modelAndView.addObject("amazeList", amazeList);
        modelAndView.setViewName("stationery");
        return modelAndView;
    }

    @RequestMapping("/tests")
    public ModelAndView tests(HttpServletRequest request)throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        List<Goods> goodsList = goodsService.selectByStatusAndGoodsStatus();
        List<Goods> bookList = new ArrayList<Goods>();
        List<Goods> storeList = new ArrayList<Goods>();
        List<Goods> amazeList = new ArrayList<Goods>();

        ByCate(goodsList, bookList, storeList, amazeList);

        modelAndView.addObject("bookList", bookList);
        modelAndView.addObject("storeList", storeList);
        modelAndView.addObject("amazeList", amazeList);
        modelAndView.setViewName("tests");
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
