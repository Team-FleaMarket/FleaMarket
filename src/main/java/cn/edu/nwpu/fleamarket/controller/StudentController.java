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

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;
    @Autowired
    private CartService cartService;

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
        Student databaseStudent = studentService.registerStudent(student);
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
        User user = studentService.findUser(studentNo);
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

/*

  */
/*  @RequestMapping("/profile")
    public ModelAndView profile(HttpServletRequest request) throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        String studentNo = request.getParameter("studentNo");
        User Iuser = (User)request.getSession().getAttribute("user");
        if(Iuser == null||(Iuser!=null &&!Iuser.getStudentNo().equals(studentNo))){
            request.getSession().setAttribute("Flag","2");
        }else{
            request.getSession().setAttribute("Flag","1");
        }
        request.getSession().setAttribute("active","profile");
        User user = null;
        if(studentNo ==null || "".equals(studentNo)){
            modelAndView.setViewName("login");
        }else{
            user = studentService.findUser(studentNo);
            if(user==null){
                request.getSession().setAttribute("active","home");
                modelAndView.setViewName("index");
            }else{
                modelAndView.setViewName("profile");
                modelAndView.addObject("user",user);
            }
        }
        return modelAndView;
    }*//*


    @RequestMapping("uploadImagePage")
    public ModelAndView uploadImagePage(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("uploadIamge");
        return modelAndView;
    }

    @RequestMapping("uploadImage")
    public ModelAndView uploadImage(MultipartFile uploadFile,HttpServletRequest request)throws Exception{
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        ModelAndView modelAndView = new ModelAndView();
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        String responseStr ="";
        Map<String,MultipartFile> fileMap =  multipartRequest.getFileMap();
        // 获取上传文件存放的 目录 , 无则创建
        String configPath = request.getSession().getServletContext().getRealPath("/static/upload/images/");
        //创建文件夹
        File file = new File(configPath);
        if(!file.exists()){
            file.mkdirs();
        }
        String fileName = null;
        for(Map.Entry<String,MultipartFile> entity :fileMap.entrySet()){
            // 上传文件名
            MultipartFile mf = entity.getValue();
            fileName = mf.getOriginalFilename();
            String fileExt = fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase();
            SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
            String newFileName = df.format(new Date())+"_"+new Random().nextInt(1000)+"."+fileExt;
            responseStr = "/static/upload/images/"+newFileName;
            File uploadFile2 = new File(configPath+"/"+newFileName);
            try{
                FileCopyUtils.copy(mf.getBytes(),uploadFile2);
            }catch (Exception e){
                responseStr = "上传失败";
                e.printStackTrace();
            }
        }
        user.setImagePath(responseStr);
        studentService.updateUser(user);
        modelAndView.setViewName("profile");
        return modelAndView;
    }


    @RequestMapping("updateProfilePage")
    public ModelAndView updageProfilePage(HttpServletRequest request)throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        String studentNo = request.getParameter("studentNo");
        User userSession = (User)request.getSession().getAttribute("user");
        User user = studentService.findUser(studentNo);
        if(user==null || userSession ==null){
            modelAndView.setViewName("login");
            return modelAndView;
        }
        if(studentNo !=null && user!=null && !studentNo.equals(userSession.getStudentNo())){
            modelAndView.setViewName("profile");
            return modelAndView;
        }else{
            modelAndView.addObject("user",user);
            modelAndView.setViewName("updateProfile");
        }
        return modelAndView;
    }


    @RequestMapping("updateProfile")
    public String updateProfile(HttpServletRequest request)throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        User user = (User)request.getSession().getAttribute("user");
        User uuser = new User();
        uuser.setStudentNo(user.getStudentNo());
        String position = request.getParameter("position");
        String education = request.getParameter("education");
        String email = request.getParameter("email");
        String grade = request.getParameter("grade");
        String introduce = request.getParameter("introduce");
        String skills = request.getParameter("skills");
        int change = 0;
        if(!position.equals(user.getPosition())){
            uuser.setPosition(position);
            change++;
        }
        if(!education.equals(user.getEducation())){
            uuser.setEducation(education);
            change++;
        }
        if(!email.equals(user.getEmail())){
            uuser.setEmail(email);
            change++;
        }
        if(!grade.equals(user.getGrade())){
            uuser.equals(grade);
            change++;
        }
        if(!introduce.equals(user.getIntroduce())){
            uuser.equals(introduce);
            change++;
        }
        if(!skills.equals(user.getSkills())){
            uuser.setSkills(skills);
            change++;
        }
        if(change==0){
            return "forward:profile?studentNo="+user.getStudentNo();
        }else{
            studentService.updateUserInformation(uuser);
        }
        return "forward:profile?studentNo="+user.getStudentNo();
    }



   */



/*
    @RequestMapping("passwordSet")
    public ModelAndView passwordSet(HttpServletRequest request){
        ModelAndView modelAndView= new ModelAndView();
        User userSession = (User)request.getSession().getAttribute("user");
        if(userSession == null){
            modelAndView.setViewName("login");
            return modelAndView;
        }else{
            modelAndView.setViewName("setpassword");
        }
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping("setPassword")
    public String setPassword(HttpServletRequest request)throws Exception{
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("result","");
        String studentNo = request.getParameter("studentNo");
        String newpwd = request.getParameter("newpwd");
        String renewpwd = request.getParameter("renewpwd");
        String originpwd = request.getParameter("originpwd");
        if(newpwd==null||"".equals(newpwd)){
            jsonObject.put("result","blank");
            return jsonObject.toString();
        }
        if(renewpwd==null||"".equals(renewpwd)){
            jsonObject.put("result","blank");
            return jsonObject.toString();
        }
        if(!newpwd.equals(renewpwd)){
            jsonObject.put("result","notSame");
            return jsonObject.toString();
        }
        User old = studentService.findUser(studentNo);
        if("".equals(studentNo)||studentNo==null||old==null){
            jsonObject.put("result","noStudent");
            return jsonObject.toString();
        }
        if(!originpwd.equals(old.getPassword())){
            jsonObject.put("result","notpwd");
            return jsonObject.toString();
        }
        User user =new User();
        user.setStudentNo(studentNo);
        user.setPassword(newpwd);
        studentService.updatePwd(user);
        jsonObject.put("result","succ");
        return jsonObject.toString();
    }

*/

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
        studentService.setImg(studentNo);
    }

    /**
     * 返回用户总数
     * @return 用户总数
     */
    @ResponseBody
    @GetMapping("/count")
    public int count() {
        return studentService.countAll();
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
        return studentService.getStudentsByPage(page);
    }

    /**
     * 更新user
     * @param student 更新内容
     * @return 结果
     */
    @ResponseBody
    @PutMapping
<<<<<<< HEAD
    public String updateStudent(HttpServletRequest request, @RequestBody Student student) {
        if(userService.updateStudent(student)) {
            request.getSession().setAttribute("student", userService.getStudentByStudentNo(student.getStudentNo()));
=======

    public String update(HttpServletRequest request, @RequestBody Student student) {
        if(studentService.updateStudent(student)) {
            request.getSession().setAttribute("student", studentService.getStudentByStudentNo(student.getStudentNo()));
>>>>>>> dev
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
        return studentService.queryByUserName(trueQuery);
    }

    /**
     * 用户查询 根据用户名
     * GET /user/username?query=
     */
    @ResponseBody
    @GetMapping("/query/studentno")
    public List<Student> queryByStudentNo(@RequestParam("query") String query) {
        String trueQuery = "%" + query + "%";
        return studentService.queryByStudentNo(trueQuery);
    }

    /**
     * 根据id重置密码
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
