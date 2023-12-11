<%@ page import="java.net.CookieHandler" %><%--
  Created by IntelliJ IDEA.
  User: root
  Date: 2018/5/4
  Time: 21:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Best Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design"/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!-- //for-mobile-apps -->
    <link href="${pageContext.request.getContextPath()}/static/css/bootstrap.css" rel="stylesheet" type="text/css"
          media="all"/>

    <%-- <link href="${pageContext.request.getContextPath()}/static/css/style.css" rel="stylesheet" type="text/css"
           media="all"/>--%>
    <link href="${pageContext.request.contextPath}/static/css/login.css" rel="stylesheet" type="text/css">
    <!-- js -->
    <script src="${pageContext.request.getContextPath()}/static/js/jquery.min.js"></script>
    <!-- //js -->
    <!-- cart -->
    <script src="${pageContext.request.getContextPath()}/static/js/simpleCart.min.js"></script>
    <!-- cart -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.getContextPath()}/static/css/jquery-ui.css">
    <!-- for bootstrap working -->
    <script type="text/javascript"
            src="${pageContext.request.getContextPath()}/static/js/bootstrap.js"></script>
    <!-- //for bootstrap working -->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
          rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic'
          rel='stylesheet' type='text/css'>
    <!-- animation-effect -->
    <link href="${pageContext.request.getContextPath()}/static/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.getContextPath()}/static/js/layer.css" rel="stylesheet">
    <script src="${pageContext.request.getContextPath()}/static/js/wow.min.js"></script>
    <script src="${pageContext.request.getContextPath()}/static/js/login.js"></script>
    <script src="${pageContext.request.getContextPath()}/static/js/layer.js"></script>
    <script>
        new WOW().init();
    </script>
    <!-- //animation-effect -->
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
        </div>
    </div>
</div>
<!-- //login -->
<!-- footer -->
<%@include file="components/footer.jsp" %>
<!-- //footer -->
</body>
</html>