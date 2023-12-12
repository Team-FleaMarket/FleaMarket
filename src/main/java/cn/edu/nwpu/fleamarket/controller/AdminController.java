package cn.edu.nwpu.fleamarket.controller;

import cn.edu.nwpu.fleamarket.pojo.Admin;
import cn.edu.nwpu.fleamarket.service.AdminService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 管理员controller
 */
@RestController
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    /**
     * 管理员登录
     * @param admin 管理员 用户名和密码
     * @param session httpsession
     * @return 登录结果
     */
    @PostMapping("/login")
    public String adminLogin(@RequestBody Admin admin, HttpSession session) {
        if (adminService.login(admin)) {
            session.setAttribute("admin", admin.getUsername());
            return "ok";
        }
        return "err";
    }

    /**
     * 返回当前登录的管理员用户名
     * @param session httpsession
     * @return 当前登录的管理员用户名
     */
    @GetMapping
    public String getUsername(HttpSession session) {
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
        String password = adminService.getPwByUsername(username);
        if(!password.equals(pw)) {
            return "err";
        }
        adminService.updatePw(username, npw);
        return "ok";
    }

}
