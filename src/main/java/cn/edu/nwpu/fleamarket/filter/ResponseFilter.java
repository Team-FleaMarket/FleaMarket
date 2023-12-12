package cn.edu.nwpu.fleamarket.filter;

import jakarta.servlet.*;

import java.io.IOException;

/**
 * 响应过滤器
 */
public class ResponseFilter implements Filter {
    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        System.out.println("过滤器被执行");
        // 设置编码格式
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        // 放行
        chain.doFilter(req, resp);
    }
}
