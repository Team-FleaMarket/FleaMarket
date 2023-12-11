package cn.edu.nwpu.fleamarket.controller;

import cn.edu.nwpu.fleamarket.pojo.Admin;
import cn.edu.nwpu.fleamarket.pojo.Goods;
import cn.edu.nwpu.fleamarket.pojo.User;
import cn.edu.nwpu.fleamarket.service.AdminService;
import cn.edu.nwpu.fleamarket.service.GoodsService;
import cn.edu.nwpu.fleamarket.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @PostMapping("/login")
    public String adminLogin(@RequestBody Admin admin, HttpSession session) {
        if(adminService.login(admin)) {
            session.setAttribute("admin", admin.getUsername());
            return "ok";
        }
        return "err";
    }

    @GetMapping
    public String getUsername(HttpSession session) {
        String name = (String) session.getAttribute("admin");
        if(name == null) {
            return "Invalid";
        }

        return name;
    }


}
