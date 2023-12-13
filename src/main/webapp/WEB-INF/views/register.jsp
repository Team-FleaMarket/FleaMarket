<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 2018/5/4
  Time: 21:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <%@ include file="components/htmlhead.jsp" %>
    <link href="${pageContext.request.contextPath}/static/css/register.css" rel="stylesheet" type="text/css"
          media="all">
</head>

<body>
<!-- header -->

<%@ include file="components/header.jsp" %>
<!-- //header -->
<!-- breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
            <li><a href="${pageContext.request.contextPath}/views/index"><span class="glyphicon glyphicon-home"
                                                                               aria-hidden="true"></span>主页</a></li>
            <li class="active">注册页面</li>
        </ol>
    </div>
</div>
<!-- //breadcrumbs -->
<!-- register -->
<div class="register">
    <div class="container">
        <h3 class="animated wow zoomIn" data-wow-delay=".5s">注册</h3>
        <p class="est animated wow zoomIn" data-wow-delay=".5s">Sign up for your special account...</p>
        <div class="form-grids">
            <%-- <h5 class="animated wow slideInUp" data-wow-delay=".5s">基本信息</h5>--%>
            <form id="form" class="animated wow slideInUp" data-wow-delay=".5s">
                <input type="text" id="studentNo" name="studentNo" placeholder="请输入学号...">
                <input type="text" id="userName" name="userName" placeholder="请输入昵称...">

                <input type="text" id="phone" name="phone" placeholder="请输入手机号...">
                <input type="text" id="department" name="department" placeholder="请输入学院...">
                <%--<input type="email" id="email" name="email" placeholder="请输入邮箱">--%>

                <input type="password" id="password" name="password" placeholder="请设置密码">
                <input type="password" id="repassword" name="repassword" placeholder="再次确认密码">
                <div class="form-check mt-3">
                    <input type="checkbox" class="form-check-input" name="checkbox" id="checkbox">
                    <label class="form-check-label" for="checkbox">接受相关条款和协议</label>
                </div>

                <%--<div class="register-check-box">
                    <div class="check">
                        <label class="checkbox"><input type="checkbox" name="checkbox"
                                                       id="checkbox"><i> </i>接受相关条款和协议</label>
                    </div>
                </div>--%>
                <button type="button" class="btn btn-primary" id="liveToastBtn">注册</button>
            </form>
            <p class="animated wow slideInUp">已有账号？请点击<a
                    href="${pageContext.request.contextPath}/login">登录</a></p>

            <%-- 注册成功或失败消息提示 --%>
            <div class="position-fixed bottom-0 end-0 p-3 col-xl-2" style="z-index: 5;">
                <div id="liveToast" class="toast hide" data-bs-animation="false" role="alert" aria-live="assertive"
                     aria-atomic="true">
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
                import {registerAPI} from '/static/js/apis/student.js'
                document.querySelector("#liveToastBtn").onclick = async () => {
                    var studentNo = $("input[name=studentNo]").val()
                    var name = $("input[name=name]").val()
                    var phone = $("input[name=phone]").val()
                    var wechat = $("input[name=wechat]").val()
                    var email = $("input[name=email]").val()
                    var password = $("input[name=password]").val()
                    var message = ""
                    try {
                        var response = await registerAPI({studentNo, name, phone, wechat, email, password})
                        message = response.data
                        document.getElementById("toast-body").innerText = message
                        document.getElementById("toast-header").classList.remove("bg-danger")
                        document.getElementById("toast-header").classList.add("bg-success")
                        window.location.href = window.location.origin
                    } catch (error) {
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
        <!-- //register -->
    </div>
</div>

<%@include file="components/footer.jsp" %>
<!-- //footer -->

</body>
</html>
