<%@ page import="java.net.CookieHandler" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <%@ include file="components/jspheader.jsp"%>
</head>

<body>
<!-- header -->
<% String flag = (String) session.getAttribute("flag") == null ? "" : (String) session.getAttribute("flag");
    String studentNo = "";
    String password = "";
    try {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("cookie_user")) {
                    String value = cookies[i].getValue();
                    if (value != null && !"".equals(value)) {
                        studentNo = cookies[i].getValue().split("-")[0];
                        if (cookies[i].getValue().split("-")[1] != null && !cookies[i].getValue().split("-")[1].equals("null")) {
                            password = cookies[i].getValue().split("-")[1];
                        }
                    }
                }
                request.setAttribute("studentNo", studentNo);
                request.setAttribute("password", password);
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

%>

<%--<div class="header">
    <div class="container ">
        <div class="logo-nav">
            <div class="logo-nav-left animated wow zoomIn" data-wow-delay=".5s">
                <h1><a href="${pageContext.request.contextPath}/views/index">GoodsWill <span>Shop anywhere</span></a>
                </h1>
            </div>
            <div class="logo-nav-left1">
                <nav class="navbar navbar-default">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header nav_2">
                        <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse"
                                data-target="#bs-megadropdown-tabs">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
                        <ul class="nav navbar-nav">

                            <li class="active">
                                <c:if test="${sessionScope.user == null}">
                                <a href="${pageContext.request.contextPath}/" class="act">主页
                                    </c:if>
                                    <c:if test="${sessionScope.user != null}">
                                    <a href="${pageContext.request.contextPath}/views/index" class="act">主页
                                        </c:if>

                                    </a></li>
                            <!-- Mega Menu -->
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">商品分类 <b
                                        class="caret"></b></a>
                                <ul class="dropdown-menu multi-column columns-3">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <ul class="multi-column-dropdown">
                                                <h6>图书书籍</h6>
                                                <li><a href="${pageContext.request.contextPath}/views/books">教材</a></li>
                                                <li><a href="${pageContext.request.contextPath}/views/tests">考试</a></li>
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/views/literature">艺术文学</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-4">
                                            <ul class="multi-column-dropdown">
                                                <h6>日用百货</h6>
                                                <li><a href="${pageContext.request.contextPath}/views/sports">运动类</a>
                                                </li>
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/views/stationery">文具类</a>
                                                </li>
                                                <li><a href="${pageContext.request.contextPath}/views/life">生活类</a></li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-4">
                                            <ul class="multi-column-dropdown">
                                                <h6>娱乐</h6>
                                                <li><a href="${pageContext.request.contextPath}/views/beauty%20makeup">美妆</a>
                                                </li>
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/views/electronic%20products">电子产品</a>
                                                </li>
                                                <li><a href="${pageContext.request.contextPath}/views/products">Girl's
                                                    Clothing</a></li>
                                            </ul>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </ul>
                            </li>
                            <li>
                                <c:if test="${sessionScope.user == null}">
                                    <a href="${pageContext.request.contextPath}/views/login">管理中心</a>
                                </c:if>
                                <c:if test="${sessionScope.user != null}">
                                    <a href="${pageContext.request.contextPath}/views/managecenter">管理中心</a>
                                </c:if>

                            </li>
                            <!--<li><a href="short-codes.html">个人中心</a></li>-->
                        </ul>
                    </div>
                </nav>
            </div>

            <div class="logo-nav-right">
                <div class="search-box">
                    <div id="sb-search" class="sb-search">
                        <form>
                            <input class="sb-search-input" placeholder="输入你想搜索的商品" type="search" id="search">
                            <input class="sb-search-submit" type="submit" value="">
                            <span class="sb-icon-search"> </span>
                        </form>
                    </div>
                </div>
                <!-- search-scripts -->
                <script src="${pageContext.request.getContextPath()}/static/js/classie.js"></script>
                <script src="${pageContext.request.getContextPath()}/static/js/uisearch.js"></script>
                <script>
                    new UISearch(document.getElementById('sb-search'));
                </script>
                <!-- //search-scripts -->
            </div>
            <div class="header-right">
                <div class="cart box_1">
                    <a href="${pageContext.request.getContextPath()}/user/logout">
                        <li>
                            <i class="glyphicon glyphicon-log-in" aria-hidden="true"></i>
                            <c:if test="${sessionScope.user == null}">
                                <a href="${pageContext.request.contextPath}/views/login">登陆</a>
                            </c:if>
                            <c:if test="${sessionScope.user != null}">
                                <a href="${pageContext.request.contextPath}/views/managecenter">${sessionScope.user.userName}</a>
                            </c:if>
                        </li>
                    </a>
                    <!--<p><a href="javascript:;" class="simpleCart_empty">Empty Cart</a></p>-->
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>--%>
<%@include file="components/header.jsp" %>
<!-- //header -->
<!-- breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
            <li class="active">
                <c:if test="${sessionScope.user == null}">
                    <a href="${pageContext.request.getContextPath()}/"><span class="glyphicon glyphicon-home"
                                                                             aria-hidden="true">
                    </span>主页</a>
                </c:if>
                <c:if test="${sessionScope.user != null}">
                    <a href="${pageContext.request.getContextPath()}/views/index"><span class="glyphicon glyphicon-home"
                                                                                        aria-hidden="true">
                    </span>主页</a>
                </c:if>
                </a>
            </li>
            <li class="active">登陆页面</li>

        </ol>
    </div>
