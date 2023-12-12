<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>轮播图</title>
    <!-- 引入 Bootstrap 样式 -->
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<%--暂时留着这个文件，后续需要用的时候直接更换图片即可--%>
<div class="container mt-4">
    <!-- 轮播图容器 -->
    <div id="carouselExample" class="carousel slide" data-ride="carousel">
        <!-- 轮播项容器 全部存储瓜大图片 显示瓜大特色-->
        <div class="carousel-inner">
            <!-- 第一张轮播项（激活状态） -->
            <div class="carousel-item active">
                <!-- 图片使用 JSTL 的 c:url 标签来获取完整的 URL -->
                <img src="<c:url value="/static/images/carousel/bird's%20eye%20view.png"/>"
                     class="d-block w-100"
                     style="max-height: 600px;max-width: 100%" alt="bird's eye view">
            </div>
            <!-- 第二张轮播项 -->
            <div class="carousel-item">
                <!-- 图片使用 JSTL 的 c:url 标签来获取完整的 URL -->
                <img src="<c:url value="/static/images/carousel/Forging%20swords%20for%20the%20country.jpg"/>"
                     class="d-block w-100"
                     style="max-height: 600px;max-width: 100%" alt="Forging swords for the country">
            </div>
            <!-- 第三张轮播项 -->
            <div class="carousel-item">
                <!-- 图片使用 JSTL 的 c:url 标签来获取完整的 URL -->
                <img src="<c:url value="/static/images/carousel/Kai%20Xiang%20House.jpg"/>"
                     class="d-block w-100"
                     style="max-height: 600px;max-width: 100%" alt="Kai Xiang House">
            </div>
        </div>

        <!-- 轮播控制按钮 - 上一张 -->
        <a class="carousel-control-prev" href="#carouselExample" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <!-- 轮播控制按钮 - 下一张 -->
        <a class="carousel-control-next" href="#carouselExample" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>

    </div>
</div>


<!-- 引入 Bootstrap JavaScript 和 Popper.js -->
<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.slim.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/popper.js/2.10.2/umd/popper.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>

</body>
</html>
