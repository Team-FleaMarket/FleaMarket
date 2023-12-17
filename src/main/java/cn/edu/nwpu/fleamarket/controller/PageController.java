package cn.edu.nwpu.fleamarket.controller;

import cn.edu.nwpu.fleamarket.data.GoodsItem;
import cn.edu.nwpu.fleamarket.data.OrderInformation;
import cn.edu.nwpu.fleamarket.data.OrderInformationPageResult;
import cn.edu.nwpu.fleamarket.enums.ManageCenterStatusEnum;
import cn.edu.nwpu.fleamarket.pojo.Goods;
import cn.edu.nwpu.fleamarket.pojo.Student;
import cn.edu.nwpu.fleamarket.service.CartService;
import cn.edu.nwpu.fleamarket.service.GoodsService;
import cn.edu.nwpu.fleamarket.service.StudentService;
import jakarta.persistence.criteria.Order;
import com.alibaba.fastjson2.JSON;
import jakarta.servlet.http.HttpServletRequest;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

@Controller
@RequestMapping("")
public class PageController {

    @Autowired
    private GoodsService goodsService;
    @Autowired
    private StudentService userService;
    @Autowired
    private CartService cartService;
    private static final int PAGE_SIZE = 24;
    private static final int MANAGE_PAGE_SIZE = 5;
    private static Map<String, List<String>> CATEGORIES = new LinkedHashMap<String, List<String>>();
    static {
        CATEGORIES = initCATEGORIES(); // 调用init函数初始化静态变量
    }
    private static Map<String, List<String>> initCATEGORIES() {
        Map<String, List<String>> categories = new LinkedHashMap<String, List<String>>();
        categories.put("图书书籍", List.of("教材", "考试", "艺术文学"));
        categories.put("日用百货", List.of("运动", "文具", "生活"));
        categories.put("娱乐", List.of("美妆", "电子产品"));
        return categories;
    }



    /*   @RequestMapping("")
       public ModelAndView home(HttpServletRequest request)throws Exception{
           System.out.println(1231312);
           ModelAndView modelAndView = new ModelAndView();
           List<Goods> goodsList = goodsService.selectByStatusAndGoodsStatus();
           List<Goods> bookList = new ArrayList<Goods>();
           List<Goods> storeList = new ArrayList<Goods>();
           List<Goods> amazeList = new ArrayList<Goods>();

    @ResponseBody
    @RequestMapping("/views/{cate}/{page}")
    public ModelAndView category(HttpServletRequest request,
                                 @PathVariable("cate") int cate,
                                 @PathVariable("page") int pageNum) {
        // 从数据库中获取 goodsList
        List<Goods> goodsList = goodsService.getGoodsByCategory(cate, pageNum, PAGE_SIZE);
        int pagesNum = goodsService.selectCountByCateList(Arrays.asList(cate)) / PAGE_SIZE + 1; // 当有 2 页商品时，得到的 pagesNum 是 1
        // 根据 cate 获取对应中文
        String[] category = new String[2];
        int remainingCate = cate;
        for (Map.Entry<String, List<String>> entry : CATEGORIES.entrySet()) {
            List<String> valueList = entry.getValue();
            if (remainingCate <= valueList.size()) {
                category[0] = entry.getKey();
                category[1] = valueList.get(remainingCate - 1);
                break;
            } else {
                remainingCate -= valueList.size();
            }
        }
        // 返回 modelAndView
        ModelAndView modelAndView = new ModelAndView("goods/goodsview");
        modelAndView.addObject("mainCategory", category[0]);
        modelAndView.addObject("category", category[1]);
        modelAndView.addObject("goodsList", goodsList);
        modelAndView.addObject("cate", cate);
        modelAndView.addObject("page", pageNum);
        modelAndView.addObject("pages", pagesNum);
        return modelAndView;
    }
           ByCate(goodsList, bookList, storeList, amazeList);

           modelAndView.addObject("bookList", bookList);
           modelAndView.addObject("storeList", storeList);
           modelAndView.addObject("amazeList", amazeList);
           modelAndView.setViewName("home");
           return modelAndView;
       }*/
    @ResponseBody
    @RequestMapping("/views/{cate}/{page}")
    public ModelAndView category(HttpServletRequest request,
                                 @PathVariable("cate") int cate,
                                 @PathVariable("page") int pageNum) {
        List<Goods> goodsList = goodsService.getGoodsByCategory(cate, pageNum, PAGE_SIZE);
        ModelAndView modelAndView = new ModelAndView("goods/goodsview");
        modelAndView.addObject("goodsList", goodsList);
        modelAndView.addObject("cate", cate);
        modelAndView.addObject("page", pageNum);
        return modelAndView;
    }

