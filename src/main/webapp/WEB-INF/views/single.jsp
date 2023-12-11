<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>商品详情</title>
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
<!-- //animation-effect -->
</head>
	
<body>
<%@ include file="/WEB-INF/views/components/header.jsp"%>
<!-- breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>主页</a></li>
				<li class="active">商品详情页面</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->
<!-- single -->
	<div class="single">
		<div class="container">
			<div class="col-md-4 products-left">
				<div class="filter-price animated wow slideInUp" data-wow-delay=".5s">
					<h3>点击量</h3>
					<ul class="dropdown-menu1">
							<li><a href="">								               
							<div id="slider-range"></div>							
							<input type="text" id="amount" style="border: 0" />
							</a></li>	
					</ul>
						<script type='text/javascript'>//<![CDATA[ 
						$(window).load(function(){
						 $( "#slider-range" ).slider({
								range: true,
								min: 0,
								max: 100000,
								values: [ 10000, 60000 ],
								slide: function( event, ui ) {  $( "#amount" ).val( "" + ui.values[ 0 ] + " - " + ui.values[ 1 ] );
								}
					 });
					$( "#amount" ).val( "" + $( "#slider-range" ).slider( "values", 0 ) + " - " + $( "#slider-range" ).slider( "values", 1 ) );


						});//]]>
						</script>
						<script type="text/javascript" src="${pageContext.request.getContextPath()}/static/js/jquery-ui.min.js"></script>
					 <!---->
				</div>

				<div class="categories animated wow slideInUp" data-wow-delay=".5s">
					<h3>商品分类</h3>
					<ul class="cate">
						<li><a href="${pageContext.request.contextPath}/views/products">图书书籍</a> <span>(${bookList.size()+33})</span></li>
						<ul>
							<li><a href="${pageContext.request.contextPath}/views/books">教材</a> <span></span></li>
							<li><a href="${pageContext.request.contextPath}/views/tests">考试</a> <span></span></li>
							<li><a href="${pageContext.request.contextPath}/views/literature">文学</a> <span></span></li>
						</ul>
						<li><a href="${pageContext.request.contextPath}/views/products">日用百货</a> <span>(${storeList.size()+36})</span></li>
						<ul>
							<li><a href="${pageContext.request.contextPath}/views/sports">运动类</a> <span></span></li>
							<li><a href="${pageContext.request.contextPath}/views/stationery">文具类</a> <span></span></li>
							<li><a href="${pageContext.request.contextPath}/views/life">生活类</a> <span></span></li>
						</ul>
						<li><a href="${pageContext.request.contextPath}/views/products">娱乐</a> <span>(${amazeList.size()+24})</span></li>
						<ul>
							<li><a href="${pageContext.request.contextPath}/views/beautymakeup">美妆</a> <span></span></li>
							<li><a href="${pageContext.request.contextPath}/views/electronicproducts">电子产品</a> <span></span></li>
						</ul>
					</ul>
				</div>

				<!--<div class="men-position animated wow slideInUp" data-wow-delay=".5s">-->
					<!--<a href="single.html"><img src="images/29.jpg" alt=" " class="img-responsive" /></a>-->
					<!--<div class="men-position-pos">-->
						<!--<h4>上海师范大学</h4>-->
						<!--<h5><span>GoodsWill</span> </h5>-->
					<!--</div>-->
				<!--</div>-->
			</div>
			<div class="col-md-8 single-right">
				<div class="col-md-5 single-right-left animated wow slideInUp" data-wow-delay=".5s">
					<div class="flexslider">
						<ul class="slides">
							<li data-thumb="${pageContext.request.getContextPath()}/static/upload/file/${goods.imagePath}">
								<div class="thumb-image"> <img src="${pageContext.request.getContextPath()}/static/upload/file/${goods.imagePath}" data-imagezoom="true" class="img-responsive"> </div>
							</li>
							<li data-thumb="${pageContext.request.getContextPath()}/static/upload/file/${goods.imagePath}">
								<div class="thumb-image"> <img src="${pageContext.request.getContextPath()}/static/upload/file/${goods.imagePath}" data-imagezoom="true" class="img-responsive"> </div>
							</li>
							<li data-thumb="${pageContext.request.getContextPath()}/static/upload/file/${goods.imagePath}">
								<div class="thumb-image"> <img src="${pageContext.request.getContextPath()}/static/upload/file/${goods.imagePath}" data-imagezoom="true" class="img-responsive"> </div>
							</li>
						</ul>
					</div>
					<!-- flixslider -->
					<script defer src="${pageContext.request.getContextPath()}/static/js/jquery.flexslider.js"></script>
					<link rel="stylesheet" href="${pageContext.request.getContextPath()}/static/css/flexslider.css" type="text/css" media="screen" />
					<script>
                        // Can also be used with $(document).ready()
                        $(window).load(function() {
                            $('.flexslider').flexslider({
                                animation: "slide",
                                controlNav: "thumbnails"
                            });
                        });
					</script>
					<!-- flixslider -->
				</div>
				<div class="col-md-7 single-right-left simpleCart_shelfItem animated wow slideInRight" data-wow-delay=".5s">
					<h3>${goods.goodsName}</h3>
					<h4><span class="item_price">&yen${goods.price}</span></h4>
					<div class="rating1">
						<span class="" >
							商品状态：<c:if test="${goods.goodsStatus == 0}">未出售</c:if>
							<c:if test="${goods.goodsStatus == 1}">已出售</c:if>
						</span>
					</div>
					<div class="description">
						<h5><i>详情</i></h5>
						<p>${goods.description}</p>
					</div>
					<div class="color-quality">
						<div class="color-quality-left">
							<h5>新旧程度 : ${goods.degree} </h5>
						</div>

						<div class="clearfix"> </div>
					</div>

					<div class="occasional">
						<h5>卖家联系方式1 手机号: ${user.phone}</h5>
						<div class="clearfix"> </div>
					</div>
					<div class="occasional2">
						<h5>卖家联系方式2 微信号: ${user.weixin}</h5>
						<div class="clearfix"> </div>
					</div>
					<%--<div class="occasion-cart">--%>
						<%--<a class="item_add" href="#">确认购买 </a>--%>
					<%--</div>--%>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //single -->
