<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 2018/5/4
  Time: 21:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Best Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
    function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //for-mobile-apps -->
    <link href="${pageContext.request.getContextPath()}/static/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="${pageContext.request.getContextPath()}/static/css/style.css" rel="stylesheet" type="text/css" media="all" />
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
<!-- header -->
<%@ include file="/WEB-INF/views/components/header.jsp"%>
<div class="new-collections">
    <div class="container">
        <h3 class="animated wow zoomIn" data-wow-delay=".2s">商品</h3>
        <p class="est animated wow zoomIn" data-wow-delay=".2s">你想要的商品都在这里，你喜欢的商品在这里都能找到。</p>
        <div class="new-collections-grids">
            <h2 class="animated wow zoomIn" data-wow-delay=".5s">
                <em>图书书籍</em>
                <a class="header-grid-right" href="${pageContext.request.contextPath}/views/books">更多 >></a>
            </h2>
            <div class="row">
                <div class="col-4 new-collections-grid">
                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5" class="product-image"><img src="${pageContext.request.getContextPath()}/static/images/jc1.jpg" alt=" " class="img-responsive" height="400"/></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">成本会计</a></h4>
                        <p>教材类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p><span class="item_price">￥15</span><a class="item_add" href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a></p>
                        </div>
                    </div>
                </div>
                <div class="col-4 new-collections-grid">
                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5" class="product-image"><img src="${pageContext.request.getContextPath()}/static/images/jc2.jpg" alt=" " class="img-responsive" /></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">动态网页设计与制作</a></h4>
                        <p>教材类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p><span class="item_price">￥22</span><a class="item_add" href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a></p>
                        </div>
                    </div>
                </div>
                <div class="col-4 new-collections-grid">
                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5" class="product-image"><img src="${pageContext.request.getContextPath()}/static/images/jc3.jpg" alt=" " class="img-responsive" /></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Deep Learning</a></h4>
                        <p>教材类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p><span class="item_price">￥35</span><a class="item_add" href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a></p>
                        </div>
                    </div>
                </div>
                <div class="col-4 new-collections-grid">
                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5" class="product-image"><img src="${pageContext.request.getContextPath()}/static/images/jc4.jpg" alt=" " class="img-responsive" /></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">市场营销学</a></h4>
                        <p>教材类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p> <span class="item_price">￥12</span><a class="item_add" href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a></p>
                        </div>
                    </div>
                </div>
                <div class="col-4 new-collections-grid">
                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5" class="product-image"><img src="${pageContext.request.getContextPath()}/static/images/ks1.jpg" alt=" " class="img-responsive" /></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">CIA</a></h4>
                        <p>考试类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p> <span class="item_price">￥50</span><a class="item_add" href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a></p>
                        </div>
                    </div>
                </div>

                <div class="col-4 new-collections-grid">
                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5" class="product-image"><img src="${pageContext.request.getContextPath()}/static/images/ks2.jpg" alt=" " class="img-responsive" /></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">初级会计实务</a></h4>
                        <p>考试类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p><span class="item_price">￥10</span><a class="item_add" href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a></p>
                        </div>
                    </div>

                </div>
                <div class="col-4 new-collections-grid">
                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5" class="product-image"><img src="${pageContext.request.getContextPath()}/static/images/yswx1.jpg" alt=" " class="img-responsive" /></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">白洋淀纪事</a></h4>
                        <p>艺术文学类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p><span class="item_price">￥22</span><a class="item_add" href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a></p>
                        </div>
                    </div>

                </div>

                <div class="col-4 new-collections-grid">
                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5" class="product-image"><img src="${pageContext.request.getContextPath()}/static/images/yswx2.jpg" alt=" " class="img-responsive" /></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">传统文学艺术赏析</a></h4>
                        <p>艺术文学类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p><span class="item_price">￥15</span><a class="item_add" href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a></p>
                        </div>
                    </div>
                </div>

                <div class="clearfix"> </div>
            </div>
        </div>


        <div class="new-collections-grids">
            <h2 class="animated wow zoomIn" data-wow-delay=".5s">
                <em>日用百货</em>
                <a class="header-grid-right" href="${pageContext.request.contextPath}/views/sports">更多 >></a>
            </h2>
            <div class="row">
                <div class="col-4 new-collections-grid">
                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5" class="product-image"><img src="${pageContext.request.getContextPath()}/static/images/sh17.jpg" alt=" " class="img-responsive" /></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">肥皂盒</a></h4>
                        <p>生活类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p><span class="item_price">￥3</span><a class="item_add" href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a></p>
                        </div>
                    </div>
                </div>

                <div class="col-4 new-collections-grid">
                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5" class="product-image"><img src="${pageContext.request.getContextPath()}/static/images/sh12.jpg" alt=" " class="img-responsive" /></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">台灯</a></h4>
                        <p>生活类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p><span class="item_price">￥35</span><a class="item_add" href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a></p>
                        </div>
                    </div>
                </div>

                <div class="col-4 new-collections-grid">

                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5" class="product-image"><img src="${pageContext.request.getContextPath()}/static/images/sh2.jpg" alt=" " class="img-responsive" /></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">电风扇</a></h4>
                        <p>生活类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p></i> <span class="item_price">￥35</span><a class="item_add" href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a></p>
                        </div>
                    </div>

                </div>

                <div class="col-4 new-collections-grid">
                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5" class="product-image"><img src="${pageContext.request.getContextPath()}/static/images/sh9.jpg" alt=" " class="img-responsive" /></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">脸盆</a></h4>
                        <p>生活类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p><span class="item_price">￥10</span><a class="item_add" href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a></p>
                        </div>
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>

        <div class="new-collections-grids">
            <h2 class="animated wow zoomIn" data-wow-delay=".5s">
                <em>娱乐</em>
                <a class="header-grid-right" href="${pageContext.request.contextPath}/views/sports">更多 >></a>
            </h2>
            <div class="row">
                <div class="col-4 new-collections-grid">
                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5" class="product-image"><img src="${pageContext.request.getContextPath()}/static/images/yd2.jpg" alt=" " class="img-responsive" /></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">乒乓</a></h4>
                        <p>运动类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p><span class="item_price">￥50</span><a class="item_add" href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a></p>
                        </div>
                    </div>
                </div>

                <div class="col-4 new-collections-grid">
                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5" class="product-image"><img src="${pageContext.request.getContextPath()}/static/images/yd13.jpg" alt=" " class="img-responsive" /></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">瑜伽垫</a></h4>
                        <p>运动类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p><span class="item_price">￥30</span><a class="item_add" href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a></p>
                        </div>
                    </div>

                </div>

                <div class="col-4 new-collections-grid">
                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5" class="product-image"><img src="${pageContext.request.getContextPath()}/static/images/mz15.jpg" alt=" " class="img-responsive" /></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">口红</a></h4>
                        <p>美妆类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p><span class="item_price">￥100</span><a class="item_add" href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a></p>
                        </div>
                    </div>

                </div>

                <div class="col-4 new-collections-grid">
                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5" class="product-image"><img src="${pageContext.request.getContextPath()}/static/images/mz19.jpg" alt=" " class="img-responsive" /></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive" />
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">纪梵希</a></h4>
                        <p>美妆类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p><span class="item_price">￥200</span><a class="item_add" href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a></p>
                        </div>
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
</div>





