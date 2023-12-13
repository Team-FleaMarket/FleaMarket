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
    <link rel="stylesheet" href="<c:url value="/static/css/overviewProduct.css"/>">
</head>

<body>
<!-- header -->
<%@ include file="/WEB-INF/views/components/header.jsp"%>
<!-- carousel -->
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
<!-- carousel -->

<p></p>
<!-- overviewProduct -->
<div class="new-collections">
    <div class="container">
        <h3 class="animated wow zoomIn" data-wow-delay=".2s">商品</h3>
        <p class="est animated wow zoomIn" data-wow-delay=".2s">你想要的商品都在这里，你喜欢的商品在这里都能找到。</p>
        <div class="new-collections-grids">
            <h2 class="animated wow zoomIn" data-wow-delay=".5s">
                <em>图书书籍</em>
                <a class="header-grid-right" href="${pageContext.request.contextPath}/views/books">更多 >></a>
            </h2>
            <div class="row items">
                <div class="col-xs-12 col-sm-6 col-lg-3 new-collections-grid">
                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5"
                               class="product-image item"><img
                                    src="${pageContext.request.getContextPath()}/static/images/jc1.jpg" alt=" "
                                    class="img-responsive img-wrap" height="400"/></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">成本会计</a></h4>
                        <p>教材类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p><span class="item_price">￥15</span><a class="item_add"
                                                                     href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-lg-3 new-collections-grid">
                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5"
                               class="product-image item"><img
                                    src="${pageContext.request.getContextPath()}/static/images/jc2.jpg" alt=" "
                                    class="img-responsive item-wrap"/></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <h4>
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">动态网页设计与制作</a>
                        </h4>
                        <p>教材类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p><span class="item_price">￥22</span><a class="item_add"
                                                                     href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-lg-3 new-collections-grid">
                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5"
                               class="product-image item"><img
                                    src="${pageContext.request.getContextPath()}/static/images/jc3.jpg" alt=" "
                                    class="img-responsive item-wrap"/></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Deep Learning</a>
                        </h4>
                        <p>教材类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p><span class="item_price">￥35</span><a class="item_add"
                                                                     href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-lg-3 new-collections-grid">
                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5"
                               class="product-image item"><img
                                    src="${pageContext.request.getContextPath()}/static/images/jc4.jpg" alt=" "
                                    class="img-responsive item-wrap"/></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">市场营销学</a></h4>
                        <p>教材类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p><span class="item_price">￥12</span><a class="item_add"
                                                                     href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-lg-3 new-collections-grid">
                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5"
                               class="product-image item"><img
                                    src="${pageContext.request.getContextPath()}/static/images/ks1.jpg" alt=" "
                                    class="img-responsive item-wrap"/></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">CIA</a></h4>
                        <p>考试类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p><span class="item_price">￥50</span><a class="item_add"
                                                                     href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-6 col-lg-3 new-collections-grid">
                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5"
                               class="product-image item"><img
                                    src="${pageContext.request.getContextPath()}/static/images/ks2.jpg" alt=" "
                                    class="img-responsive item"/></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">初级会计实务</a>
                        </h4>
                        <p>考试类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p><span class="item_price">￥10</span><a class="item_add"
                                                                     href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a>
                            </p>
                        </div>
                    </div>

                </div>
                <div class="col-xs-12 col-sm-6 col-lg-3 new-collections-grid">
                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5"
                               class="product-image item"><img
                                    src="${pageContext.request.getContextPath()}/static/images/yswx1.jpg" alt=" "
                                    class="img-responsive item-wrap"/></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">白洋淀纪事</a></h4>
                        <p>艺术文学类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p><span class="item_price">￥22</span><a class="item_add"
                                                                     href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a>
                            </p>
                        </div>
                    </div>

                </div>

                <div class="col-xs-12 col-sm-6 col-lg-3 new-collections-grid">
                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5"
                               class="product-image item"><img
                                    src="${pageContext.request.getContextPath()}/static/images/yswx2.jpg" alt=" "
                                    class="img-responsive item-wrap"/></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <h4>
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">传统文学艺术赏析</a>
                        </h4>
                        <p>艺术文学类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p><span class="item_price">￥15</span><a class="item_add"
                                                                     href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="clearfix"></div>
            </div>
        </div>


        <div class="new-collections-grids">
            <h2 class="animated wow zoomIn" data-wow-delay=".5s">
                <em>日用百货</em>
                <a class="header-grid-right" href="${pageContext.request.contextPath}/views/sports">更多 >></a>
            </h2>
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-lg-3 new-collections-grid">
                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5"
                               class="product-image item"><img
                                    src="${pageContext.request.getContextPath()}/static/images/sh17.jpg" alt=" "
                                    class="img-responsive item-wrap"/></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">肥皂盒</a></h4>
                        <p>生活类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p><span class="item_price">￥3</span><a class="item_add"
                                                                    href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-6 col-lg-3 new-collections-grid">
                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5"
                               class="product-image item"><img
                                    src="${pageContext.request.getContextPath()}/static/images/sh12.jpg" alt=" "
                                    class="img-responsive item-wrap"/></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">台灯</a></h4>
                        <p>生活类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p><span class="item_price">￥35</span><a class="item_add"
                                                                     href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-6 col-lg-3 new-collections-grid">

                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5"
                               class="product-image item"><img
                                    src="${pageContext.request.getContextPath()}/static/images/sh2.jpg" alt=" "
                                    class="img-responsive item-wrap"/></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">电风扇</a></h4>
                        <p>生活类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p></i> <span class="item_price">￥35</span><a class="item_add"
                                                                          href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a>
                            </p>
                        </div>
                    </div>

                </div>

                <div class="col-xs-12 col-sm-6 col-lg-3 new-collections-grid">
                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5"
                               class="product-image item"><img
                                    src="${pageContext.request.getContextPath()}/static/images/sh9.jpg" alt=" "
                                    class="img-responsive item-wrap"/></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">脸盆</a></h4>
                        <p>生活类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p><span class="item_price">￥10</span><a class="item_add"
                                                                     href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-lg-3 new-collections-grid">
                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5"
                               class="product-image item"><img
                                    src="${pageContext.request.getContextPath()}/static/images/sh9.jpg" alt=" "
                                    class="img-responsive item-wrap"/></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">脸盆</a></h4>
                        <p>生活类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p><span class="item_price">￥10</span><a class="item_add"
                                                                     href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="clearfix"></div>
            </div>
        </div>

        <div class="new-collections-grids">
            <h2 class="animated wow zoomIn" data-wow-delay=".5s">
                <em>娱乐</em>
                <a class="header-grid-right" href="${pageContext.request.contextPath}/views/sports">更多 >></a>
            </h2>
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-lg-3 new-collections-grid">
                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5"
                               class="product-image item"><img
                                    src="${pageContext.request.getContextPath()}/static/images/yd2.jpg" alt=" "
                                    class="img-responsive item-wrap"/></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">乒乓</a></h4>
                        <p>运动类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p><span class="item_price">￥50</span><a class="item_add"
                                                                     href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-6 col-lg-3 new-collections-grid">
                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5"
                               class="product-image item"><img
                                    src="${pageContext.request.getContextPath()}/static/images/yd13.jpg" alt=" "
                                    class="img-responsive item-wrap"/></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">瑜伽垫</a></h4>
                        <p>运动类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p><span class="item_price">￥30</span><a class="item_add"
                                                                     href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a>
                            </p>
                        </div>
                    </div>

                </div>

                <div class="col-xs-12 col-sm-6 col-lg-3 new-collections-grid">
                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5"
                               class="product-image item"><img
                                    src="${pageContext.request.getContextPath()}/static/images/mz15.jpg" alt=" "
                                    class="img-responsive item-wrap"/></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">口红</a></h4>
                        <p>美妆类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p><span class="item_price">￥100</span><a class="item_add"
                                                                      href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a>
                            </p>
                        </div>
                    </div>

                </div>

                <div class="col-xs-12 col-sm-6 col-lg-3 new-collections-grid">
                    <div class="new-collections-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5"
                               class="product-image item"><img
                                    src="${pageContext.request.getContextPath()}/static/images/mz19.jpg" alt=" "
                                    class="img-responsive item-wrap"/></a>
                            <div class="new-collections-grid1-image-pos">
                                <a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" "
                                             class="img-responsive"/>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.getContextPath()}/views/single?goodsId=5">纪梵希</a></h4>
                        <p>美妆类</p>
                        <div class="new-collections-grid1-left simpleCart_shelfItem">
                            <p><span class="item_price">￥200</span><a class="item_add"
                                                                      href="${pageContext.request.getContextPath()}/views/single?goodsId=5">立即查看 </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
<!-- overviewProduct -->


<!-- collections-bottom -->
<div class="collections-bottom">
    <div class="container">
        <div class="collections-bottom-grids">
            <div class="collections-bottom-grid animated wow slideInLeft" data-wow-delay=".5s">
                <h3>45% Offer For <span>Women & Children's</span></h3>
            </div>
        </div>
        <div class="newsletter animated wow slideInUp" data-wow-delay=".5s">
            <h3>Newsletter</h3>
            <p>Join us now to get all news and special offers.</p>
            <form>
                <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                <input type="email" value="Enter your email address" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Enter your email address';}" required="">
                <input type="submit" value="Join Us" >
            </form>
        </div>
    </div>
</div>
<!-- //collections-bottom -->
<!-- footer -->
<%@ include file="/WEB-INF/views/components/footer.jsp"%>
<!-- //footer -->
<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.slim.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/popper.js/2.10.2/umd/popper.min.js"></script>
<script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
</body>
</html>