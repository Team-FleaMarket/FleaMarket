<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 2018/5/21
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Books</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Best Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design"/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!-- //for-mobile-apps -->
    <link href="${pageContext.request.getContextPath()}/static/css/bootstrap.css" rel="stylesheet" type="text/css"
          media="all"/>
    <%--    <link href="${pageContext.request.getContextPath()}/static/css/style.css" rel="stylesheet" type="text/css" media="all" />--%>
    <link href="${pageContext.request.getContextPath()}/static/css/products.css" rel="stylesheet" type="text/css"
          media="all"/>
    <link href="${pageContext.request.getContextPath()}/static/css/collections.css" rel="stylesheet" type="text/css"
          media="all"/>
    <!-- js -->
    <script src="${pageContext.request.getContextPath()}/static/js/jquery.min.js"></script>
    <!-- //js -->
    <!-- cart -->
    <script src="${pageContext.request.getContextPath()}/static/js/simpleCart.min.js"></script>
    <!-- cart -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.getContextPath()}/static/css/jquery-ui.css">
    <!-- for bootstrap working -->
    <script type="text/javascript"
            src="${pageContext.request.getContextPath()}/static/js/bootstrap-3.1.1.min.js"></script>
    <!-- //for bootstrap working -->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
          rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic'
          rel='stylesheet' type='text/css'>
    <!-- animation-effect -->
    <link href="${pageContext.request.getContextPath()}/static/css/animate.min.css" rel="stylesheet">
    <script src="${pageContext.request.getContextPath()}/static/js/wow.min.js"></script>
    <script>
        new WOW().init();
    </script>
    <!-- //animation-effect -->
</head>

<body>
<%@ include file="/WEB-INF/views/components/header.jsp" %>
<!-- breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
            <li><a href="${pageContext.request.contextPath}/views/index"><span class="glyphicon glyphicon-home"
                                                                               aria-hidden="true"></span>主页</a></li>
            <li class="active">商品分类</li>
            <li class="active">教材</li>
        </ol>
    </div>
