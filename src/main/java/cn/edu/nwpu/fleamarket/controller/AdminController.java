package cn.edu.nwpu.fleamarket.controller;

import cn.edu.nwpu.fleamarket.pojo.Admin;
import cn.edu.nwpu.fleamarket.service.AdminService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 管理员controller
 */
@RestController
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    HttpSession session;

    /**
     * 管理员登录
     * @param admin 管理员 用户名和密码
     * @return 登录结果
     */
    @PostMapping("/login")
    public String adminLogin(@RequestBody Admin admin) {
        if (adminService.login(admin)) {
            session.setAttribute("admin", admin.getUsername());
            return "ok";
        }
        return "err";
    }

    /**
     * 返回当前登录的管理员用户名
     * @return 当前登录的管理员用户名
     */
    @GetMapping
    public String getUsername() {
        String name = (String) session.getAttribute("admin");
        if (name == null) {
            return "Invalid";
        }

        return name;
    }

    /**
     * 修改密码
     * @param username 修改密码的管理员用户名
     * @param pw 原密码
     * @param npw 新密码
     * @return 修改结果
     */
    @PostMapping("/update/pw")
    public String changePW(@RequestParam("username") String username, @RequestParam("pw") String pw, @RequestParam("npw") String npw) {
        if(session.getAttribute("admin") == null) {
            return null;
        }
        String password = adminService.getPwByUsername(username);
        if(!password.equals(pw)) {
            return "err";
        }
        adminService.updatePw(username, npw);
        return "ok";
    }

    /**
     * 添加新管理员
     * @param admin 新管理员
     * @return 添加结果
     */
    @PostMapping("/save")
    String save(@RequestBody Admin admin) {
        if(session.getAttribute("admin") == null) {
            return null;
        }
        if(adminService.addAdmin(admin)) {
            return "ok";
        }
        return "exist";
    }

    /**
     * 根据用户名删除管理员
     * @param username 用户名
     * @return 删除结果
     */
    @DeleteMapping
    String delete(@RequestParam("username") String username) {
        if(session.getAttribute("admin") == null) {
            return null;
        }
        if(adminService.delete(username)) {
            return "ok";
        }
        return "err";
    }

    /**
     * 管理员列表
     * @return 所有管理员
     */
    @GetMapping("/all")
    List<Admin> getAll() {
        if(session.getAttribute("admin") == null) {
            return null;
        }
        return adminService.getAll();
    }

    /**
     * 根据用户名查询
     * @param query 查询语句
     * @return 用户名符合条件的管理员
     */
    @GetMapping("/query")
    List<Admin> queryByUsername(@RequestParam("query") String query) {
        if(session.getAttribute("admin") == null) {
            return null;
        }
        return adminService.queryByUsername("%" + query + "%");
    }
}
