package cn.edu.nwpu.fleamarket.filter;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * 登录过滤器
 * 当用户未登录时，拦截所有请求，跳转到登录页面
 * */
public class LoginFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
//        System.out.println("login filter path: " + path);
        //以下直接放行
        if (path.startsWith("/login")) {
            chain.doFilter(request, response);
        } else if (path.equals("/")) {
            chain.doFilter(request, response);
        } else if (path.startsWith("/static")) {
            chain.doFilter(request, response);
        } else if (path.equals("/register")){
            chain.doFilter(request, response);
        } else if (path.startsWith("/student")){
            chain.doFilter(request, response);
        } else if(path.startsWith("/admin/login")) {
            chain.doFilter(request, response);
        }
        else {
            //需要鉴别是否是登录的用户或管理员
            HttpServletResponse httpResponse = (HttpServletResponse) response;
            HttpSession session = httpRequest.getSession();
            Object o = session.getAttribute("student");
            Object o2 = session.getAttribute("admin");
            if (o == null && o2 == null) {
                httpResponse.sendRedirect("/login");
                return;
            }
            chain.doFilter(request, response);
        }
    }
}