</div>
<div class="products">
    <div class="container">
        <%--<div class="cate row">
            <div class="col-sm-4">
                <div class='row'>
                    <li><a href="Endpoint?category=books">图书书籍</a></li>
                    <div class="col-sm-4">
                        <li><a href="Endpoint?category=books">教材</a></li>
                        <li><a href="Endpoint?category=tests">考试</a></li>
                        <li><a href="Endpoint?category=literature">文学</a></li>
                    </div>
                </div>

                <li><a href="Endpoint?category=sports">日用百货</a></li>
                <li><a href="Endpoint?category=beautymakeup">娱乐</a></li>
            </div>
        </div>--%>
        <div class="categories row animated wow" data-wow-delay=".5s">
            <div class="col-md-4 slideInUp">
                <h3>商品分类</h3>
                <ul class="cate">
                    <li><a href="${pageContext.request.contextPath}/views/books">图书书籍</a>
                        <span>(${bookList.size()+33})</span></li>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/views/books">教材</a> <span></span></li>
                        <li><a href="${pageContext.request.contextPath}/views/tests">考试</a> <span></span></li>
                        <li><a href="${pageContext.request.contextPath}/views/literature">文学</a> <span></span></li>
                    </ul>
                    <li><a href="${pageContext.request.contextPath}/views/sports">日用百货</a>
                        <span>(${bookList.size()+36})</span></li>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/views/sports">运动类</a> <span></span></li>
                        <li><a href="${pageContext.request.contextPath}/views/stationery">文具类</a> <span></span></li>
                        <li><a href="${pageContext.request.contextPath}/views/life">生活类</a> <span></span></li>
                    </ul>
                    <li><a href="${pageContext.request.contextPath}/views/beautymakeup">娱乐</a>
                        <span>(${bookList.size()+24})</span></li>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/views/beautymakeup">美妆</a> <span></span></li>
                        <li><a href="${pageContext.request.contextPath}/views/electronicproducts">电子产品</a> <span></span>
                        </li>
                    </ul>
                </ul>
            </div>
            <div class="col-md-8">
                <div class="slideInRight products-right-grids-position" data-wow-delay=".5s">
                    <img src="${pageContext.request.contextPath}/static/images/tssj.jpg" class="img-fluid" alt=""/>
                </div>
                <div class="">
                    <h4>教材</h4>
                    <p>GoodsWill:books.</p>
                    <%--<h4>${sessionScope.category}</h4>
                    <p>GoodsWill:${sessionScope.parentCategory}.</p>--%>
                </div>
            </div>
        </div>
        <div class="row new-collections">
            <div class="col-md-3 new-collections-grid">
                <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                    <div class="new-collections-grid1-image">
                        <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5"><img
                                src="${pageContext.request.getContextPath()}/static/images/jc1.jpg" alt=" "
                                class="img-fluid"/></a>
                        <div class="new-collections-grid1-image-pos">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                        </div>
                    </div>
                    <div class="item-information">
                        <div class="item-name">
                            <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">成本会计</a></h4>
                        </div>
                        <div class="item-price">
                            <h4>
                                <p>￥15</p>
                            </h4>
                        </div>
                    </div>

                    <div class="item-categories">
                        <p>图书书籍</p>
                        <p>文学</p>
                    </div>
                </div>
            </div>

            <div class="col-md-3 new-collections-grid">
                <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                    <div class="new-collections-grid1-image">
                        <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5"><img
                                src="${pageContext.request.getContextPath()}/static/images/jc1.jpg" alt=" "
                                class="img-fluid"/></a>
                        <div class="new-collections-grid1-image-pos">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                        </div>
                    </div>
                    <div class="item-information">
                        <div class="item-name">
                            <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">成本会计</a></h4>
                        </div>
                        <div class="item-price">
                            <h4>
                                <p>￥15</p>
                            </h4>
                        </div>
                    </div>

                    <div class="item-categories">
                        <p>图书书籍</p>
                        <p>文学</p>
                    </div>
                </div>
            </div>

            <div class="col-md-3 new-collections-grid">
                <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                    <div class="new-collections-grid1-image">
                        <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5"><img
                                src="${pageContext.request.getContextPath()}/static/images/jc1.jpg" alt=" "
                                class="img-fluid"/></a>
                        <div class="new-collections-grid1-image-pos">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                        </div>
                    </div>
                    <div class="item-information">
                        <div class="item-name">
                            <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">成本会计</a></h4>
                        </div>
                        <div class="item-price">
                            <h4>
                                <p>￥15</p>
                            </h4>
                        </div>
                    </div>

                    <div class="item-categories">
                        <p>图书书籍</p>
                        <p>文学</p>
                    </div>
                </div>
            </div>

            <div class="col-md-3 new-collections-grid">
                <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                    <div class="new-collections-grid1-image">
                        <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5"><img
                                src="${pageContext.request.getContextPath()}/static/images/jc1.jpg" alt=" "
                                class="img-fluid"/></a>
                        <div class="new-collections-grid1-image-pos">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                        </div>
                    </div>
                    <div class="item-information">
                        <div class="item-name">
                            <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">成本会计</a></h4>
                        </div>
                        <div class="item-price">
                            <h4>
                                <p>￥15</p>
                            </h4>
                        </div>
                    </div>

                    <div class="item-categories">
                        <p>图书书籍</p>
                        <p>文学</p>
                    </div>
                </div>
            </div>

            <div class="col-md-3 new-collections-grid">
                <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                    <div class="new-collections-grid1-image">
                        <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5"><img
                                src="${pageContext.request.getContextPath()}/static/images/jc1.jpg" alt=" "
                                class="img-fluid"/></a>
                        <div class="new-collections-grid1-image-pos">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                        </div>
                    </div>
                    <div class="item-information">
                        <div class="item-name">
                            <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">成本会计</a></h4>
                        </div>
                        <div class="item-price">
                            <h4>
                                <p>￥15</p>
                            </h4>
                        </div>
                    </div>

                    <div class="item-categories">
                        <p>图书书籍</p>
                        <p>文学</p>
                    </div>
                </div>
            </div>
        </div>


        <div class="clearfix"></div>


        <!--<h2 class="animated wow zoomIn" data-wow-delay=".5s">
                <a class="header-grid-right" href="${pageContext.request.contextPath}/static/">更多</a>
            </h2>-->

        <div class="clearfix"></div>

    </div>
</div>


<!-- //breadcrumbs -->
<!-- footer -->
<%@include file="components/footer.jsp" %>
<!-- //footer -->
</body>
</html>
