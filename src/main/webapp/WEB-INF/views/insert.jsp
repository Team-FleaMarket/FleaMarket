<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 2018/6/4
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>添加商品的页面</title>
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
    <script type="text/javascript" src="${pageContext.request.getContextPath()}/static/js/bootstrap.js"></script>
    <!-- //for bootstrap working -->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <!-- animation-effect -->
    <link href="${pageContext.request.getContextPath()}/static/css/animate.min.css" rel="stylesheet">
    <script src="${pageContext.request.getContextPath()}/static/js/wow.min.js"></script>
    <script>
        new WOW().init();
    </script>
</head>
<body>
<%@ include file="/WEB-INF/views/components/header.jsp"%>
<div class="breadcrumbs">
    <div class="container">
        <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
            <li><a href="${pageContext.request.contextPath}/views/index"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>主页</a></li>
            <li class="active">添加商品页面</li>
        </ol>
    </div>
</div>


<div class="register">
    <div class="container">
        <h3 class="animated wow zoomIn" data-wow-delay=".5s">在这里描述商品</h3>
        <p class="est animated wow zoomIn" data-wow-delay=".5s">Describe the details of the goods.</p>
        <div class="login-form-grids"><!--login-form-grids-->
            <h5 class="" data-wow-delay=".5s">商品信息</h5>
            <form action="${pageContext.request.getContextPath()}/goods/insertGoods" class="" data-wow-delay=".5s" method="post" enctype="multipart/form-data">
                <table border="0" align="center" style="border-collapse:separate; border-spacing:25px;">
                    <tr><td>商品名称</td><td><input align="center" type="text" name="goodsName" id="goodsName"></td></tr>
                    <tr><td>商品价格</td><td><input align="center" type="text" name="price" id="price"></td></tr>
                    <tr><td>商品概述</td><td><input align="center" type="text" name="description" id="description"></td></tr>
                    <tr><td>新旧程度</td><td><input align="center" type="text" name="degree" id="degree"></td></tr>
                    <tr>

                        <td>商品分类</td>
                        <td>
                            <select id="cate" name="cate" align="center">
                                <option value="1">图书书籍</option>
                                <option value="2">日用百货</option>
                                <option value="3">娱乐</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td colspan="2">上传照片<input value="file" type="file" name="file" id="file"></td></tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" value="提     交">
                            <%--<input type="submit" value="取     消" onclick="javascript:window.history.back()">--%>
                        </td>
                    </tr>
                </table>
            </form>
        </div>

        <div class="register-home animated wow slideInUp" data-wow-delay=".5s">
            <a href="${pageContext.request.contextPath}/views/index">Home</a>
        </div>
    </div>
</div>
<%@ include file="components/footer.jsp"%>
</body>
</html>
