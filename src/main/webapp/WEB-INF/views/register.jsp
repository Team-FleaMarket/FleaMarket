<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<%--head--%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <%@include file="components/jspheader.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/register.css">
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
            <li><a href="${pageContext.request.contextPath}/views/index"><span class="glyphicon glyphicon-home"
                                                                               aria-hidden="true"></span>主页</a></li>
            <li class="active">注册页面</li>
        </ol>
    </div>
</div>
<!-- //breadcrumbs -->
<%--register--%>
<div class="register">
    <div class="container main">
        <div class="row animated wow" data-wow-delay=".5s" ->
            <div class="col-md-4 side-image zoomIn">
                <!-------------      image     ------------->
            </div>

            <div class="col-md-8 right">

                <div class="input-box">

                    <header class="zoomIn">注册</header>
                    <p class="zoomIn">Register for your special account...</p>
                    <%--学号 --%>
                    <div class="input-group mb-2">
                        <i class="input-group-text">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-person-circle" viewBox="0 0 16 16">
                                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                                <path fill-rule="evenodd"
                                      d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                            </svg>
                        </i>
                        <div class="form-floating">
                            <input type="text" class="form-control" id="studentNo" name="studentNo" placeholder=""
                                   required>
                            <label for="studentNo">学号</label>
                            <span class="required">*</span>
                        </div>
                    </div>
                    <%--昵称--%>
                    <div class="input-group mb-2">
                        <i class="input-group-text">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-chat-heart" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                      d="M2.965 12.695a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2Zm-.8 3.108.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125ZM8 5.993c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132Z"/>
                            </svg>
                        </i>
                        <div class="form-floating">
                            <input type="text" class="form-control" id="userName" name="userName" placeholder=""
                                   required>
                            <label for="userName">昵称</label>
                            <span class="required">*</span>
                        </div>
                    </div>
                    <%--学院--%>
                    <div class="input-group mb-3">
                        <i class="input-group-text">
                            <svg class="icon"
                                 style="width: 1em;height: 1em;vertical-align: middle;fill: currentColor;overflow: hidden;"
                                 viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="3827">
                                <path d="M962.112 306.752l-317.12-183.488a266.24 266.24 0 0 0-266.048 0L61.888 306.752a59.648 59.648 0 0 0 0 103.424L224 504v252.16c0 242.24 576 234.24 576 0V504.064l64-37.056v162.944h64V429.952l34.112-19.712a59.712 59.712 0 0 0 0-103.488z m-551.04-128a201.984 201.984 0 0 1 201.856 0L923.776 358.4 612.992 538.368a202.24 202.24 0 0 1-201.984 0L100.224 358.4z m324.928 577.408c0 100.736-247.104 159.296-388.992 77.184a97.92 97.92 0 0 1-59.008-77.184V541.056l91.008 52.672a265.792 265.792 0 0 0 265.984 0l91.008-52.672z"
                                      p-id="3828"></path>
                            </svg>
                        </i>
                        <div class="form-floating">
                            <input type="text" class="form-control" id="department" name="department" placeholder=""
                                   required>
                            <label for="department">学院</label>
                            <span class="required">*</span>
                        </div>
                    </div>
                    <%--联系方式--%>
                    <div class="contact-form">
                        <%--联系方式提示--%>
                        <div class="contact-start mb-3">
                            <h6>联系方式</h6>
                            <span>*</span></div>
                        <%--                        <div class="contact-bar input-group mb-2">--%>
                        <%--                            <span class="input-group-text">@</span>--%>
                        <%--                            <div class="form-floating">--%>
                        <%--                                <input type="text" class="form-control" id="floatingInputGroup1" placeholder="">--%>
                        <%--                                <label for="floatingInputGroup1">联系方式 *</label>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>
                        <%--联系方式--%>
                        <div class="contact-method">
                            <%--手机号--%>
                            <div class="input-group mb-2">
                                <i class="input-group-text">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-phone" viewBox="0 0 16 16">
                                        <path d="M11 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h6zM5 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H5z"/>
                                        <path d="M8 14a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
                                    </svg>
                                </i>
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="phone" name="phone" placeholder="">
                                    <label for="phone">手机号</label>
                                </div>
                            </div>
                            <%--微信号--%>
                            <div class="input-group mb-2">
                                <i class="input-group-text">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-wechat" viewBox="0 0 16 16">
                                        <path d="M11.176 14.429c-2.665 0-4.826-1.8-4.826-4.018 0-2.22 2.159-4.02 4.824-4.02S16 8.191 16 10.411c0 1.21-.65 2.301-1.666 3.036a.324.324 0 0 0-.12.366l.218.81a.616.616 0 0 1 .029.117.166.166 0 0 1-.162.162.177.177 0 0 1-.092-.03l-1.057-.61a.519.519 0 0 0-.256-.074.509.509 0 0 0-.142.021 5.668 5.668 0 0 1-1.576.22ZM9.064 9.542a.647.647 0 1 0 .557-1 .645.645 0 0 0-.646.647.615.615 0 0 0 .09.353Zm3.232.001a.646.646 0 1 0 .546-1 .645.645 0 0 0-.644.644.627.627 0 0 0 .098.356Z"/>
                                        <path d="M0 6.826c0 1.455.781 2.765 2.001 3.656a.385.385 0 0 1 .143.439l-.161.6-.1.373a.499.499 0 0 0-.032.14.192.192 0 0 0 .193.193c.039 0 .077-.01.111-.029l1.268-.733a.622.622 0 0 1 .308-.088c.058 0 .116.009.171.025a6.83 6.83 0 0 0 1.625.26 4.45 4.45 0 0 1-.177-1.251c0-2.936 2.785-5.02 5.824-5.02.05 0 .1 0 .15.002C10.587 3.429 8.392 2 5.796 2 2.596 2 0 4.16 0 6.826Zm4.632-1.555a.77.77 0 1 1-1.54 0 .77.77 0 0 1 1.54 0Zm3.875 0a.77.77 0 1 1-1.54 0 .77.77 0 0 1 1.54 0Z"/>
                                    </svg>
                                </i>
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="wechat" name="wechat" placeholder="">
                                    <label for="wechat">微信</label>
                                </div>
                            </div>
                            <%--QQ号--%>
                            <div class="input-group mb-2">
                                <i class="input-group-text">
                                    <svg class="icon"
                                         style="width: 16px;height: 16px;vertical-align: middle;fill: currentColor;overflow: hidden;"
                                         viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg"
                                         p-id="4250">
                                        <path d="M824.8 613.2c-16-51.4-34.4-94.6-62.7-165.3C766.5 262.2 689.3 112 511.5 112 331.7 112 256.2 265.2 261 447.9c-28.4 70.8-46.7 113.7-62.7 165.3-34 109.5-23 154.8-14.6 155.8 18 2.2 70.1-82.4 70.1-82.4 0 49 25.2 112.9 79.8 159-26.4 8.1-85.7 29.9-71.6 53.8 11.4 19.3 196.2 12.3 249.5 6.3 53.3 6 238.1 13 249.5-6.3 14.1-23.8-45.3-45.7-71.6-53.8 54.6-46.2 79.8-110.1 79.8-159 0 0 52.1 84.6 70.1 82.4 8.5-1.1 19.5-46.4-14.5-155.8z"
                                              p-id="4251"></path>
                                    </svg>
                                </i>
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="QQ" name="QQ" placeholder="">
                                    <label for="QQ">QQ</label>
                                </div>
                            </div>
                            <%--邮箱--%>
                            <div class="input-group mb-3">
                                <i class="input-group-text">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-envelope-at" viewBox="0 0 16 16">
                                        <path d="M2 2a2 2 0 0 0-2 2v8.01A2 2 0 0 0 2 14h5.5a.5.5 0 0 0 0-1H2a1 1 0 0 1-.966-.741l5.64-3.471L8 9.583l7-4.2V8.5a.5.5 0 0 0 1 0V4a2 2 0 0 0-2-2H2Zm3.708 6.208L1 11.105V5.383l4.708 2.825ZM1 4.217V4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v.217l-7 4.2-7-4.2Z"/>
                                        <path d="M14.247 14.269c1.01 0 1.587-.857 1.587-2.025v-.21C15.834 10.43 14.64 9 12.52 9h-.035C10.42 9 9 10.36 9 12.432v.214C9 14.82 10.438 16 12.358 16h.044c.594 0 1.018-.074 1.237-.175v-.73c-.245.11-.673.18-1.18.18h-.044c-1.334 0-2.571-.788-2.571-2.655v-.157c0-1.657 1.058-2.724 2.64-2.724h.04c1.535 0 2.484 1.05 2.484 2.326v.118c0 .975-.324 1.39-.639 1.39-.232 0-.41-.148-.41-.42v-2.19h-.906v.569h-.03c-.084-.298-.368-.63-.954-.63-.778 0-1.259.555-1.259 1.4v.528c0 .892.49 1.434 1.26 1.434.471 0 .896-.227 1.014-.643h.043c.118.42.617.648 1.12.648Zm-2.453-1.588v-.227c0-.546.227-.791.573-.791.297 0 .572.192.572.708v.367c0 .573-.253.744-.564.744-.354 0-.581-.215-.581-.8Z"/>
                                    </svg>
                                </i>
                                <div class="form-floating">
                                    <input type="text" class="form-control" id="email" name="email" placeholder="">
                                    <label for="email">邮箱</label>
                                </div>
                            </div>
                        </div>
                        <div class="contact-end mb-3"></div>
                    </div>
                    <%--密码--%>
                    <div class="input-group mb-2">
                        <i class="input-group-text">
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor"
                                 style="display: inline-block; vertical-align: text-bottom;">
                                <path d="M6 9V7.25C6 3.845 8.503 1 12 1s6 2.845 6 6.25V9h.5a2.5 2.5 0 0 1 2.5 2.5v8a2.5 2.5 0 0 1-2.5 2.5h-13A2.5 2.5 0 0 1 3 19.5v-8A2.5 2.5 0 0 1 5.5 9Zm-1.5 2.5v8a1 1 0 0 0 1 1h13a1 1 0 0 0 1-1v-8a1 1 0 0 0-1-1h-13a1 1 0 0 0-1 1Zm3-4.25V9h9V7.25c0-2.67-1.922-4.75-4.5-4.75-2.578 0-4.5 2.08-4.5 4.75Z"></path>
                            </svg>
                        </i>
                        <div class="form-floating">
                            <input type="password" class="form-control" id="password" name="password" placeholder=""
                                   required>
                            <label for="password">密码</label>
                            <span class="required">*</span>
                        </div>
                    </div>
                    <%--确认密码--%>
                    <div class="input-group mb-3">
                        <i class="input-group-text">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-person-lock" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                      d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Z"/>
                                <path d="M8 14v-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10c.26 0 .507.009.74.025.226-.341.496-.65.804-.918C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4s1 1 1 1h5Zm1-1a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-4a1 1 0 0 1-1-1v-2Z"/>
                                <path fill-rule="evenodd"
                                      d="M12 10a1 1 0 0 0-1 1v1.5a.5.5 0 0 1-1 0V11a2 2 0 1 1 4 0v1.5a.5.5 0 0 1-1 0V11a1 1 0 0 0-1-1Z"/>
                            </svg>
                        </i>
                        <div class="form-floating">
                            <input type="password" class="form-control" id="repassword" name="repassword"
                                   placeholder="" required>
                            <label for="repassword">确认密码</label>
                            <span class="required">*</span>
                        </div>
                    </div>
                    <%--登录按钮--%>
                    <div class="input-field">
                        <input type="button" class="button" id="liveToastBtn" value="注册">
                    </div>
                    <%--注册跳转--%>
                    <div class="tologin">
                        <span>已有账号？请点击 <a href="${pageContext.request.contextPath}/login">登录</a></span>
                    </div>
                </div>

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
                <%-- 注册失败消息提示 end--%>
            </div>
        </div>
    </div>
</div>
<%--footer--%>
<%@include file="components/footer.jsp" %>
<%--footer--%>
</body>
</html>