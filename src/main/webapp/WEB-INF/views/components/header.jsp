<%@ page import="org.json.JSONArray" %><%--
  Created by IntelliJ IDEA.
  student: YF
  Date: 2023/12/6
  Time: 21:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- nav bar -->
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand me-auto" href="${pageContext.request.contextPath}/">跳蚤市场</a>
        <!-- 顶部内容 同时在侧边栏 -->
        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasNavbarLabel">跳蚤市场</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                <!-- 登录后显示头像和购物车 -->
                <c:if test="${sessionScope.student != null}">
                    <ul class="navbar-user">
                        <li>
                            <a href="${pageContext.request.contextPath}/">
                                <i class="fas fa-user-check"></i>
                            </a>
                        </li>
                        <li class="checkout">
                            <a href="">
                                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                <span id="checkout-items-in" class="checkout-items">${sessionScope.cartList.size()}</span>
                            </a>
                        </li>
                    </ul>
                </c:if>
                <!-- 登录后显示头像和购物车 end -->
            </div>
            <div class="offcanvas-body">
                <ul class="navbar-nav justify-content-center flex-grow-1 pe-3">
                    <li class="nav-item">
                        <a class="nav-link mx-lg-2 active" aria-current="page"
                           href="${pageContext.request.contextPath}/">主页</a>
                    </li>
                    <li class="nav-item">
                        <c:if test="${sessionScope.student == null}">
                            <a class="nav-link mx-lg-2" href="${pageContext.request.contextPath}/login">个人中心</a>
                        </c:if>
                        <c:if test="${sessionScope.student != null}">
                            <a class="nav-link mx-lg-2" href="${pageContext.request.contextPath}/views/managecenter">个人中心</a>
                        </c:if>

                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link mx-lg-2 dropdown-toggle" href="" role="button" data-bs-toggle="dropdown" aria-expanded="false">商品分类</a>
                        <div class="dropdown-menu">
                            <ul>
                                <li class="dropdown-header">图书书籍</li>
                                <li class="dropdown-item"><a
                                        href="${pageContext.request.contextPath}/views/1/1">教材</a></li>
                                <li class="dropdown-item"><a
                                        href="${pageContext.request.contextPath}/views/2/1">考试</a></li>
                                <li class="dropdown-item"><a
                                        href="${pageContext.request.contextPath}/views/3/1">艺术文学</a>
                                </li>
                            </ul>
                            <ul>
                                <li class="dropdown-header">日用百货</li>
                                <li class="dropdown-item"><a
                                        href="${pageContext.request.contextPath}/views/4/1">运动类</a></li>
                                <li class="dropdown-item"><a
                                        href="${pageContext.request.contextPath}/views/5/1">文具类</a>
                                </li>
                                <li class="dropdown-item"><a
                                        href="${pageContext.request.contextPath}/views/6/1">生活类</a></li>
                            </ul>
                            <ul>
                                <li class="dropdown-header">娱乐</li>
                                <li class="dropdown-item"><a
                                        href="${pageContext.request.contextPath}/views/7/1">美妆</a></li>
                                <li class="dropdown-item"><a
                                        href="${pageContext.request.contextPath}/views/8/1">电子产品</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
                <script>
                    const changeNavlinkActiveState = () => {
                        let navlinks = document.querySelectorAll('a.nav-link');
                        let pathArray = window.location.pathname.split('/');
                        navlinks.forEach((link) => {
                            link.classList.remove('active'); // 移除所有a标签的active状态
                        });
                        if(pathArray.length>=2&&pathArray[2]==='managecenter')
                        {
                            navlinks[1].classList.add('active');
                        }else{
                            switch (pathArray[1]) {
                                case 'views':
                                    navlinks[2].classList.add('active');
                                    break;
                                case 'login':
                                case 'register':
                                case 'views/managecenter':
                                    navlinks[1].classList.add('active');
                                    break;
                                default:
                                    navlinks[0].classList.add('active');
                            }
                        }

                    }
                    window.onload = changeNavlinkActiveState; // 页面加载时调用
                </script>
            </div>
        </div>
        <div class="search-box">
            <form action="">
                <input type="text" name="search" placeholder="搜索" aria-label="Search">
                <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
        </div>
        <!-- 顶部内容 同时在侧边栏 end-->
        <c:if test="${sessionScope.student == null}">
            <a class="login-button" href="${pageContext.request.contextPath}/login">登录</a>
        </c:if>
        <c:if test="${sessionScope.student != null}">
            <ul class="navbar-user">
                <li class="image-li">
                    <a href="${pageContext.request.contextPath}/views/managecenter">
                        <img class="header-student-image" src="${sessionScope.student.imagePath}">
                    </a>
                </li>
                <li class="checkout">
                    <a href="">
                        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        <span id="checkout-items-out" class="checkout-items">${sessionScope.cartList.size()}</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/logout">
                        <i class="fa fa-sign-out" aria-hidden="true"></i>
                    </a>
                </li>
            </ul>
        </c:if>
        <button class="navbar-toggler pe-0" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
                aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
            <i class="fas fa-bars"></i>
        </button>
        <script type="module">
            /*import { useGoodsStore } from "/static/js/stores/goods-store.js"
            import { useStudentStore } from "/static/js/stores/student-store.js";
            document.querySelectorAll(".checkout-items").forEach((item) => {
                item.innerText = useGoodsStore().getCartGoodsNumber()
            })*/
        </script>
    </div>
</nav>
<!-- // nav bar -->