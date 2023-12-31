package cn.edu.nwpu.fleamarket.controller;

import cn.edu.nwpu.fleamarket.data.GoodsItem;
import cn.edu.nwpu.fleamarket.data.OrderInformation;
import cn.edu.nwpu.fleamarket.data.OrderInformationPageResult;
import cn.edu.nwpu.fleamarket.enums.ManageCenterStatusEnum;
import cn.edu.nwpu.fleamarket.pojo.Cart;
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

/**
 * 页面控制器
 *
 * @author lsy
 * @date 2023/12/15
 */
@Controller
@RequestMapping("")
public class PageController {

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
     * 购物车服务
     */
    @Autowired
    private CartService cartService;
    /**
     * 主页面商品数量
     */
    private static final int PAGE_SIZE = 24;
    /**
     * 个人中心商品数量
     */
    private static final int MANAGE_PAGE_SIZE = 5;
    /**
     * 类别
     */
    private static Map<String, List<String>> CATEGORIES = new LinkedHashMap<String, List<String>>();
    static {
        CATEGORIES = initCATEGORIES(); // 调用init函数初始化静态变量
    }

    /**
     * 初始化类别
     *
     * @return {@link Map}<{@link String}, {@link List}<{@link String}>>
     */
    private static Map<String, List<String>> initCATEGORIES() {
        Map<String, List<String>> categories = new LinkedHashMap<String, List<String>>();
        categories.put("图书书籍", List.of("教材", "考试", "艺术文学"));
        categories.put("日用百货", List.of("运动", "文具", "生活"));
        categories.put("娱乐", List.of("美妆", "电子产品"));
        return categories;
    }

    /**
     * 首页
     *
     * @param request 请求
     * @param cate    凯特
     * @param pageNum 页码
     * @return {@link ModelAndView}
     */
    @ResponseBody
    @RequestMapping("/views/{cate}/{page}")
    public ModelAndView category(HttpServletRequest request,
                                 @PathVariable("cate") int cate,
                                 @PathVariable("page") int pageNum) {
        // 从数据库中获取 goodsList
        List<GoodsItem> goodsItemList = new ArrayList<>();
        Student loginStudent = (Student) request.getSession().getAttribute("student");
        int pagesNum = goodsService.selectCountByCateList(Arrays.asList(cate)) / PAGE_SIZE + 1; // 当有 2 页商品时，得到的 pagesNum 是 1
        List<Goods> goodsList = goodsService.getGoodsByCategory(cate, pageNum, PAGE_SIZE);
        // 返回的 itemList 里面包含 goods 和 student，并且 goods 标识是否已在购物车
        for (Goods goods : goodsList) {
            GoodsItem goodsItem = new GoodsItem();
            if (cartService.checkIsInCart(loginStudent.getStudentNo(), goods.getId())){
                goodsItem.setInCart(true);
            } else {
                goodsItem.setInCart(false);
            }
            goodsItem.setGoods(goods);
            Student student = goodsService.getStudentByStudentNo(goods.getStudentNo());
            student.setPassword(null);
            goodsItem.setStudent(student);
            goodsItemList.add(goodsItem);
            System.out.println(goods.toString());
        }
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
        modelAndView.addObject("goodsItemList", goodsItemList);
        modelAndView.addObject("cate", cate);
        modelAndView.addObject("page", pageNum);
        modelAndView.addObject("pages", pagesNum);
        return modelAndView;
    }

