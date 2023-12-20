package cn.edu.nwpu.fleamarket.controller;

import jakarta.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 管理员页面获取商品图片存储位置
 *
 * @author lsy
 * @date 2023/12/15
 */
@RestController
@RequestMapping("/context")
public class ContextController {
    /**
     * 上下文
     */
    @Autowired
    ServletContext context;

    /**
     * 获取图像路径
     *
     * @return {@link String}
     */
    @GetMapping
    public String getImagePath() {
        return context.getRealPath( "/static/upload/file/");
    }
}