</div>
<!-- //breadcrumbs -->
<!-- login -->
<div class="login">
    <div class="container row">

        <div class="col-lg-6 col-md-6 login-img animated wow zoomIn">
            <img src="${pageContext.request.contextPath}/static/images/login/1.jpg" class="img-fluid"
                 alt="picture">
        </div>

        <div class="col-lg-6 col-md-6 login-area">
            <h3 class="animated wow zoomIn" data-wow-delay=".5s">登录</h3>
            <p class="est animated wow zoomIn" data-wow-delay=".5s">Login to your account...</p>
            <div class="login-form-grids form-grids animated wow slideInUp" data-wow-delay=".5s">
                <form action="${pageContext.request.getContextPath()}/user/login" id="form"
                      class="animated wow slideInUp"
                      data-wow-delay=".5s">
                    <input type="text" id="studentNo" name="studentNo" placeholder="输入学号"
                           onkeyup="value=value.replace(/[^\d]/g,'')">
                    <input type="password" id="password" name="password" placeholder="密码">
                    <%--<div class="forgot">
                        <a href="#">忘记密码 ?</a>
                    </div>--%>
                    <input type="submit" id="chk" name="chk" value="登录" onclick="return loginCheck()">
                    <button type="button" class="btn btn-primary" id="liveToastBtn" >登录</button>
                    <%--                    <a href="<c:url value="http://localhost:8080/FleaMarket/user/login" />">登录</a>--%>
                    <%--
    <input class="btn btn-lg btn-primary btn-block" type="button" onclick="return loginCheck()" value="登陆">--%>

                </form>
            </div>
            <p class="animated wow slideInUp" data-wow-delay=".5s">新用户？请点击<a
                    href="${pageContext.request.contextPath}/views/register">注册</a></p>
            <%--<h4 class="animated wow slideInUp" data-wow-delay=".5s">新用户</h4>
            <p class="animated wow slideInUp" data-wow-delay=".5s">
                <a href="${pageContext.request.contextPath}/views/register">注册</a>
                (或) 返回
                <a href="${pageContext.request.contextPath}/">主页
                    <span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a></p>--%>
            <%-- 登录成功或失败消息提示 --%>
            <div class="position-fixed bottom-0 end-0 p-3 col-xl-2" style="z-index: 5;">
                <div id="liveToast" class="toast hide" data-bs-animation="false" role="alert" aria-live="assertive" aria-atomic="true">
                    <div class="toast-header text-black" id="toast-header">
                        <strong class="me-auto">消息提示</strong>
                        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                    </div>
                    <div class="toast-body" id="toast-body">
                        消息内容...
                    </div>
                </div>
            </div>
            <script type="module">
                import { loginAPI } from '/static/js/apis/student.js'
                document.querySelector("#liveToastBtn").onclick = async () => {
                    var studentNo = $("input[name=studentNo]").val()
                    var password = $("input[name=password]").val()
                    var message = ""
                    try {
                        var response = await loginAPI({ studentNo, password })
                        message = response.data
                        document.getElementById("toast-body").innerText = message
                        document.getElementById("toast-header").classList.remove("bg-danger")
                        document.getElementById("toast-header").classList.add("bg-success")
                        window.location.href = window.location.origin
                    } catch(error) {
                        message = error.response.data
                        document.getElementById("toast-body").innerText = message;
                        document.getElementById("toast-header").classList.remove("bg-success")
                        document.getElementById("toast-header").classList.add("bg-danger")
                    }
                    new bootstrap.Toast(document.querySelector('.toast')).show();
                }
            </script>
            <%-- 登录失败消息提示 end--%>
        </div>
    </div>
