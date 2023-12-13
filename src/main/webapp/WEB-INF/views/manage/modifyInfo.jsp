<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Zhang Xin
  Date: 2023/12/9 0009
  Time: 13:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Personal Dashboard</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<c:url value="/static/css/personalManagement.css"/>">
    <link rel="stylesheet" href="/bootstrap-icons-1.11.1/bootstrap-icons.css">
</head>

<body>
<div class="panel" id="panel">
    <div class="panel-left">
<%--        <a href="http://localhost:8080/FleaMarket/views/login" class="btn btn-link">--%>
<%--            <i class="bi bi-arrow-left"></i>--%>
<%--        </a>--%>
        <p></p>
<%--    先随便放张图--%>
    <c:if test="${sessionScope.student.img!=null}">
        <img src="${pageContext.request.contextPath}/static/images/avatar/${sessionScope.student.studentNo}.jpg" alt=" " class="header avatar rounded-circle mx-auto d-block" >
    </c:if>
    <c:if test="${sessionScope.student.img==null}">
        <%--                                        <button type="button" class="avatar-button border-0 rounded-circle" > <img src="/static/images/avatar/nwpu.jpg" class="avatar rounded-circle mx-auto d-block" /></button>--%>
        <img src="${pageContext.request.contextPath}/static/images/avatar/nwpu.jpg" alt=" " class="header avatar rounded-circle mx-auto d-block" >
        <div class="avatar overlay rounded-circle">
            <input type="file" accept="image/*" id="imageInput" style="display: none;">
            <button  class="avatar-button rounded-3" onclick="uploadImage()">上传图像</button>
            <script>
                function uploadImage() {
                    document.getElementById('imageInput').click();
                }
                document.getElementById('imageInput').addEventListener('change', function () {
                    var selectedFile = this.files[0];
                    if (selectedFile) {
                        var formData = new FormData();
                        formData.append('image', selectedFile);
                        console.log('Selected file:', selectedFile);
                    }
                });
            </script>
        </div>
    </c:if>
        <p></p>
        <h3 class="name">Zhsj</h3>
        <div class="options">
            <button class="btn btn-option active" onclick="showPersonalInfo()" data-target="personalInfo">个人信息修改
            </button>
            <button class="btn btn-option" onclick="logout()" data-target="logout">Logout</button>
            <button class="btn btn-option" onclick="showOther()" data-target="other">其他</button>
        </div>
    </div>
    <div class="panel-right" id="panelRight">
        <!-- Right panel content will be dynamically filled -->
        <!-- 在这里添加一个隐藏的表单，用于提交修改后的个人信息 -->
        <form id="updateUserInfoForm" style="display:none;">
            <input type="hidden" id="updatedStudentNo" name="studentNo">
            <input type="hidden" id="updatedUserName" name="userName">
            <input type="hidden" id="updatedWechat" name="wechat">
            <input type="hidden" id="updatedPhone" name="phone">
            <input type="hidden" id="updatedEmail" name="email">
            <!-- 添加其他需要更新的字段，如wechat、phone、email等 -->
            <button type="submit" id="submitUpdateUserInfo"></button>
        </form>
    </div>
</div>
<!-- footer -->
<%@include file="/WEB-INF/views/components/footer.jsp" %>
<!-- //footer -->
<!-- Bootstrap JS and jQuery Slim JS -->
<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
<script src="<c:url value="/static/js/personalManagement.js"/>"></script>
</body>

</html>
