package cn.edu.nwpu.fleamarket.controller;

import cn.edu.nwpu.fleamarket.pojo.Goods;
import cn.edu.nwpu.fleamarket.pojo.Cart;
import cn.edu.nwpu.fleamarket.pojo.Student;
import cn.edu.nwpu.fleamarket.service.CartService;
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

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService userService;
    @Autowired
    private CartService cartService;

    @PostMapping("/login")
    public ResponseEntity<?> login(HttpServletRequest request, HttpServletResponse response, @RequestBody Student student) throws Exception{
        Student databaseStudent = userService.loginStudent(student);
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

    @RequestMapping("/register")
    public ResponseEntity<?> register(HttpServletRequest request, HttpServletResponse response, @RequestBody Student student) throws Exception{
        Student databaseStudent = userService.registerStudent(student);
        List<Cart> cartList = cartService.getCartList(student.getStudentNo());
        if (databaseStudent != null) {
            return ResponseEntity.badRequest().body("该学号已经被注册！");
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
        return ResponseEntity.ok("注册成功！");
    }

    public static boolean isJson(String value) {
        try {
            new JSONObject(value);
        } catch (JSONException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }


    //@ResponseBody
   /* @RequestMapping("/login")
    public String login(HttpServletRequest request,HttpServletResponse response,String studentNo,String pwd)throws Exception {

        System.out.println("ssssssssssssss");
        JSONObject jsonObject = new JSONObject();

        Map<String, String> msg = new HashMap<String, String>();
        jsonObject.put("result","");
        User user = userService.findUser(studentNo);
        if(user == null){
            jsonObject.put("result","studentNoFalse");
            boolean res = isJson(jsonObject.toString());
            return jsonObject.toString();
        }else{
            if(pwd.equals(user.getPassword())){
                //存入Session
                request.getSession().setAttribute("user",user);
                request.getSession().setAttribute("password","home");
                //使用cookies记录
                String flag = request.getParameter("flag");
                request.getSession().setAttribute("flag",flag);
                //set cookie
                if(flag!=null && flag.equals("1")){
                    Cookie cookie = new Cookie("cookie_user",user.getStudentNo()+"-"+user.getPassword());
                    cookie.setMaxAge(60*60*24*30);   //cookie 保存30天
                    response.addCookie(cookie);
                }else{
                    Cookie cookie = new Cookie("cookie_user",user.getStudentNo()+"-"+null);
                    cookie.setMaxAge(60*60*24*30); //cookie 保存30天
                    response.addCookie(cookie);
                }
            }else{
                jsonObject.put("result","pwdFalse");
                return jsonObject.toString();
            }
        }

        return jsonObject.toString();
    }*/




    public boolean adminLogin(String username,String pwd) {
        return false;
    }


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
     * @param image 头像图片数据
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
        userService.setImg(studentNo);
    }

    /**
     * 返回用户总数
     * @return 用户总数
     */
    @ResponseBody
    @GetMapping("/count")
    public int count() {
        return userService.countAll();
    }

    /**
     * 获取某页面数据 一页展示6个用户
     * @param page 页面
     * @return 用户集合
     */
    @ResponseBody
    @GetMapping("/page/{page}")
    public List<Student> getByPage(@PathVariable("page") int page) {
        if(page <= 0) {
            return null;
        }
        return userService.getStudentsByPage(page);
    }

    /**
     * 更新user
     * @param student 更新内容
     * @return 结果
     */
    @ResponseBody
    @PutMapping
    public String updateStudent(HttpServletRequest request, @RequestBody Student student) {
        if(userService.updateStudent(student)) {
            request.getSession().setAttribute("student", userService.getStudentByStudentNo(student.getStudentNo()));
            return "ok";
        }
        return "err";
    }

    /**
     * 用户查询 根据用户名
     * GET /user/username?query=
     */
    @ResponseBody
    @GetMapping("/query/username")
    public List<Student> queryByUsername(@RequestParam("query") String query) {
        String trueQuery = "%" + query + "%";
        return userService.queryByUserName(trueQuery);
    }

    /**
     * 用户查询 根据用户名
     * GET /user/username?query=
     */
    @ResponseBody
    @GetMapping("/query/studentno")
    public List<Student> queryByStudentNo(@RequestParam("query") String query) {
        String trueQuery = "%" + query + "%";
        return userService.queryByStudentNo(trueQuery);
    }

    /**
     * 根据id重置密码
     * @return 重置结果 成功返回'ok' id不存在返回'err'
     */
    @ResponseBody
    @PutMapping("/reset/{id}")
    public String reset(@PathVariable("id") int id) {
        if(userService.resetPw(id)) {
            return "ok";
        }
        return "err";
    }   
}
