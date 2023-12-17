package cn.edu.nwpu.fleamarket.controller;

import cn.edu.nwpu.fleamarket.data.GoodsItem;
import cn.edu.nwpu.fleamarket.data.QueryRecord;
import cn.edu.nwpu.fleamarket.data.Review;
import cn.edu.nwpu.fleamarket.pojo.Goods;
import cn.edu.nwpu.fleamarket.pojo.Student;
import cn.edu.nwpu.fleamarket.service.CartService;
import cn.edu.nwpu.fleamarket.service.GoodsService;
import com.alibaba.fastjson2.JSON;
import jakarta.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload2.core.DiskFileItem;
import org.apache.commons.fileupload2.core.DiskFileItemFactory;
import org.apache.commons.fileupload2.core.FileItemFactory;
import org.apache.commons.fileupload2.jakarta.JakartaServletFileUpload;
import org.redisson.api.RBucket;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/goods")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private RedissonClient redissonClient;

    @Autowired
    private CartService cartService;

    private static final int PAGE_SIZE = 24;

    @RequestMapping("/insertGoods")
    public ModelAndView insertGoods(HttpServletRequest request, Goods goods) throws Exception {
        ModelAndView modelAndView = new ModelAndView();

        String goodsName = "";
        Double price = 0.0;
        String description = "";
        String cate = "";
        String fileName = "";
        String degree = "";
        String path = "";
        try {
            // 1. 文件上传工厂
            FileItemFactory<DiskFileItem> factory = DiskFileItemFactory.builder().get();
            // 2. 创建文件上传核心工具类
            JakartaServletFileUpload<DiskFileItem, FileItemFactory<DiskFileItem>> upload = new JakartaServletFileUpload<>(factory);
            // 一、设置单个文件允许的最大的大小： 30M
            upload.setFileSizeMax(30 * 1024 * 1024);
            // 二、设置文件上传表单允许的总大小: 80M
            upload.setSizeMax(80 * 1024 * 1024);
            // 三、 设置上传表单文件名的编码
            // 相当于：request.setCharacterEncoding("UTF-8");
            upload.setHeaderCharset(StandardCharsets.UTF_8);

            // 3. 判断： 当前表单是否为文件上传表单
            if (JakartaServletFileUpload.isMultipartContent(request)) {
                // 4. 把请求数据转换为一个个 DiskFileItem 对象，再用集合封装
                List<DiskFileItem> diskFileItemList = upload.parseRequest(request);
                // 遍历： 得到每一个上传的数据
                for (DiskFileItem diskFileItem : diskFileItemList) {
                    // 判断：普通文本数据
                    String fieldName = diskFileItem.getFieldName();    // 表单元素名称
// 表单元素名称
                    if (diskFileItem.isFormField()) {
                        // 普通文本数据
                        if ("goodsName".equals(fieldName)) {
                            goodsName = new String(diskFileItem.getString().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);// 表单元素名称， 对应的数据
                        }
                        if ("price".equals(fieldName)) {
                            price = Double.valueOf(diskFileItem.getString());
                        }
                        if ("description".equals(fieldName)) {
                            description = new String(diskFileItem.getString().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
                        }
                        if ("cate".equals(fieldName)) {
                            cate = diskFileItem.getString();
                        }
                        if ("degree".equals(fieldName)) {
                            degree = new String(diskFileItem.getString().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
                        }
                    }
                    // 上传文件(文件流) ----> 上传到upload目录下
                    else {
                        // 普通文本数据
                        String name = diskFileItem.getName();            // 文件名
                        String content = diskFileItem.getString();        // 表单元素名称， 对应的数据
                        String type = diskFileItem.getContentType();    // 文件类型
                        InputStream in = diskFileItem.getInputStream(); // 上传文件流

                        /* *  四、文件名重名
                         *  对于不同用户readme.txt文件，不希望覆盖！
                         *  后台处理： 给用户添加一个唯一标记!
                         **/


                        // a. 随机生成一个唯一标记
                        String id = UUID.randomUUID().toString();
                        // b. 与文件后锥名拼接
                        String suffix = name.substring(name.lastIndexOf(".") + 1);
                        fileName = id + "." + suffix;
                        // 获取上传基路径
                        path = request.getSession().getServletContext().getRealPath("/static/upload/file/");

                        // 创建目标文件
                        // 创建文件夹
                        File directory = new File(path);
                        if (directory.exists() || directory.mkdirs()) {
                            File file = new File(path, fileName);
                            // 工具类，文件上传
                            diskFileItem.write(Paths.get(file.toURI()));
                            diskFileItem.delete();   //删除系统产生的临时文件
                        }
                    }
                }
            } else {
                System.out.println("当前表单不是文件上传表单，处理失败！");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        Student student = (Student) request.getSession().getAttribute("student");

        goods.setStatus(0);
        goods.setGoodsStatus(0);
        goods.setPrice(price);
        goods.setCate(cate);
        goods.setDescription(description);
        goods.setGoodsName(goodsName);
        goods.setDegree(degree);
        goods.setImagePath(fileName);
        goods.setStudentNo(student.getStudentNo());
        goodsService.insertGoods(goods);
        modelAndView.setViewName("redirect:/views/managecenter");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping("/changeGoodsStatus")
    public ModelAndView changeGoodsStatus(HttpServletRequest request) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        String status = request.getParameter("status");
        String goodsId = request.getParameter("goodsId");

        Goods goods = new Goods();
        goods.setId(Integer.parseInt(goodsId));
        goods.setGoodsStatus(Integer.parseInt(status));
        goodsService.updateGoods(goods);

        modelAndView.setViewName("redirect:/views/management");
        return modelAndView;
    }

    /**
     * @return 下一个待审核
     */
    @ResponseBody
    @GetMapping("/next")
    public Goods getNext() {
        //悲观锁
        RLock lock = redissonClient.getLock("nextGoodsLock");
        lock.lock();
        try {
            Goods next = goodsService.getNextToBeReviewed();
            if (next == null) {
                return null;
            }
            goodsService.setAttributed(next.getId());
            // 设置键的生存时间为1小时
            redissonClient.getBucket("Goods:" + next.getId()).setAsync(1, 1, TimeUnit.HOURS);

            return next;
        } finally {
            lock.unlock();
        }
    }

    // 定期检查已分配商品是否已经被审核 如果发现1小时仍未被审核则重置
    @Scheduled(fixedRate = 60000) // 每分钟检查一次
    public void checkGoods() {
        //获取所有未被审核且已分配的商品
        List<Goods> goodsList = goodsService.getAllAttributedGoodsNotReviewed();
        for (Goods goods : goodsList) {
            RBucket<Object> bucket = redissonClient.getBucket("Goods:" + goods.getId());
            if (!bucket.isExists()) {
                goodsService.setUnAttributed(goods.getId());
            }
        }
    }

    @PutMapping("/update/unattributed")
    public void setUnAttributed(@RequestBody Goods goods) {
        goodsService.setUnAttributed(goods.getId());
    }

    @ResponseBody
    @PutMapping("/review")
    public String review(@RequestBody Review review) {
        if (goodsService.review(review.getId(), review.getStatus())) {
            return "ok";
        }
        return "err";
    }

    // 返回JSON
    @ResponseBody
    @RequestMapping("/category/{cate}/{page}")
    public String category(HttpServletRequest request,
                           @PathVariable("cate") int cate,
                           @PathVariable("page") int pageNum) {
        List<GoodsItem> goodsItemList = new ArrayList<>();
        // Student loginStudent = (Student) request.getSession().getAttribute("student");
        List<Goods> goodsList = goodsService.getGoodsByCategory(cate, pageNum, PAGE_SIZE);
        for (Goods goods : goodsList) {
           /* if (cartService.checkIsInCart(loginStudent.getStudentNo(), goods.getId())){
                continue;
            };*/
            GoodsItem goodsItem = new GoodsItem();
            goodsItem.setGoods(goods);
            System.out.println("goods.studentNo "+goods.getStudentNo());
            Student student = goodsService.getStudentByStudentNo(goods.getStudentNo());
            student.setPassword(null);
            goodsItem.setStudent(student);
            goodsItemList.add(goodsItem);
        }
        return JSON.toJSONString(goodsItemList);
    }

    //已售商品总数
    @ResponseBody
    @GetMapping("/sold/number")
    public int getSoldNum() {
        return goodsService.getSoldTotalCnt();
    }


    @ResponseBody
    @GetMapping("/sold/{page}")
    public List<Goods> getSoldGoodsByPage(@PathVariable("page") int page) {
        if (page <= 0) {
            return null;
        }
        return goodsService.getSoldByPage(page);
    }


    @GetMapping("/search")
    @ResponseBody
    public String search(HttpServletRequest request, @RequestParam("query") String query, @RequestParam("page") int page) {
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
        return JSON.toJSONString(goodsItemList);
    }


    /**
     * 查询交易记录
     * 使用post传递查询信息
     */
    @ResponseBody
    @PostMapping("/record/query")
    public List<Goods> queryByStudentNo(@RequestBody QueryRecord queryRecord) {
        if (queryRecord.getStart() == null || queryRecord.getEnd() == null) {
            if ("".equals(queryRecord.getQuery())) {
                //条件全空
                return goodsService.getAllSoldGoods();
            } else {
                //只根据query
                String query = "%" + queryRecord.getQuery() + "%";
                if (queryRecord.getType() == 0) {
                    //出售者学号
                    return goodsService.querySoldBySno(query);
                } else {
                    //购买者学号
                    return goodsService.querySoldByBno(query);
                }
            }
        } else if ("".equals(queryRecord.getQuery())) {
            //只根据日期
            return goodsService.getSoldGoodsByDate(queryRecord.getStart(), queryRecord.getEnd());
        } else {
            //根据日期与query
            String query = "%" + queryRecord.getQuery() + "%";
            List<Goods> list1 = goodsService.getSoldGoodsByDate(queryRecord.getStart(), queryRecord.getEnd());
            List<Goods> list2;
            if (queryRecord.getType() == 0) {
                list2 = goodsService.querySoldBySno(query);
            } else {
                list2 = goodsService.querySoldByBno(query);
            }
            //取交集

            Set<Integer> set1 = list1.stream().map(Goods::getId).collect(Collectors.toSet());
            Set<Integer> set2 = list2.stream().map(Goods::getId).collect(Collectors.toSet());

            set1.retainAll(set2);

            return list1.stream()
                    .filter(goods -> set1.contains(goods.getId()))
                    .toList();

        }
    }
}
