<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 2018/5/23
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Electronic products</title>
    <%@ include file="../components/jspheader.jsp"%>
</head>

<%--<body>
<%@ include file="/WEB-INF/views/components/header.jsp" %>
<!-- breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
            <li><a href="${pageContext.request.contextPath}/views/index"><span class="glyphicon glyphicon-home"
                                                                               aria-hidden="true"></span>主页</a></li>
            <li class="active">商品分类</li>
            <li class="active">电子产品</li>
        </ol>
    </div>
</div>
<div class="products">
    <div class="container">
        <div class="col-md-4 products-left">
            <div class="filter-price animated wow slideInUp" data-wow-delay=".5s">
                <h3>点击量</h3>
                <ul class="dropdown-menu1">
                    <li><a href="">
                        <div id="slider-range"></div>
                        <input type="text" id="amount" style="border: 0"/>
                    </a></li>
                </ul>
                <script type='text/javascript'>//<![CDATA[
                $(window).load(function () {
                    $("#slider-range").slider({
                        range: true,
                        min: 0,
                        max: 100000,
                        values: [20000, 80000],
                        slide: function (event, ui) {
                            $("#amount").val("" + ui.values[0] + " - " + ui.values[1]);
                        }
                    });
                    $("#amount").val("" + $("#slider-range").slider("values", 0) + " - " + $("#slider-range").slider("values", 1));


                });//]]>
                </script>
                <!---->
            </div>

            <div class="categories animated wow slideInUp" data-wow-delay=".5s">
                <h3>商品分类</h3>
                <ul class="cate">
                    <li><a href="${pageContext.request.contextPath}/views/books">图书书籍</a>
                        <span>(${bookList.size()+33})</span></li>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/views/books">教材</a> <span></span></li>
                        <li><a href="${pageContext.request.contextPath}/views/tests">考试</a> <span></span></li>
                        <li><a href="${pageContext.request.contextPath}/views/literature">文学</a> <span></span></li>
                    </ul>
                    <li><a href="${pageContext.request.contextPath}/views/products">日用百货</a>
                        <span>(${storeList.size()+36})</span></li>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/views/sports">运动类</a> <span></span></li>
                        <li><a href="${pageContext.request.contextPath}/views/stationery">文具类</a> <span></span></li>
                        <li><a href="${pageContext.request.contextPath}/views/life">生活类</a> <span></span></li>
                    </ul>
                    <li><a href="${pageContext.request.contextPath}/views/life">娱乐</a>
                        <span>${amazeList.size()+24}</span></li>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/views/beautymakeup">美妆</a> <span></span></li>
                        <li><a href="${pageContext.request.contextPath}/views/electronicproducts">电子产品</a>
                            <span></span></li>
                    </ul>
                </ul>
            </div>

            <div class="new-products animated wow slideInUp" data-wow-delay=".5s">
                <h3>最受欢迎</h3>
                <div class="new-products-grids">
                    <div class="new-products-grid">
                        <div class="new-products-grid-left">
                            <a href="${pageContext.request.contextPath}/views/single?goodsId=5"><img
                                    src="${pageContext.request.contextPath}/static/images/dz13.jpg" alt=" "
                                    class="img-responsive"/></a>
                        </div>
                        <div class="new-products-grid-right">
                            <h4><a href="${pageContext.request.contextPath}/views/single?goodsId=5">游戏鼠标</a></h4>
                            <div class="rating">
                                <div class="rating-left">
                                    <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                         class="img-responsive">
                                </div>
                                <div class="rating-left">
                                    <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                         class="img-responsive">
                                </div>
                                <div class="rating-left">
                                    <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                         class="img-responsive">
                                </div>
                                <div class="rating-left">
                                    <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" "
                                         class="img-responsive">
                                </div>
                                <div class="rating-left">
                                    <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" "
                                         class="img-responsive">
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="simpleCart_shelfItem new-products-grid-right-add-cart">
                                <p><span class="item_price">￥45</span><a class="item_add" href="#">立即查看 </a></p>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="new-products-grid">
                        <div class="new-products-grid-left">
                            <a href="${pageContext.request.contextPath}/views/single?goodsId=5"><img
                                    src="${pageContext.request.contextPath}/static/images/dz15.jpg" alt=" "
                                    class="img-responsive"/></a>
                        </div>
                        <div class="new-products-grid-right">
                            <h4><a href="${pageContext.request.contextPath}/views/single?goodsId=5">佳能 单反</a></h4>
                            <div class="rating">
                                <div class="rating-left">
                                    <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                         class="img-responsive">
                                </div>
                                <div class="rating-left">
                                    <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                         class="img-responsive">
                                </div>
                                <div class="rating-left">
                                    <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                         class="img-responsive">
                                </div>
                                <div class="rating-left">
                                    <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" "
                                         class="img-responsive">
                                </div>
                                <div class="rating-left">
                                    <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" "
                                         class="img-responsive">
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="simpleCart_shelfItem new-products-grid-right-add-cart">
                                <p><span class="item_price">￥3599</span><a class="item_add" href="#">立即查看 </a></p>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="new-products-grid">
                        <div class="new-products-grid-left">
                            <a href="${pageContext.request.contextPath}/views/single?goodsId=5"><img
                                    src="${pageContext.request.contextPath}/static/images/dz16.jpg" alt=" "
                                    class="img-responsive"/></a>
                        </div>
                        <div class="new-products-grid-right">
                            <h4><a href="${pageContext.request.contextPath}/views/single?goodsId=5">机械硬盘</a></h4>
                            <div class="rating">
                                <div class="rating-left">
                                    <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                         class="img-responsive">
                                </div>
                                <div class="rating-left">
                                    <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                         class="img-responsive">
                                </div>
                                <div class="rating-left">
                                    <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                         class="img-responsive">
                                </div>
                                <div class="rating-left">
                                    <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" "
                                         class="img-responsive">
                                </div>
                                <div class="rating-left">
                                    <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" "
                                         class="img-responsive">
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="simpleCart_shelfItem new-products-grid-right-add-cart">
                                <p><span class="item_price">￥290</span><a class="item_add" href="#">立即查看 </a></p>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <!--
                    <div class="new-products-grid">
                        <div class="new-products-grid-left">
                            <a href="${pageContext.request.contextPath}/views/single?goodsId=5"><img src="${pageContext.request.contextPath}/static/images/6.jpg" alt=" " class="img-responsive" /></a>
                        </div>
                        <div class="new-products-grid-right">
                            <h4><a href="${pageContext.request.contextPath}/views/single?goodsId=5">occaecat cupidatat</a></h4>
                            <div class="rating">
                                <div class="rating-left">
                                    <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" " class="img-responsive">
                                </div>
                                <div class="rating-left">
                                    <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" " class="img-responsive">
                                </div>
                                <div class="rating-left">
                                    <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" " class="img-responsive">
                                </div>
                                <div class="rating-left">
                                    <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" " class="img-responsive">
                                </div>
                                <div class="rating-left">
                                    <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" " class="img-responsive">
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                            <div class="simpleCart_shelfItem new-products-grid-right-add-cart">
                                <p> <span class="item_price">$180</span><a class="item_add" href="#">立即查看 </a></p>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>-->
                </div>
            </div>

            <div class="men-position animated wow slideInUp" data-wow-delay=".5s">
                <a href="${pageContext.request.contextPath}/views/single?goodsId=5"><img
                        src="${pageContext.request.contextPath}/static/images/27.jpg" alt=" "
                        class="img-responsive"/></a>
                <div class="men-position-pos">
                    <h4>上海师范大学</h4>
                    <h5><span>  GoodsWill</span></h5>
                </div>
            </div>
        </div>

        <div class="col-md-8 products-right">
            <div class="products-right-grid">
                <div class="products-right-grids-position animated wow slideInRight" data-wow-delay=".5s">
                    <img src="${pageContext.request.contextPath}/static/images/ele.png" alt=" " class="img-responsive"/>
                    <div class="products-right-grids-position1">
                        <h4>电子产品</h4>
                        <p>GoodsWill:electronic products.</p>
                    </div>
                </div>
            </div>

            <div class="products-right-grids-bottom">
                <div class="col-md-4 products-right-grids-bottom-grid">
                    <c:forEach items="${amazeList}" var="goods">
                        <div class="new-collections-grid1 products-right-grid1 animated wow slideInUp"
                             data-wow-delay=".5s">
                            <div class="new-collections-grid1-image">
                                <a href="${pageContext.request.contextPath}/views/single?goodsId=${goods.id}"
                                   class="product-image"><img
                                        src="${pageContext.request.getContextPath()}/static/upload/file/${goods.imagePath}"
                                        alt=" " class="img-responsive"></a>
                                <div class="new-collections-grid1-image-pos products-right-grids-pos">
                                    <a href="${pageContext.request.contextPath}/views/single?goodsId=${goods.id}">Quick
                                        View</a>
                                </div>
                                <div class="new-collections-grid1-right products-right-grids-pos-right">
                                    <div class="rating">
                                        <div class="rating-left">
                                            <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                                 class="img-responsive">
                                        </div>
                                        <div class="rating-left">
                                            <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                                 class="img-responsive">
                                        </div>
                                        <div class="rating-left">
                                            <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                                 class="img-responsive">
                                        </div>
                                        <div class="rating-left">
                                            <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" "
                                                 class="img-responsive">
                                        </div>
                                        <div class="rating-left">
                                            <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" "
                                                 class="img-responsive">
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                            <h4>
                                <a href="${pageContext.request.contextPath}/views/single?goodsId=${goods.id}">${goods.goodsName}</a>
                            </h4>
                            <div class="simpleCart_shelfItem products-right-grid1-add-cart">
                                <p><i>￥999999</i> <span class="item_price">￥${goods.price}</span></p>
                            </div>
                        </div>
                    </c:forEach>

                    <div class="new-collections-grid1 products-right-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.contextPath}/views/single?goodsId=5"
                               class="product-image"><img src="${pageContext.request.contextPath}/static/images/dz7.jpg"
                                                          alt=" " class="img-responsive"></a>
                            <div class="new-collections-grid1-image-pos products-right-grids-pos">
                                <a href="${pageContext.request.contextPath}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right products-right-grids-pos-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.contextPath}/views/single?goodsId=5">移动电源 10000mh</a>
                        </h4>
                        <div class="simpleCart_shelfItem products-right-grid1-add-cart">
                            <p><i>￥60</i> <span class="item_price">￥35</span></p>
                        </div>
                    </div>

                    <div class="new-collections-grid1 products-right-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.contextPath}/views/single?goodsId=5"
                               class="product-image"><img src="${pageContext.request.contextPath}/static/images/dz8.jpg"
                                                          alt=" " class="img-responsive"></a>
                            <div class="new-collections-grid1-image-pos products-right-grids-pos">
                                <a href="${pageContext.request.contextPath}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right products-right-grids-pos-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.contextPath}/views/single?goodsId=5">蓝牙耳机</a></h4>
                        <div class="simpleCart_shelfItem products-right-grid1-add-cart">
                            <p><i>￥150</i> <span class="item_price">￥90</span></p>
                        </div>
                    </div>

                    <!--
                    <div class="new-collections-grid1 products-right-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.contextPath}/views/single?goodsId=5" class="product-image"><img src="${pageContext.request.contextPath}/static/images/.jpg" alt=" " class="img-responsive"></a>
                            <div class="new-collections-grid1-image-pos products-right-grids-pos">
                                <a href="${pageContext.request.contextPath}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right products-right-grids-pos-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" " class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" " class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" " class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" " class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" " class="img-responsive">
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.contextPath}/views/single?goodsId=5">Formal Shirt</a></h4>
                        <div class="simpleCart_shelfItem products-right-grid1-add-cart">
                            <p><i>$325</i> <span class="item_price">$250</span></p>
                        </div>
                    </div>

                    <div class="new-collections-grid1 products-right-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.contextPath}/views/single?goodsId=5" class="product-image"><img src="${pageContext.request.contextPath}/static/images/dz9.jpg" alt=" " class="img-responsive"></a>
                            <div class="new-collections-grid1-image-pos products-right-grids-pos">
                                <a href="${pageContext.request.contextPath}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right products-right-grids-pos-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" " class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" " class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" " class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" " class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" " class="img-responsive">
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.contextPath}/views/single?goodsId=5">Casual Shoes</a></h4>
                        <div class="simpleCart_shelfItem products-right-grid1-add-cart">
                            <p><i>$325</i> <span class="item_price">$250</span></p>
                        </div>
                    </div>-->
                </div>

                <div class="col-md-4 products-right-grids-bottom-grid">
                    <div class="new-collections-grid1 products-right-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.contextPath}/views/single?goodsId=5"
                               class="product-image"><img src="${pageContext.request.contextPath}/static/images/dz9.jpg"
                                                          alt=" " class="img-responsive"></a>
                            <div class="new-collections-grid1-image-pos products-right-grids-pos">
                                <a href="${pageContext.request.contextPath}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right products-right-grids-pos-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.contextPath}/views/single?goodsId=5">无线商务键盘</a></h4>
                        <div class="simpleCart_shelfItem products-right-grid1-add-cart">
                            <p><i>￥90</i> <span class="item_price">￥70</span></p>
                        </div>
                    </div>

                    <div class="new-collections-grid1 products-right-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.contextPath}/views/single?goodsId=5"
                               class="product-image"><img
                                    src="${pageContext.request.contextPath}/static/images/dz10.jpg" alt=" "
                                    class="img-responsive"></a>
                            <div class="new-collections-grid1-image-pos products-right-grids-pos">
                                <a href="${pageContext.request.contextPath}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right products-right-grids-pos-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.contextPath}/views/single?goodsId=5">机械键盘</a></h4>
                        <div class="simpleCart_shelfItem products-right-grid1-add-cart">
                            <p><i>￥110</i> <span class="item_price">￥80</span></p>
                        </div>
                    </div>

                    <div class="new-collections-grid1 products-right-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.contextPath}/views/single?goodsId=5"
                               class="product-image"><img
                                    src="${pageContext.request.contextPath}/static/images/dz13.jpg" alt=" "
                                    class="img-responsive"></a>
                            <div class="new-collections-grid1-image-pos products-right-grids-pos">
                                <a href="${pageContext.request.contextPath}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right products-right-grids-pos-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.contextPath}/views/single?goodsId=5">游戏鼠标</a></h4>
                        <div class="simpleCart_shelfItem products-right-grid1-add-cart">
                            <p><i>￥65</i> <span class="item_price">￥45</span></p>
                        </div>
                    </div>

                    <!--
                    <div class="new-collections-grid1 products-right-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.contextPath}/views/single?goodsId=5" class="product-image"><img src="${pageContext.request.contextPath}/static/images/7.jpg" alt=" " class="img-responsive"></a>
                            <div class="new-collections-grid1-image-pos products-right-grids-pos">
                                <a href="${pageContext.request.contextPath}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right products-right-grids-pos-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" " class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" " class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" " class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" " class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" " class="img-responsive">
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.contextPath}/views/single?goodsId=5">Formal Shirt</a></h4>
                        <div class="simpleCart_shelfItem products-right-grid1-add-cart">
                            <p><i>$280</i> <span class="item_price">$250</span></p>
                        </div>
                    </div>

                    <div class="new-collections-grid1 products-right-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.contextPath}/views/single?goodsId=5" class="product-image"><img src="${pageContext.request.contextPath}/static/images/22.jpg" alt=" " class="img-responsive"></a>
                            <div class="new-collections-grid1-image-pos products-right-grids-pos">
                                <a href="${pageContext.request.contextPath}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right products-right-grids-pos-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" " class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" " class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" " class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" " class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" " class="img-responsive">
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.contextPath}/views/single?goodsId=5">Casual Shoes</a></h4>
                        <div class="simpleCart_shelfItem products-right-grid1-add-cart">
                            <p><i>$500</i> <span class="item_price">$480</span></p>
                        </div>
                    </div>-->
                </div>

                <div class="col-md-4 products-right-grids-bottom-grid">
                    <div class="new-collections-grid1 products-right-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.contextPath}/views/single?goodsId=5"
                               class="product-image"><img
                                    src="${pageContext.request.contextPath}/static/images/dz14.jpg" alt=" "
                                    class="img-responsive"></a>
                            <div class="new-collections-grid1-image-pos products-right-grids-pos">
                                <a href="${pageContext.request.contextPath}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right products-right-grids-pos-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.contextPath}/views/single?goodsId=5">无线鼠标</a></h4>
                        <div class="simpleCart_shelfItem products-right-grid1-add-cart">
                            <p><i>￥40</i> <span class="item_price">￥30</span></p>
                        </div>
                    </div>

                    <div class="new-collections-grid1 products-right-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.contextPath}/views/single?goodsId=5"
                               class="product-image"><img
                                    src="${pageContext.request.contextPath}/static/images/dz15.jpg" alt=" "
                                    class="img-responsive"></a>
                            <div class="new-collections-grid1-image-pos products-right-grids-pos">
                                <a href="${pageContext.request.contextPath}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right products-right-grids-pos-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.contextPath}/views/single?goodsId=5">佳能 单反</a></h4>
                        <div class="simpleCart_shelfItem products-right-grid1-add-cart">
                            <p><i>￥3999</i> <span class="item_price">￥3599</span></p>
                        </div>
                    </div>

                    <div class="new-collections-grid1 products-right-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.contextPath}/views/single?goodsId=5"
                               class="product-image"><img
                                    src="${pageContext.request.contextPath}/static/images/dz16.jpg" alt=" "
                                    class="img-responsive"></a>
                            <div class="new-collections-grid1-image-pos products-right-grids-pos">
                                <a href="${pageContext.request.contextPath}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right products-right-grids-pos-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" "
                                             class="img-responsive">
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.contextPath}/views/single?goodsId=5">机械硬盘</a></h4>
                        <div class="simpleCart_shelfItem products-right-grid1-add-cart">
                            <p><i>￥350</i> <span class="item_price">￥290</span></p>
                        </div>
                    </div>

                    <!--
                    <div class="new-collections-grid1 products-right-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.contextPath}/views/single?goodsId=5" class="product-image"><img src="${pageContext.request.contextPath}/static/images/7.jpg" alt=" " class="img-responsive"></a>
                            <div class="new-collections-grid1-image-pos products-right-grids-pos">
                                <a href="${pageContext.request.contextPath}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right products-right-grids-pos-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" " class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" " class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" " class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" " class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" " class="img-responsive">
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.contextPath}/views/single?goodsId=5">Formal Shirt</a></h4>
                        <div class="simpleCart_shelfItem products-right-grid1-add-cart">
                            <p><i>$280</i> <span class="item_price">$250</span></p>
                        </div>
                    </div>

                    <div class="new-collections-grid1 products-right-grid1 animated wow slideInUp" data-wow-delay=".5s">
                        <div class="new-collections-grid1-image">
                            <a href="${pageContext.request.contextPath}/views/single?goodsId=5" class="product-image"><img src="${pageContext.request.contextPath}/static/images/22.jpg" alt=" " class="img-responsive"></a>
                            <div class="new-collections-grid1-image-pos products-right-grids-pos">
                                <a href="${pageContext.request.contextPath}/views/single?goodsId=5">Quick View</a>
                            </div>
                            <div class="new-collections-grid1-right products-right-grids-pos-right">
                                <div class="rating">
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" " class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" " class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/2.png" alt=" " class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" " class="img-responsive">
                                    </div>
                                    <div class="rating-left">
                                        <img src="${pageContext.request.contextPath}/static/images/1.png" alt=" " class="img-responsive">
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                        <h4><a href="${pageContext.request.contextPath}/views/single?goodsId=5">Casual Shoes</a></h4>
                        <div class="simpleCart_shelfItem products-right-grid1-add-cart">
                            <p><i>$500</i> <span class="item_price">$480</span></p>
                        </div>
                    </div>-->
                </div>

                <div class="clearfix"></div>
            </div>

            <!--
            <h2 class="animated wow zoomIn" data-wow-delay=".5s">
                <a class="header-grid-right" href="${pageContext.request.contextPath}/views/login.jsp">更多 > ></a>
            </h2>-->
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!-- //breadcrumbs -->
<!-- footer -->
<%@ include file="./components/footer.jsp" %>
<!-- //footer -->
</body>--%>
</html>