    /**
     * 购物车
     *
     * @param request 请求
     * @param cate    商品类别
     * @param pageNum 页码
     * @return {@link ModelAndView}
     *//* @ResponseBody
    @RequestMapping("/views/{cate}/{page}")*/
    public ModelAndView categoryWithoutGoodsInCart(HttpServletRequest request,
                                 @PathVariable("cate") int cate,
                                 @PathVariable("page") int pageNum) {
        Student loginStudent = (Student) request.getSession().getAttribute("student");
        // cartList
        List<Cart> cartList = cartService.getCartList(loginStudent.getStudentNo());
        int cartListSize = cartList.size();
        // goodsList and goodsItemList
        int selectedPageSize = PAGE_SIZE + cartListSize; // 每页要查询的数量为 固定数量 + 购物车数量，然后去除购物车中的物品
        List<Goods> goodsList = goodsService.getGoodsByCategory(cate, pageNum, selectedPageSize);
        List<GoodsItem> goodsItemList = new ArrayList<>();
        // 返回的 itemList 里面包含 goods 和 student，并且 goods 标识是否已在购物车
        for (Goods goods : goodsList) {
            for (Cart cart : cartList) {
                if (cart.getGoodsId() == goods.getId()) {
                    // TODO
                }
            }
            if (cartService.checkIsInCart(loginStudent.getStudentNo(), goods.getId())){
                continue;
            }
            GoodsItem goodsItem = new GoodsItem();
            goodsItem.setGoods(goods);
            Student student = studentService.getStudentByStudentNo(goods.getStudentNo());
            student.setPassword(null);
            goodsItem.setStudent(student);
            goodsItemList.add(goodsItem);
        }
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
        int pagesNum = goodsService.selectCountByCateList(Arrays.asList(cate)) / PAGE_SIZE + 1; // 当有 2 页商品时，得到的 pagesNum 是 1
        // 返回 modelAndView
        ModelAndView modelAndView = new ModelAndView("goods/goodsview");
        modelAndView.addObject("mainCategory", category[0]);
        modelAndView.addObject("category", category[1]);
        modelAndView.addObject("goodsItemList", goodsItemList);
        modelAndView.addObject("cate", cate);
        modelAndView.addObject("page", pageNum);
        modelAndView.addObject("pages", pagesNum);
        return modelAndView;
    }

    /**
     * 购物车
     *
     * @param request 请求
     * @return {@link ModelAndView}
     */
    @ResponseBody
    @RequestMapping("/views/cart")
    public ModelAndView cart(HttpServletRequest request) {
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
        // 返回 modelAndView
        ModelAndView modelAndView = new ModelAndView("goods/goodscart");
        modelAndView.addObject("goodsItemList", goodsItemList);
        return modelAndView;
    }

    /**
     * 搜索
     *
     * @param request 请求
     * @param query   查询
     * @param page    页
     * @return {@link ModelAndView}
     */
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

    /**
     * 登录
     *
     * @return {@link ModelAndView}
     */
    @RequestMapping("/login")
    public ModelAndView login() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        return modelAndView;
    }

    /**
     * 注册
     *
     * @param request 请求
     * @return {@link ModelAndView}
     * @throws Exception
     */
    @RequestMapping("/register")
    public ModelAndView register(HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("register");
        return modelAndView;
    }

    /**
     * 注销
     *
     * @param request 请求
     * @return {@link ModelAndView}
     * @throws Exception
     */
    @RequestMapping("/logout")
    public ModelAndView logout(HttpServletRequest request) throws Exception {
        request.getSession().removeAttribute("student");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        return modelAndView;
    }

    /**
     * 管理中心
     *
     * @param request 请求
     * @return {@link ModelAndView}
     * @throws Exception
     */
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

    /**
     * 通过商品类别查询
     *
     * @param goodsList 货物清单
     * @param bookList  书单
     * @param storeList 列表
     * @param amazeList 列表
     */
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

    /**
     * 检查
     *
     * @param request 请求
     * @return {@link ModelAndView}
     * @throws Exception
     */
    @RequestMapping("/checkout")
    public ModelAndView checkout(HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("checkout");
        return modelAndView;
    }

    /**
     * 插入
     *
     * @param request 请求
     * @return {@link ModelAndView}
     * @throws Exception 例外
     */
    @RequestMapping("/views/insert")
    public ModelAndView insert(HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("manage/insert");
        return modelAndView;
    }

    /**
     * 修改信息
     *
     * @param request 请求
     * @return {@link ModelAndView}
     * @throws Exception 例外
     */
    @RequestMapping("/managecenter/modifyInfo")
    public ModelAndView modifyinfo(HttpServletRequest request)throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("manage/modifyInfo");
        return modelAndView;
    }

    /**
     * 商品
     *
     * @param request 请求
     * @return {@link ModelAndView}
     * @throws Exception 例外
     */
    @RequestMapping("/products")
    public ModelAndView products(HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("goods/products");
        return modelAndView;
    }
}
