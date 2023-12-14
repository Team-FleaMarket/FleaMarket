package cn.edu.nwpu.fleamarket.controller;

import jakarta.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 管理员页面获取商品图片存储位置
 */
@RestController
@RequestMapping("/context")
public class ContextController {
    @Autowired
    ServletContext context;

    @GetMapping
    public String getImagePath() {
        return context.getRealPath( "/static/upload/file/");
    }
}
