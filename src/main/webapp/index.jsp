<%--
  Created by IntelliJ IDEA.
  User: Zhang Xin
  Date: 2023/12/12 0012
  Time: 19:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <%@ include file="/WEB-INF/views/components/htmlhead.jsp"%>
    <link href="${pageContext.request.getContextPath()}/static/css/homeview.css" rel="stylesheet" type="text/css" media="all" />
</head>

<body>
<!-- header -->
<%@ include file="/WEB-INF/views/components/header.jsp"%>
<!-- // header -->
<section class="background min-vh-100">
    <!-- categories -->
    <div id="category" class="category container mt-4">
        <!-- carousel -->
        <div id="NPUcarousel" class="carousel slide">
            <div class="carousel-inner">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#NPUcarousel" data-bs-slide-to="0"
                            class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#NPUcarousel" data-bs-slide-to="1"
                            aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#NPUcarousel" data-bs-slide-to="2"
                            aria-label="Slide 3"></button>
                    <button type="button" data-bs-target="#NPUcarousel" data-bs-slide-to="3"
                            aria-label="Slide 4"></button>
                </div>
                <div class="carousel-item active c-item">
                    <img src="${pageContext.request.getContextPath()}/static/images/carousel/NPU1.jpg" class="d-block w-100 c-img"
                         alt="university">
                </div>
                <div class="carousel-item active c-item">
                    <img src="${pageContext.request.getContextPath()}/static/images/carousel/NPU2.jpg" class="d-block w-100 c-img"
                         alt="university">
                </div>
                <div class="carousel-item c-item">
                    <img src="${pageContext.request.getContextPath()}/static/images/carousel/NPU3.jpg" class="d-block w-100 c-img"
                         alt="university">
                </div>
                <div class="carousel-item c-item">
                    <img src="${pageContext.request.getContextPath()}/static/images/carousel/NPU4.webp" class="d-block w-100 c-img"
                         alt="university">
                </div>
            </div>
            <button class="carousel-control-prev btn" type="button" data-bs-target="#NPUcarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next btn" type="button" data-bs-target="#NPUcarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        <!-- carousel end -->

        <!-- categories -->
        <div id="categories" class="categories">
            <!-- goods type -->
            <div class="goods row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4 py-5">
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title fw-bold">教材</h4>
                        </div>
                        <img src="${pageContext.request.getContextPath()}/static/images/2.jpg" class="card-img-top" alt="...">
                    </div>
                </div>
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title fw-bold">考试</h4>

                        </div>
                        <img src="${pageContext.request.getContextPath()}/static/images/2.jpg" class="card-img-top" alt="...">
                    </div>
                </div>
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title fw-bold">艺术文学</h4>

                        </div>
                        <img src="${pageContext.request.getContextPath()}/static/images/2.jpg" class="card-img-top" alt="...">
                    </div>
                </div>
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title fw-bold">运动</h4>

                        </div>
                        <img src="${pageContext.request.getContextPath()}/static/images/2.jpg" class="card-img-top" alt="...">
                    </div>
                </div>
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title fw-bold">文具</h4>

                        </div>
                        <img src="${pageContext.request.getContextPath()}/static/images/3.jpg" class="card-img-top" alt="...">
                    </div>
                </div>
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title fw-bold">生活</h4>

                        </div>
                        <img src="${pageContext.request.getContextPath()}/static/images/4.jpg" class="card-img-top" alt="...">
                    </div>
                </div>
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title fw-bold">美妆</h4>

                        </div>
                        <img src="${pageContext.request.getContextPath()}/static/images/5.jpg" class="card-img-top" alt="...">
                    </div>
                </div>
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title fw-bold">电子产品</h4>
                        </div>
                        <img src="${pageContext.request.getContextPath()}/static/images/6.jpg" class="card-img-top" alt="...">
                    </div>
                </div>
            </div>

            <script>
                document.querySelectorAll(".card").forEach((card, index) => {
                    card.onclick = async () => {
                        const cate = index + 1;
                        window.location.href = window.location.origin + "/views/" + cate + "/" + 1
                    }
                })
                // 获取动态变化的div和需要设置高度的div
                let dynamicDiv = document.getElementById('categories');
                let targetDiv = document.getElementById('category');
                const observer = new ResizeObserver(() => {
                    targetDiv.style.height = (dynamicDiv.clientHeight + 220) + 'px'

                });
                observer.observe(dynamicDiv);
            </script>
            <!-- goods type end-->
        </div>
        <!-- categories end -->
    </div>
</section>
<!-- footer -->
<%@include file="/WEB-INF/views/components/footer.jsp" %>
</body>
</html>