<!-- //new-timer -->
<!-- collections-bottom -->
<%--<div class="collections-bottom">--%>
<%--    <div class="container">--%>
<%--        <div class="collections-bottom-grids">--%>
<%--            <div class="collections-bottom-grid animated wow slideInLeft" data-wow-delay=".5s">--%>
<%--                <h3>45% Offer For <span>Women & Children's</span></h3>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="newsletter animated wow slideInUp" data-wow-delay=".5s">--%>
<%--            <h3>Newsletter</h3>--%>
<%--            <p>Join us now to get all news and special offers.</p>--%>
<%--            <form>--%>
<%--                <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>--%>
<%--                <input type="email" value="Enter your email address" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Enter your email address';}" required="">--%>
<%--                <input type="submit" value="Join Us" >--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<!-- //collections-bottom -->
<!-- footer -->
<div class="footer">
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
                    <li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a href="mailto:info@example.com">张旱文 12345678900@example.com</a></li>
                    <li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a href="mailto:info@example.com">徐孟达 dxxmda@126.com</a></li>
                    <li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a href="mailto:info@example.com">许多 13817717084@163.com</a></li>
                    <li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a href="mailto:info@example.com">熊凯丽 65356789011@example.com</a></li>
                    <li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a href="mailto:info@example.com">张乐乐 lelesunshine614@gmail.com</a></li>
                </ul>
            </div>

            <div class="col-md-4 footer-grid animated wow slideInLeft" data-wow-delay=".7s">
                <h3>Partners</h3>
                <div class="footer-grid-left">
                    <a href="http://www.shnu.edu.cn/"><img src="${pageContext.request.getContextPath()}/static/images/13.png" alt=" " class="img-responsive" /></a>
                </div>
                <div class="footer-grid-left">
                    <a href="http://www.shnu.edu.cn/"><img src="${pageContext.request.getContextPath()}/static/images/13.png" alt=" " class="img-responsive" /></a>
                </div>
                <div class="footer-grid-left">
                    <a href="http://www.shnu.edu.cn/"><img src="${pageContext.request.getContextPath()}/static/images/13.png" alt=" " class="img-responsive" /></a>
                </div>
                <div class="footer-grid-left">
                    <a href="http://www.shnu.edu.cn/"><img src="${pageContext.request.getContextPath()}/static/images/13.png" alt=" " class="img-responsive" /></a>
                </div>
                <div class="footer-grid-left">
                    <a href="http://www.shnu.edu.cn/"><img src="${pageContext.request.getContextPath()}/static/images/13.png" alt=" " class="img-responsive" /></a>
                </div>
                <div class="footer-grid-left">
                    <a href="http://www.shnu.edu.cn/"><img src="${pageContext.request.getContextPath()}/static/images/13.png" alt=" " class="img-responsive" /></a>
                </div>
                <div class="clearfix"> </div>
            </div>

            <div class="clearfix"> </div>
        </div>
        <div class="footer-logo animated wow slideInUp" data-wow-delay=".5s">
            <h2><a href="index.jsp">FleaMarket <span>shop anywhere</span></a></h2>
        </div>
        <div class="copy-right animated wow slideInUp" data-wow-delay=".5s">
                <a href="index.jsp" target="_blank" title="GoodsPass">FleaMarket</a>
        </div>
    </div>
</div>
<!-- //footer -->
</body>
</html>