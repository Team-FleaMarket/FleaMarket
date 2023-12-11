<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Best Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
    function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //for-mobile-apps -->
    <link href="${pageContext.request.getContextPath()}/static/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="${pageContext.request.getContextPath()}/static/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!-- js -->
    <script src="${pageContext.request.getContextPath()}/static/js/jquery.min.js"></script>
    <!-- //js -->
    <!-- cart -->
    <script src="${pageContext.request.getContextPath()}/static/js/simpleCart.min.js"> </script>
    <!-- cart -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.getContextPath()}/static/css/jquery-ui.css">
    <!-- for bootstrap working -->
    <script type="text/javascript" src="${pageContext.request.getContextPath()}/static/js/bootstrap-3.1.1.min.js"></script>
    <!-- //for bootstrap working -->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <!-- animation-effect -->
    <link href="${pageContext.request.getContextPath()}/static/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.getContextPath()}/static/js/layer.css" rel="stylesheet">
    <script src="${pageContext.request.getContextPath()}/static/js/wow.min.js"></script>
    <script src="${pageContext.request.getContextPath()}/static/js/register.js"></script>
    <script src="${pageContext.request.getContextPath()}/static/js/layer.js"></script>
    <script>
        new WOW().init();
    </script>
    <!-- //animation-effect -->
</head>

<body>
<%@ include file="/WEB-INF/views/components/header.jsp"%>

<!-- breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
            <li><a href="${pageContext.request.contextPath}/views/index"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>主页 / </a></li>
            <li class="active"> 注册页面</li>
        </ol>
    </div>
</div>
<!-- //breadcrumbs -->
<!-- register -->
<div class="register">
    <div class="container">
        <h3 class="animated wow zoomIn" data-wow-delay=".5s">在这里注册</h3>
        <p class="est animated wow zoomIn" data-wow-delay=".5s">Sign up for your special account.</p>
        <div class="login-form-grids">
            <h5 class="animated wow slideInUp" data-wow-delay=".5s">基本信息</h5>
            <form action="${pageContext.request.getContextPath()}/user/registeruser" id="form" class="animated wow slideInUp" data-wow-delay=".5s">
                <input type="text" id="studentNo" name="studentNo" placeholder="请输入学号..."  >
                <input type="text" id="userName" name="userName" placeholder="请输入昵称..." >

                <input type="text" id="phone" name="phone" placeholder="请输入手机号..."  >
                <input type="text" id="wechat" name="wechat" placeholder="请输入微信号..."  >
                <input type="email" id="email" name="email" placeholder="请输入邮箱" >

                <input type="password" id="password" name="password" placeholder="请设置密码" >
                <input type="password" id="repassword" name="repassword" placeholder="再次确认密码" >
                <div class="register-check-box">
                    <div class="check">
                        <label class="checkbox"><input type="checkbox" name="checkbox" id="checkbox"><i> </i>接受相关条款和协议</label>
                    </div>
                </div>
                <input type="submit" id="chk" name="chk" value="注册" onclick="return registerCheck()">
            </form>
        </div>

        <div class="register-home animated wow slideInUp" data-wow-delay=".5s">
            <a href="${pageContext.request.contextPath}/views/index">Home</a>
        </div>
    </div>
</div>
<!-- //register -->
<!-- footer -->
<!-- footer -->
<%@ include file="components/footer.jsp"%>
<!-- //footer -->
</body>
</html>
