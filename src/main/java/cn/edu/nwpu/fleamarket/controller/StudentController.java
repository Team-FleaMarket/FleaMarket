package cn.edu.nwpu.fleamarket.controller;

import cn.edu.nwpu.fleamarket.pojo.Goods;
import cn.edu.nwpu.fleamarket.pojo.Cart;
import cn.edu.nwpu.fleamarket.pojo.Student;
import cn.edu.nwpu.fleamarket.service.CartService;
import cn.edu.nwpu.fleamarket.service.GoodsService;
import cn.edu.nwpu.fleamarket.service.StudentService;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 学生
 *
 * @author lsy
 * @date 2023/12/15
 */
@Controller
@RequestMapping("/student")
public class StudentController {

    /**
     * 学生
     */
    @Autowired
    private StudentService studentService;
    /**
     * 购物车
     */
    @Autowired
    private CartService cartService;

    /**
     * 登录
     *
     * @param request  请求
     * @param response 响应
     * @param student  学生
     * @return {@link ResponseEntity}<{@link ?}>
     * @throws Exception
     */
    @PostMapping("/login")
    public ResponseEntity<?> login(HttpServletRequest request, HttpServletResponse response, @RequestBody Student student) throws Exception{
        Student databaseStudent = studentService.loginStudent(student);
        List<Cart> cartList = cartService.getCartList(student.getStudentNo());
        if (databaseStudent == null) {
            return ResponseEntity.badRequest().body("用户名或密码错误！");
        }
        // 存储 session
        request.getSession().setAttribute("student", databaseStudent);
        request.getSession().setAttribute("cartList", cartList);
        // 存储 nameCookie
        Cookie nameCookie = new Cookie("studentName", databaseStudent.getName());
        Cookie studentNoCookie = new Cookie("studentNo", databaseStudent.getStudentNo());
        nameCookie.setPath("/"); // 设置路径为根路径
        studentNoCookie.setPath("/"); // 设置路径为根路径
        response.addCookie(nameCookie);
        response.addCookie(studentNoCookie);
        return ResponseEntity.ok("登录成功！");
    }

    /**
     * 添加商品
     *
     * @param request       请求
     * @param multipartFile multipart 文件
     * @return {@link ModelAndView}
     * @throws Exception
     */
    @PostMapping("/addAvatar")
    public ModelAndView insertGoods(HttpServletRequest request,@RequestParam("files[]") MultipartFile multipartFile) throws Exception {


        ModelAndView modelAndView = new ModelAndView();
        Student student = (Student) request.getSession().getAttribute("student");
        System.out.println("multipartFile.getName() "+multipartFile.getName());
        String name = multipartFile.getName();            // 文件名
        String type = multipartFile.getContentType();    // 文件类型



        // a. 随机生成一个唯一标记
        // b. 与文件后锥名拼接
        String suffix = type.substring(type.lastIndexOf("/") + 1);
        String fileName = student.getStudentNo() + "." + suffix;
        student.setImg(1);
        // 获取上传基路径
        String path = request.getSession().getServletContext().getRealPath("src/main/webapp/static/images/avatar");

        // 创建目标文件
        // 创建文件夹
        File directory = new File(path);
        if (directory.exists() || directory.mkdirs()) {
            File file = new File(path, fileName);
            // 工具类，文件上传
            System.out.println(path);
            multipartFile.transferTo(file);
        }

        modelAndView.setViewName("redirect:/views/managecenter");
        return modelAndView;
    }

    /**
     * 注册
     *
     * @param request  请求
     * @param response 响应
     * @param student  学生
     * @return {@link ResponseEntity}<{@link ?}>
     * @throws Exception 例外
     */
    @RequestMapping("/register")
    public ResponseEntity<?> register(HttpServletRequest request, HttpServletResponse response, @RequestBody Student student) throws Exception{
        student.setImagePath("https://img.zcool.cn/community/01f4865b2625d3a8012034f70e2a54.jpg@1280w_1l_2o_100sh.jpg");
        student.setDescription("这位同学什么都没留下...");
        // 若已注册
        if (studentService.registerStudent(student) != null) {
            return ResponseEntity.badRequest().body("该学号已经被注册！");
        }
        // 若未注册
        // 存储 session
        List<Cart> cartList = cartService.getCartList(student.getStudentNo());
        request.getSession().setAttribute("student", student);
        request.getSession().setAttribute("cartList", cartList);
        // 存储 nameCookie
        Cookie nameCookie = new Cookie("studentName", student.getName());
        Cookie studentNoCookie = new Cookie("studentNo", student.getStudentNo());
        nameCookie.setPath("/"); // 设置路径为根路径
        studentNoCookie.setPath("/"); // 设置路径为根路径
        response.addCookie(nameCookie);
        response.addCookie(studentNoCookie);
        return ResponseEntity.ok("注册成功！");
    }