</div>
<!-- //login -->
<!-- footer -->
<%@include file="components/footer.jsp" %>
<%--<div class="footer">
    <div class="container">
        <div class="footer-grids">
            <!--banner-bottom-grid-left-->
            <div class="col-md-4 footer-grid animated wow slideInLeft" data-wow-delay=".5s">
                <h3>关于我们</h3>
                <p>足不出户获得最全的商品信息，</p>
                <p>在这里找寻你急需要的商品，</p>
                <p>在这里找寻你最喜欢的商品，</p>
                <p>这里有你想要的，这里有你喜欢的，</p>
                <p>还在等什么，赶快行动起来吧！</p>
            </div>

            <div class="col-md-4 footer-grid animated wow slideInLeft" data-wow-delay=".6s">
                <h3>联系我们</h3>
                <ul>
                    <li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a
                            href="mailto:info@example.com">张旱文 123456789@qq.com</a></li>
                    <li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a
                            href="mailto:info@example.com">徐孟达 dxxmda@126.com</a></li>
                    <li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a
                            href="mailto:info@example.com">许多 13817717084@163.com</a></li>
                    <li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a
                            href="mailto:info@example.com">熊凯丽 65356789011@qq.com</a></li>
                    <li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a
                            href="mailto:info@example.com">张乐乐 lelesunshine614@gmail.com</a></li>
                </ul>
            </div>

            <div class="col-md-4 footer-grid animated wow slideInLeft" data-wow-delay=".7s">
                <h3>Partners</h3>
                <div class="footer-grid-left">
                    <a href="http://www.shnu.edu.cn/"><img
                            src="${pageContext.request.getContextPath()}/static/images/13.png" alt=" "
                            class="img-responsive"/></a>
                </div>
                <div class="footer-grid-left">
                    <a href="http://www.shnu.edu.cn/"><img
                            src="${pageContext.request.getContextPath()}/static/images/13.png" alt=" "
                            class="img-responsive"/></a>
                </div>
                <div class="footer-grid-left">
                    <a href="http://www.shnu.edu.cn/"><img
                            src="${pageContext.request.getContextPath()}/static/images/13.png" alt=" "
                            class="img-responsive"/></a>
                </div>
                <div class="footer-grid-left">
                    <a href="http://www.shnu.edu.cn/"><img
                            src="${pageContext.request.getContextPath()}/static/images/13.png" alt=" "
                            class="img-responsive"/></a>
                </div>
                <div class="footer-grid-left">
                    <a href="http://www.shnu.edu.cn/"><img
                            src="${pageContext.request.getContextPath()}/static/images/13.png" alt=" "
                            class="img-responsive"/></a>
                </div>
                <div class="footer-grid-left">
                    <a href="http://www.shnu.edu.cn/"><img
                            src="${pageContext.request.getContextPath()}/static/images/13.png" alt=" "
                            class="img-responsive"/></a>
                </div>


                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
        <div class="footer-logo animated wow slideInUp" data-wow-delay=".5s">
            <h2><a href="${pageContext.request.contextPath}/views/index">GoodsWill <span>shop anywhere</span></a></h2>
        </div>
        <div class="copy-right animated wow slideInUp" data-wow-delay=".5s">
            <p>Copyright &copy; 2018.Company name All rights reserved.
                <a href="${pageContext.request.contextPath}/views/index" target="_blank" title="GoodsWill">GoodsWill</a>
        </div>
    </div>
</div>--%>
<!-- //footer -->
</body>
</html>