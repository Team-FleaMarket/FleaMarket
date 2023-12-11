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
<%  String flag = (String)session.getAttribute("flag")==null?"":(String)session.getAttribute("flag");
     String studentNo="";
     String password="";
     try{
         Cookie[] cookies = request.getCookies();
         if(cookies!=null){
             for(int i=0;i<cookies.length;i++){
                 if(cookies[i].getName().equals("cookie_user")){
                     String value = cookies[i].getValue();
                     if(value!=null&&!"".equals(value)){
                         studentNo=cookies[i].getValue().split("-")[0];
                         if(cookies[i].getValue().split("-")[1]!=null&&!cookies[i].getValue().split("-")[1].equals("null")){
                             password=cookies[i].getValue().split("-")[1];
                         }
                     }
                 }
                 request.setAttribute("studentNo",studentNo);
                 request.setAttribute("password",password);
             }
         }
     }catch (Exception e){
         e.printStackTrace();
     }

%>
<%@ include file="components/header.jsp"%>

<!-- breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
            <li class="active">
                <c:if test="${sessionScope.user == null}">
                    <a href="${pageContext.request.getContextPath()}/"><span class="glyphicon glyphicon-home" aria-hidden="true">
                    </span>主页</a>
                    </c:if>
                <c:if test="${sessionScope.user != null}">
                    <a href="${pageContext.request.getContextPath()}/views/index"><span class="glyphicon glyphicon-home" aria-hidden="true">
                    </span>主页 / </a>
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
    <div class="container">
        <h3 class="animated wow zoomIn" data-wow-delay=".5s">登陆</h3>
        <p class="est animated wow zoomIn" data-wow-delay=".5s"> login to your account..</p>
        <div class="login-form-grids animated wow slideInUp" data-wow-delay=".5s">
            <form id="form" class="animated wow slideInUp" data-wow-delay=".5s">
                <input type="text" id="studentNo" name="studentNo" placeholder="输入学号" onkeyup="value=value.replace(/[^\d]/g,'')">
                <input type="password" id="password" name="password" placeholder="密码">
                <div class="forgot">
                    <a href="#">忘记密码 ?</a>
                </div>
                <%--<input type="submit" id="chk" name="chk" value="登陆" onclick="registerCheck()"/>--%>
                <button type="button" class="btn btn-primary" id="liveToastBtn" >登录</button>
            </form>
        </div>
        <%-- 注册或返回主页 --%>
        <h4 class="animated wow slideInUp" data-wow-delay=".5s">新用户</h4>
        <p class="animated wow slideInUp" data-wow-delay=".5s">
            <a href="${pageContext.request.contextPath}/register">注册</a>
            (或) 返回
            <a href="${pageContext.request.contextPath}/">主页
            <span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a></p>
        <%-- 注册或返回主页 end --%>
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
<!-- //login -->
<!-- footer -->
<%@ include file="components/footer.jsp"%>
<!-- //footer -->
</body>
</html>
