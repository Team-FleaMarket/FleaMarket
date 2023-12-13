<%--
  Created by IntelliJ IDEA.
  student: YF
  Date: 2023/12/6
  Time: 21:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- nav bar -->
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand me-auto" href="${pageContext.request.contextPath}/">校园跳蚤市场</a>
        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasNavbarLabel">校园跳蚤市场</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <ul class="navbar-nav justify-content-center flex-grow-1 pe-3">
                    <li class="nav-item">
                        <a class="nav-link mx-lg-2 active" aria-current="page" href="${pageContext.request.contextPath}/">主页</a>
                    </li>
                    <li class="nav-item">
                        <c:if test="${sessionScope.student == null}">
                            <a class="nav-link mx-lg-2" href="${pageContext.request.contextPath}/login">
                        </c:if>
                        <c:if test="${sessionScope.student != null}">
                            <a class="nav-link mx-lg-2" href="${pageContext.request.contextPath}/managercenter">
                        </c:if>
                            个人中心
                            </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link mx-lg-2 dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            商品分类
                        </a>
                        <div class="dropdown-menu">
                            <ul>
                                <li class="dropdown-header">图书书籍</li>
                                <li class="dropdown-item"><a href="${pageContext.request.contextPath}/views/books">教材</a></li>
                                <li class="dropdown-item"><a href="${pageContext.request.contextPath}/views/tests">考试</a></li>
                                <li class="dropdown-item"><a href="${pageContext.request.contextPath}/views/literature">艺术文学</a></li>
                            </ul>
                            <ul>
                                <li class="dropdown-header">日用百货</li>
                                <li class="dropdown-item"><a href="${pageContext.request.contextPath}/views/sports">运动类</a></li>
                                <li class="dropdown-item"><a href="${pageContext.request.contextPath}/views/stationery">文具类</a></li>
                                <li class="dropdown-item"><a href="${pageContext.request.contextPath}/views/life">生活类</a></li>
                            </ul>
                            <ul>
                                <li class="dropdown-header">娱乐</li>
                                <li class="dropdown-item"><a href="${pageContext.request.contextPath}/views/beautymakeup">美妆</a></li>
                                <li class="dropdown-item"><a href="${pageContext.request.contextPath}/views/electronicproducts">电子产品</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
                <div class="search-box">
                    <form action="">
                        <input type="text" name="search" placeholder="搜索" aria-label="Search">
                        <button type="submit"><i class="fa fa-search"></i></button>
                    </form>
                </div>
            </div>
        </div>
        <c:if test="${sessionScope.student == null}">
            <a class="login-button" href="${pageContext.request.contextPath}/login">登录</a>
        </c:if>
        <c:if test="${sessionScope.student != null}">
            <a href="${pageContext.request.contextPath}/"><i class="fas fa-user-check"></i>> ${sessionScope.student.name}</a>
        </c:if>
        <button class="navbar-toggler pe-0" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
            <i class="fas fa-bars"></i>
        </button>
    </div>
</nav>
<!-- // nav bar -->