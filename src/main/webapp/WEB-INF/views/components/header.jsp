<%--
  Created by IntelliJ IDEA.
  User: YF
  Date: 2023/12/6
  Time: 21:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header">
    <div class="container">
        <div class="row">
            <div class="col-4">
                <div class="logo-nav-left animated wow zoomIn" data-wow-delay=".1s">
                    <h1><a href="${pageContext.request.getContextPath()}">FleaMarket<span>welcome</span></a></h1>
                    <br>
                </div>
            </div>
            <div class="col-7">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/">主页</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#"  data-bs-toggle="dropdown">商品分类</a>
                        <ul class="dropdown-menu multi-column columns-3">
                            <div class="row">
                                <div class="col-xl-4">
                                    <li class="dropdown-header">图书书籍</li>
                                    <li class="dropdown-item"><a href="${pageContext.request.contextPath}/views/books">教材</a></li>
                                    <li class="dropdown-item"><a href="${pageContext.request.contextPath}/views/tests">考试</a></li>
                                    <li class="dropdown-item"><a href="${pageContext.request.contextPath}/views/literature">艺术文学</a></li>
                                </div>
                                <div class="col-xl-4">
                                    <li class="dropdown-header">日用百货</li>
                                    <li class="dropdown-item"><a href="${pageContext.request.contextPath}/views/sports">运动类</a></li>
                                    <li class="dropdown-item"><a href="${pageContext.request.contextPath}/views/stationery">文具类</a></li>
                                    <li class="dropdown-item"><a href="${pageContext.request.contextPath}/views/life">生活类</a></li>
                                </div>
                                <div class="col-xl-4">
                                    <li class="dropdown-header">娱乐</li>
                                    <li class="dropdown-item"><a href="${pageContext.request.contextPath}/views/beautymakeup">美妆</a></li>
                                    <li class="dropdown-item"><a href="${pageContext.request.contextPath}/views/electronicproducts">电子产品</a></li>
                                </div>
                            </div>
                        </ul>
                    </li>
                    <c:if test="${sessionScope.student == null}">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/login">个人中心</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/login">之前的英文购物车</a>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.student != null}">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/managecenter">个人中心</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/checkout">之前的英文购物车</a>
                        </li>
                    </c:if>
                </ul>
                <div id="sb-search" class="sb-search">
                    <form>
                        <input class="sb-search-input" placeholder="输入你想搜索的商品" type="search" id="search">
                        <input class="sb-search-submit" type="submit" value="">
                        <span class="sb-icon-search"> </span>
                    </form>
                </div>
                <!-- search-scripts -->
                <script src="${pageContext.request.getContextPath()}/static/js/classie.js"></script>
                <script src="${pageContext.request.getContextPath()}/static/js/uisearch.js"></script>
                <script>
                    new UISearch( document.getElementById( 'sb-search' ) );
                </script>
            </div>
            <div class="col-1">
                <div class="login">
                    <a href="${pageContext.request.contextPath}/checkout">
                        <i class="glyphicon glyphicon-log-in" aria-hidden="true"></i>
                        <c:if test="${sessionScope.student == null}">
                            <a href="${pageContext.request.contextPath}/login">登录</a>
                        </c:if>
                        <c:if test="${sessionScope.student != null}">
                            <a href="${pageContext.request.contextPath}/home">${sessionScope.student.name}，欢迎您</a>
                        </c:if>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