    @GetMapping("/search")
    @ResponseBody
    public ModelAndView search(HttpServletRequest request, @RequestParam("query") String query, @RequestParam("page") int page) {
        List<GoodsItem> goodsItemList = new ArrayList<>();
        Student loginStudent = (Student) request.getSession().getAttribute("student");
        List<Goods> goodsList = goodsService.selectByGoodsName(query, page, PAGE_SIZE);
        for (Goods goods : goodsList) {
            if (cartService.checkIsInCart(loginStudent.getStudentNo(), goods.getId())){
                continue;
            };
            GoodsItem goodsItem = new GoodsItem();
            goodsItem.setGoods(goods);
            Student student = goodsService.getStudentByStudentNo(goods.getStudentNo());
            student.setPassword(null);
            goodsItem.setStudent(student);
            goodsItemList.add(goodsItem);
        }
        ModelAndView modelAndView = new ModelAndView("goods/goodsview");
        return modelAndView;
    }
  
    @RequestMapping("/login")
    public ModelAndView login() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        return modelAndView;
    }

    @RequestMapping("/register")
    public ModelAndView register(HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("register");
        return modelAndView;
    }

    @RequestMapping("/logout")
    public ModelAndView logout(HttpServletRequest request) throws Exception {
        request.getSession().removeAttribute("student");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        return modelAndView;
    }

    @RequestMapping("/views/managecenter")
    public ModelAndView managecenter(HttpServletRequest request )throws Exception{
        String str_option = request.getParameter("status");
        if (str_option == null|| str_option.equals("")  ){
            str_option = "0";
        }
        ManageCenterStatusEnum option = ManageCenterStatusEnum.getByCode(
                Integer.valueOf(str_option));
        Enumeration<String> attributeNames = request.getSession().getAttributeNames();
        while (attributeNames.hasMoreElements()) {
            System.out.println(attributeNames.nextElement());
        }
        ModelAndView modelAndView = new ModelAndView();

        int totalCnt = 0;
        int currentPage;
        boolean isSearching = false;
        Student student = (Student) request.getSession().getAttribute("student");
        String goodsName = request.getParameter("searchInput");
        if (goodsName != null) {
            isSearching = true;
        }
        int totalPage = 0;
        List<Goods> searchList = null;
        if("".equals(request.getParameter("currentPage"))||request.getParameter("currentPage")==null)
        {
            currentPage=0;
        }
        else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
            if(currentPage<0)
            {
                currentPage=0;
            }
        }

        OrderInformationPageResult orderInformationPageResult = new OrderInformationPageResult();
        System.out.println("option: " + option);
        if(option.equals(ManageCenterStatusEnum.NOT_REVIEWED))
        {
             orderInformationPageResult = goodsService.getNotReviewed(isSearching, goodsName, student.getStudentNo(),currentPage);
        } else if (option.equals(ManageCenterStatusEnum.NOT_SOLD)) {
             orderInformationPageResult = goodsService.getNotSold(isSearching, goodsName, student.getStudentNo(),currentPage);
        } else if(option.equals(ManageCenterStatusEnum.SOLD)){
             orderInformationPageResult = goodsService.getSold(isSearching, goodsName, student.getStudentNo(),currentPage);
        } else if (option.equals(ManageCenterStatusEnum.MY_PURCHASE)){
             orderInformationPageResult = goodsService.getMyPurchase(isSearching, goodsName, student.getStudentNo(),currentPage);
        } else if (option.equals(ManageCenterStatusEnum.IN_PROGRESS)){
             orderInformationPageResult = goodsService.getInProgress(isSearching, goodsName, student.getStudentNo(),currentPage);
        } else if (option.equals(ManageCenterStatusEnum.REVIEWED_FAIL)){
             orderInformationPageResult = goodsService.getReviewedFail(isSearching, goodsName, student.getStudentNo(),currentPage);
        }
        if (orderInformationPageResult!=null && orderInformationPageResult.getOrderInformationList()!=null)
            for (OrderInformation orderInformation : orderInformationPageResult.getOrderInformationList()) {
                System.out.println(orderInformation.toString());
        }
        System.out.println("Total pages: " + orderInformationPageResult.getTotalPage() + "\n");
        modelAndView.addObject("status", option.getCode().toString());


        modelAndView.addObject("orderInformationPageResult", orderInformationPageResult);
        modelAndView.addObject("currentPage", currentPage);
        modelAndView.addObject("totalPage", orderInformationPageResult.getTotalPage());
        modelAndView.addObject("totalCnt",  orderInformationPageResult.getTotalCount());
        modelAndView.addObject("searchText",goodsName);
        modelAndView.setViewName("manage/managecenter");
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
    public ModelAndView insert(HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("manage/insert");
        return modelAndView;
    }

    @RequestMapping("/managecenter/modifyInfo")
    public ModelAndView modifyinfo(HttpServletRequest request)throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("manage/modifyInfo");
        return modelAndView;
    }

    @RequestMapping("/products")
    public ModelAndView products(HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("goods/products");
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
