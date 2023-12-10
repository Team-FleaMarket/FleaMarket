<%--
  Created by IntelliJ IDEA.
  User: YF
  Date: 2023/12/6
  Time: 21:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>header</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Best Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
    function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- //for-mobile-apps -->
    <link href="${pageContext.request.getContextPath()}/static/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="${pageContext.request.getContextPath()}/static/css/header.css" rel="stylesheet" type="text/css" media="all" />
    <!-- js -->
    <script src="${pageContext.request.getContextPath()}/static/js/jquery.min.js"></script>
    <!-- //js -->
    <!-- cart -->
    <script src="${pageContext.request.getContextPath()}/static/js/simpleCart.min.js"></script>
    <!-- cart -->
    <!-- for bootstrap working -->
    <script type="text/javascript" src="${pageContext.request.getContextPath()}/static/js/bootstrap-3.1.1.min.js"></script>
    <!-- //for bootstrap working -->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <!-- timer -->
    <link rel="stylesheet" href="${pageContext.request.getContextPath()}/static/css/jquery.countdown.css" />
    <!-- //timer -->
    <!-- animation-effect -->
    <link href="${pageContext.request.getContextPath()}/static/css/animate.min.css" rel="stylesheet">
    <script src="${pageContext.request.getContextPath()}/static/js/wow.min.js"></script>
    <script>
        new WOW().init();
    </script>
    <!-- //animation-effect -->
</head>
<body>
    <div class="header">
        <div class="container">
            <div class="row">
                <div class="col-4">
                    <div class="logo-nav-left animated wow zoomIn" data-wow-delay=".1s">
                        <h1><a href="${pageContext.request.getContextPath()}/">FleaMarket<span>welcome</span></a></h1>
                        <br>
                    </div>
                </div>
                <div class="col-7">
                    <div class="col-1 logo-nav-left1 navbar">
                        <c:if test="${sessionScope.user == null}">
                            <a href="${pageContext.request.contextPath}/" class="act">主页</a>
                        </c:if>
                        <c:if test="${sessionScope.user != null}">
                            <a href="${pageContext.request.contextPath}/views/index" class="act">主页</a>
                        </c:if>
                    </div>
                    <div class="col-2 logo-nav-left1 navbar dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">商品分类 <b class="caret"></b></a>
                        <ul class="dropdown-menu columns-3">
                            <div class="row">
                                <div class="col-sm-4">
                                    <ul class="multi-column-dropdown">
                                        <h6>图书书籍</h6>
                                        <li><a href="${pageContext.request.contextPath}/views/books">教材</a></li>
                                        <li><a href="${pageContext.request.contextPath}/views/tests">考试</a></li>
                                        <li><a href="${pageContext.request.contextPath}/views/literature">艺术文学</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-4">
                                    <ul class="multi-column-dropdown">
                                        <h6>日用百货</h6>
                                        <li><a href="${pageContext.request.contextPath}/views/sports">运动类</a></li>
                                        <li><a href="${pageContext.request.contextPath}/views/stationery">文具类</a></li>
                                        <li><a href="${pageContext.request.contextPath}/views/life">生活类</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-4">
                                    <ul class="multi-column-dropdown">
                                        <h6>娱乐</h6>
                                        <li><a href="${pageContext.request.contextPath}/views/beautymakeup">美妆</a></li>
                                        <li><a href="${pageContext.request.contextPath}/views/electronicproducts">电子产品</a></li>
                                    </ul>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </ul>
                    </div>
                    <div class="col-2 logo-nav-left1 navbar">

                        <c:if test="${sessionScope.user == null}">
                            <a href="${pageContext.request.contextPath}/views/login">管理中心</a>
                        </c:if>
                        <c:if test="${sessionScope.user != null}">
                            <a href="${pageContext.request.contextPath}/views/managecenter">管理中心</a>
                        </c:if>
                    </div>
                    <div id="sb-search" class="sb-search">
                        <form>
                            <input class="sb-search-input" placeholder="输入你想搜索的商品" type="search" id="search">
                            <input class="sb-search-submit" type="submit" value="">
                            <span class="sb-icon-search"> </span>
                        </form>
                    </div>
                    <!-- search-scripts -->
                    <script src="${pageContext.request.getContextPath()}/static/js/classie.js"></script>
                    <script src="${pageContext.request.getContextPath()}/static/js/uisearch.js"></script>
                    <script>
                        new UISearch( document.getElementById( 'sb-search' ) );
                    </script>
                </div>
                <div class="col-1">
                    <div class="login">
                        <a href="${pageContext.request.contextPath}/views/checkout">
                            <i class="glyphicon glyphicon-log-in" aria-hidden="true"></i>
                            <c:if test="${sessionScope.user == null}">
                                <a href="${pageContext.request.contextPath}/views/login">登陆</a>
                            </c:if>
                            <c:if test="${sessionScope.user != null}">
                                <a href="${pageContext.request.contextPath}/views/managecenter">${sessionScope.user.username}</a>
                            </c:if>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
