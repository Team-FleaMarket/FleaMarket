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
    <%@ include file="components/jspheader.jsp"%>
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
            <form action="${pageContext.request.contextPath}/user/registeruser" id="form"
                  class="animated wow slideInUp" data-wow-delay=".5s">
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
                <input type="submit" id="chk" name="chk" value="注册" onclick="return registerCheck()">
                <button type="button" class="btn btn-primary" id="liveToastBtn" >注册</button>
            </form>
            <p class="animated wow slideInUp">已有账号？请点击<a
                    href="${pageContext.request.contextPath}/views/login">登录</a></p>

        <%-- 注册成功或失败消息提示 --%>
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
            import { registerAPI } from '/static/js/apis/student.js'
            document.querySelector("#liveToastBtn").onclick = async () => {
                var studentNo = $("input[name=studentNo]").val()
                var name = $("input[name=name]").val()
                var phone = $("input[name=phone]").val()
                var wechat = $("input[name=wechat]").val()
                var email = $("input[name=email]").val()
                var password = $("input[name=password]").val()
                var message = ""
                try {
                    var response = await registerAPI({ studentNo, name, phone, wechat, email, password })
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
    <!-- //register -->
</div>
<!-- footer -->
<%-- <div class="footer">
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
             <h2><a href="${pageContext.request.contextPath}/views/index">GoodsWill <span>shop anywhere</span></a>
             </h2>
         </div>
         <div class="copy-right animated wow slideInUp" data-wow-delay=".5s">
             <p>Copyright &copy; 2018.Company name All rights reserved.
                 <a href="${pageContext.request.contextPath}/views/index" target="_blank"
                    title="GoodsPass">GoodsWill</a>
         </div>
     </div>
 </div>--%>
<%@include file="components/footer.jsp" %>
<!-- //footer -->

</body>
</html>