    /**
     * 判断是否为json
     *
     * @param value 价值
     * @return boolean
     */
    public static boolean isJson(String value) {
        try {
            new JSONObject(value);
        } catch (JSONException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    /**
     * 管理员登录
     *
     * @param username 用户名
     * @param pwd      PWD系列
     * @return boolean
     */
    public boolean adminLogin(String username,String pwd) {
        return false;
    }


    /**
     * 注销
     *
     * @param request 请求
     * @return {@link ModelAndView}
     */
    @RequestMapping("/logout")
    public ModelAndView logout(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        // 设置session为空
        request.getSession().setAttribute("user",null);
        //页面跳转
        modelAndView.setViewName("login");
        return modelAndView;
    }


    /**
     * 接收用户头像
     *
     * @param image   头像图片数据
     * @param request 请求
     */
    @ResponseBody
    @PostMapping("/upload")
    public void avatar(HttpServletRequest request, @RequestParam("image") MultipartFile image) {
        Student student = (Student) request.getSession().getAttribute("student");
        String studentNo = student.getStudentNo();
        String path = request.getSession().getServletContext().getRealPath("/static/images/avatar");
        System.out.println(path);

        // 创建文件路径
        String filename = path + "/" + studentNo + ".jpg";
        File file = new File(filename);

        // 将图像保存到文件中
        try {
            image.transferTo(file);
            System.out.println("Image saved successfully!");
        } catch (IOException e) {
            e.printStackTrace();
        }
        student.setImg(1);
        //设为有自定义头像
        studentService.setImg(studentNo);
    }

    /**
     * 返回用户总数
     *
     * @return 用户总数
     */
    @ResponseBody
    @GetMapping("/count")
    public int count() {
        return studentService.countAll();
    }

    /**
     * 获取某页面数据 一页展示6个用户
     *
     * @param page 页面
     * @return 用户集合
     */
    @ResponseBody
    @GetMapping("/page/{page}")
    public List<Student> getByPage(@PathVariable("page") int page) {
        if(page <= 0) {
            return null;
        }
        return studentService.getStudentsByPage(page);
    }

    /**
     * 更新user
     *
     * @param student 更新内容
     * @param request 请求
     * @return 结果
     */
    @ResponseBody
    @PutMapping

    public String update(HttpServletRequest request, @RequestBody Student student) {
        if(studentService.updateStudent(student)) {
            request.getSession().setAttribute("student", studentService.getStudentByStudentNo(student.getStudentNo()));
            return "ok";
        }
        return "err";
    }

    /**
     * 用户查询 根据用户名
     * GET /user/username?query=
     *
     * @param query 查询
     * @return {@link List}<{@link Student}>
     */
    @ResponseBody
    @GetMapping("/query/username")
    public List<Student> queryByUsername(@RequestParam("query") String query) {
        String trueQuery = "%" + query + "%";
        return studentService.queryByUserName(trueQuery);
    }

    /**
     * 用户查询 根据用户名
     * GET /user/username?query=
     *
     * @param query 查询
     * @return {@link List}<{@link Student}>
     */
    @ResponseBody
    @GetMapping("/query/studentno")
    public List<Student> queryByStudentNo(@RequestParam("query") String query) {
        String trueQuery = "%" + query + "%";
        return studentService.queryByStudentNo(trueQuery);
    }

    /**
     * 根据id重置密码
     *
     * @param id 编号
     * @return 重置结果 成功返回'ok' id不存在返回'err'
     */
    @ResponseBody
    @PutMapping("/reset/{id}")
    public String reset(@PathVariable("id") int id) {
        if(studentService.resetPw(id)) {
            return "ok";
        }
        return "err";
    }   
}
