<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>添加商品的页面</title>
    <%@ include file="../components/htmlhead.jsp"%>
</head>
<body>
<div class="header">
    <div class="container">
        <div class="logo-nav">
            <div class="logo-nav-left animated wow zoomIn" data-wow-delay=".5s">
                <h1><a href="${pageContext.request.contextPath}/views/index">GoodsWill <span>Shop anywhere</span></a>
                </h1>
            </div>
            <div class="logo-nav-left1">
                <nav class="navbar navbar-default">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header nav_2">
                        <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse"
                                data-target="#bs-megadropdown-tabs">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="${pageContext.request.contextPath}/views/index"
                                                  class="act">主页</a></li>
                            <!-- Mega Menu -->
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">商品分类 <b
                                        class="caret"></b></a>
                                <ul class="dropdown-menu multi-column columns-3">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <ul class="multi-column-dropdown">
                                                <h6>图书书籍</h6>
                                                <li><a href="${pageContext.request.contextPath}/views/books">教材</a>
                                                </li>
                                                <li><a href="${pageContext.request.contextPath}/views/tests">考试</a>
                                                </li>
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/views/literature">艺术文学</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-4">
                                            <ul class="multi-column-dropdown">
                                                <h6>日用百货</h6>
                                                <li><a href="${pageContext.request.contextPath}/views/sports">运动类</a>
                                                </li>
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/views/stationery">文具类</a>
                                                </li>
                                                <li><a href="${pageContext.request.contextPath}/views/life">生活类</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-sm-4">
                                            <ul class="multi-column-dropdown">
                                                <h6>娱乐</h6>
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/views/beautymakeup">美妆</a>
                                                </li>
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/views/electronicproducts">电子产品</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </ul>
                            </li>
                            <li>
                                <c:if test="${sessionScope.user == null}">
                                    <a href="${pageContext.request.contextPath}/views/login">管理中心</a>
                                </c:if>
                                <c:if test="${sessionScope.user != null}">
                                    <a href="${pageContext.request.contextPath}/views/managecenter">管理中心</a>
                                </c:if>

                            </li>
                            <!--<li><a href="short-codes.html">个人中心</a></li>-->
                        </ul>
                    </div>
                </nav>
            </div>

            <div class="logo-nav-right">
                <div class="search-box">
                    <div id="sb-search" class="sb-search">
                        <form>
                            <input class="sb-search-input" placeholder="输入你想搜索的商品" type="search" id="search">
                            <input class="sb-search-submit" type="submit" value="">
                            <span class="sb-icon-search"> </span>
                        </form>
                    </div>
                </div>
                <!-- search-scripts -->
                <script src="${pageContext.request.getContextPath()}/static/js/classie.js"></script>
                <script src="${pageContext.request.getContextPath()}/static/js/uisearch.js"></script>
                <script>
                    new UISearch(document.getElementById('sb-search'));
                </script>
                <!-- //search-scripts -->
            </div>
            <div class="header-right">
                <div class="cart box_1">
                    <a href="${pageContext.request.getContextPath()}/user/logout">
                        <li>
                            <i class="glyphicon glyphicon-log-in" aria-hidden="true"></i>
                            <c:if test="${sessionScope.user == null}">
                                <a href="${pageContext.request.contextPath}/views/login">登陆</a>
                            </c:if>
                            <c:if test="${sessionScope.user != null}">
                                <a href="${pageContext.request.contextPath}/views/managecenter">${sessionScope.user.userName}</a>
                            </c:if>
                        </li>

                    </a>
                    <!--<p><a href="javascript:;" class="simpleCart_empty">Empty Cart</a></p>-->
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>

<div class="breadcrumbs">
    <div class="container">
        <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
            <li><a href="${pageContext.request.contextPath}/views/index"><span class="glyphicon glyphicon-home"
                                                                               aria-hidden="true"></span>主页</a></li>
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
            <form action="${pageContext.request.getContextPath()}/goods/insertGoods" class="" data-wow-delay=".5s"
                  method="post" enctype="multipart/form-data">
                <table border="0" align="center" style="border-collapse:separate; border-spacing:25px;">
                    <tr>
                        <td>商品名称</td>
                        <td><input align="center" type="text" name="goodsName" id="goodsName"></td>
                    </tr>
                    <tr>
                        <td>商品价格</td>
                        <td><input align="center" type="text" name="price" id="price"></td>
                    </tr>
                    <tr>
                        <td>商品概述</td>
                        <td><input align="center" type="text" name="description" id="description"></td>
                    </tr>
                    <tr>
                        <td>新旧程度</td>
                        <td><input align="center" type="text" name="degree" id="degree"></td>
                    </tr>
                    <tr>

                        <td>商品分类</td>
                        <td>
                            <select id="cate" name="cate" align="center">
                                <option value="1">教材</option>
                                <option value="2">考试</option>
                                <option value="3">文学</option>
                                <option value="4">运动类</option>
                                <option value="5">文具类</option>
                                <option value="6">生活类</option>
                                <option value="7">美妆</option>
                                <option value="8">电子产品</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">上传照片<input value="file" type="file" name="file" id="file"></td>
                    </tr>
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

<!-- footer -->
<%@ include file="../components/footer.jsp" %>
<!-- //footer -->
</body>
</html>