<!-- single-related-products -->
	<div class="single-related-products">
		<div class="container">
			<h3 class="animated wow slideInUp" data-wow-delay=".5s">相关商品</h3>
			<p class="est animated wow slideInUp" data-wow-delay=".5s">或许你会对这些商品感兴趣... ...</p>
			<div class="new-collections-grids">
				<div class="col-md-3 new-collections-grid">
					<div class="new-collections-grid1 animated wow slideInLeft" data-wow-delay=".5s">
						<div class="new-collections-grid1-image">
							<a href="single.html" class="product-image"><img src="${pageContext.request.getContextPath()}/static/images/8.jpg" alt=" " class="img-responsive"></a>
							<div class="new-collections-grid1-image-pos">
								<a href="single.html">Quick View</a>
							</div>
							<div class="new-collections-grid1-right">
								<div class="rating">
									<div class="rating-left">
										<img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive">
									</div>
									<div class="rating-left">
										<img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive">
									</div>
									<div class="rating-left">
										<img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive">
									</div>
									<div class="rating-left">
										<img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive">
									</div>
									<div class="rating-left">
										<img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive">
									</div>
									<div class="clearfix"> </div>
								</div>
							</div>
						</div>
						<h4><a href="single.html">Running Shoes</a></h4>
						<p>Vel illum qui dolorem eum fugiat.</p>
						<div class="new-collections-grid1-left simpleCart_shelfItem">
							<p> <span class="item_price">&yen150</span></p>
						</div>
					</div>
				</div>

				<div class="col-md-6 new-collections-grid">
					<div class="new-collections-grid1-sub">
						<div class="new-collections-grid1 animated wow slideInLeft" data-wow-delay=".6s">
							<div class="new-collections-grid1-image">
								<a href="single.html" class="product-image"><img src="${pageContext.request.getContextPath()}/static/images/6.jpg" alt=" " class="img-responsive"></a>
								<div class="new-collections-grid1-image-pos">
									<a href="single.html">Quick View</a>
								</div>
								<div class="new-collections-grid1-right">
									<div class="rating">
										<div class="rating-left">
											<img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive">
										</div>
										<div class="rating-left">
											<img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive">
										</div>
										<div class="rating-left">
											<img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive">
										</div>
										<div class="rating-left">
											<img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive">
										</div>
										<div class="rating-left">
											<img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive">
										</div>
										<div class="clearfix"> </div>
									</div>
								</div>
							</div>
							<h4><a href="single.html">Wall Lamp</a></h4>
							<p>Vel illum qui dolorem eum fugiat.</p>
							<div class="new-collections-grid1-left simpleCart_shelfItem">
								<p> <span class="item_price">&yen400</span></p>
							</div>
						</div>
					</div>
					<div class="new-collections-grid1-sub">
						<div class="new-collections-grid1 animated wow slideInLeft" data-wow-delay=".7s">
							<div class="new-collections-grid1-image">
								<a href="single.html" class="product-image"><img src="${pageContext.request.getContextPath()}/static/images/9.jpg" alt=" " class="img-responsive"></a>
								<div class="new-collections-grid1-image-pos">
									<a href="single.html">Quick View</a>
								</div>
								<div class="new-collections-grid1-right">
									<div class="rating">
										<div class="rating-left">
											<img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive">
										</div>
										<div class="rating-left">
											<img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive">
										</div>
										<div class="rating-left">
											<img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive">
										</div>
										<div class="rating-left">
											<img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive">
										</div>
										<div class="rating-left">
											<img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive">
										</div>
										<div class="clearfix"> </div>
									</div>
								</div>
							</div>
							<h4><a href="single.html">Wall Lamp</a></h4>
							<p>Vel illum qui dolorem eum fugiat.</p>
							<div class="new-collections-grid1-left simpleCart_shelfItem">
								<p><span class="item_price">&yen150</span></p>
							</div>
						</div>
					</div>
					<div class="clearfix"> </div>
				</div>

				<div class="col-md-3 new-collections-grid">
					<div class="new-collections-grid1 animated wow slideInLeft" data-wow-delay=".8s">
						<div class="new-collections-grid1-image">
							<a href="single.html" class="product-image"><img src="${pageContext.request.getContextPath()}/static/images/11.jpg" alt=" " class="img-responsive"></a>
							<div class="new-collections-grid1-image-pos">
								<a href="single.html">Quick View</a>
							</div>
							<div class="new-collections-grid1-right">
								<div class="rating">
									<div class="rating-left">
										<img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive">
									</div>
									<div class="rating-left">
										<img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive">
									</div>
									<div class="rating-left">
										<img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive">
									</div>
									<div class="rating-left">
										<img src="${pageContext.request.getContextPath()}/static/images/2.png" alt=" " class="img-responsive">
									</div>
									<div class="rating-left">
										<img src="${pageContext.request.getContextPath()}/static/images/1.png" alt=" " class="img-responsive">
									</div>
									<div class="clearfix"> </div>
								</div>
							</div>
						</div>
						<h4><a href="single.html">Stones Bangles</a></h4>
						<p>Vel illum qui dolorem eum fugiat.</p>
						<div class="new-collections-grid1-left simpleCart_shelfItem">
							<p><span class="item_price">&yen257</span></p>
						</div>
					</div>
				</div>

				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<!-- //single-related-products -->
<!-- footer -->
<%@ include file="components/footer.jsp"%>
<!-- //footer -->
<!-- zooming-effect -->
	<script src="${pageContext.request.getContextPath()}/static/js/imagezoom.js"></script>
<!-- //zooming-effect -->
</body>
</html>