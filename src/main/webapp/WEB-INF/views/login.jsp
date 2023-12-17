<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<%--head--%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <%@include file="components/htmlhead.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login.css">
</head>
<%--head--%>
<body>
<%--header--%>
<%@include file="components/header.jsp" %>
<%--header--%>
<!-- breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
            <li class="breadcrumb-item">
                    <a href="${pageContext.request.getContextPath()}/"><span class="glyphicon glyphicon-home"
                                                                                        aria-hidden="true">
                    </span>主页</a>
            </li>
            <li class="breadcrumb-item active">登陆页面</li>
        </ol>
    </div>
</div>
<!-- //breadcrumbs -->
<%--login--%>
<div class="login">
    <div class="container main">
        <div class="row animated wow" data-wow-delay=".5s" ->
            <div class="col-md-6 side-image zoomIn">
                <!-------------      image     ------------->
                <%-- <div class="text">
                     <p>Join the community of developers <i>- ludiflex</i></p>
                 </div>--%>
            </div>
            <div class="col-md-6 right">
                <div class="input-box">
                    <header class="zoomIn">登录</header>
                    <p class="zoomIn">Login to your account...</p>
                    <div class="input-field">
                        <input type="text" class="input" id="studentNo" name="studentNo" required="" autocomplete="off">
                        <label for="studentNo">学号</label>
                    </div>
                    <div class="input-field">
                        <input type="password" class="input" id="password" name="password" required="">
                        <label for="password">密码</label>
                    </div>
                    <div class="input-field">

                        <input type="button" class="button" id="liveToastBtn" value="登录">
                    </div>
                    <div class="toregister">
                        <span>新用户？请点击 <a href="${pageContext.request.contextPath}/register">注册</a></span>
                    </div>
                </div>

                <%-- 登录成功或失败消息提示 --%>
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
                    import { loginAPI } from "/static/js/apis/student.js"
                    document.querySelector("#liveToastBtn").onclick = async () => {
                        const studentNo = $("input[name=studentNo]").val()
                        const password = $("input[name=password]").val()
                        try {
                            const response = await loginAPI({studentNo, password})
                            document.getElementById("toast-body").innerText = response.data
                            document.getElementById("toast-header").classList.remove("bg-danger")
                            document.getElementById("toast-header").classList.add("bg-success")
                            window.location.href = window.location.origin
                        } catch (error) {
                            const message = error.response.data
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
</div>
<%--footer--%>
<%@include file="components/footer.jsp" %>
<%--footer--%>
</body>
</html>
