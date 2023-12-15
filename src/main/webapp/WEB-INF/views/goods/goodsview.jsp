<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Books</title>
    <%@ include file="../components/htmlhead.jsp" %>
    <link href="${pageContext.request.contextPath}/static/css/products.css" rel="stylesheet" type="text/css"
          media="all">
    <link href="${pageContext.request.contextPath}/static/css/collections.css" rel="stylesheet" type="text/css"
          media="all">
    <link href="${pageContext.request.getContextPath()}/static/css/goods/goodsdetail.css" rel="stylesheet" type="text/css" media="all" />
    <link href="${pageContext.request.getContextPath()}/static/css/goods/goodsview.css" rel="stylesheet" type="text/css" media="all" />
</head>

<body>
    <!-- header -->
    <%@ include file="../components/header.jsp" %>
    <!-- // header -->
    <!-- goods -->
    <section class="goods min-vh-100">
        <!-- breadcrumbs -->
        <div class="breadcrumbs">
            <div class="container-fluid">
                <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
                    <li class="breadcrumb-item">
                        <a href="${pageContext.request.contextPath}/views/index">
                            <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
                            主页
                        </a>
                    </li>
                    <li class="breadcrumb-item">商品分类</li>
                    <li class="breadcrumb-item">${mainCategory}</li>
                </ol>
            </div>
        </div>
        <!-- // breadcrumbs -->
        <div class="container">
            <%--<div class="categories row animated wow" data-wow-delay=".5s">
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
                        <h4>${navigation}</h4>
                        <p>${navigation}</p>
                        &lt;%&ndash;<h4>${sessionScope.category}</h4>
                        <p>GoodsWill:${sessionScope.parentCategory}.</p>&ndash;%&gt;
                    </div>
                </div>
            </div>--%>
            <h1 class="text-center "><strong>${category}</strong></h1>
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4 py-5">
                <c:forEach var="goods" items="${goodsList}">
                    <div class="col">
                        <div class="card">
                            <img src="${goods.imagePath}" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h6 class="card-title">${goods.goodsName}</h6>
                                <p class="card-text">${goods.description}</p>
                            </div>
                            <div class="d-flex justify-content-around mb-3">
                                <h5>${goods.price}</h5>
                                <button class="want-btn btn btn-warning">我想要...</button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                      <%--  <div class="item-categories">
                            <p>图书书籍</p>
                            <p>文学</p>
                        </div>
                    </div>--%>
                </div>
        </div>
        <!-- pagination -->
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <!-- 判断是否禁用上一页 -->
                <li class="page-item<c:if test='${page == 1}'> disabled</c:if>">
                    <a class="page-link" href="${pageContext.request.contextPath}/views/${cate}/${page - 1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <!-- 输出所有页数 -->
                <c:forEach var="pageNumber" begin="1" end="${pages}">
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/views/${cate}/${pageNumber}">${pageNumber}</a></li>
                </c:forEach>
                <!-- 判断是否禁用下一页 -->
                <li class="page-item<c:if test='${page == pages}'> disabled</c:if>">
                    <a class="page-link" href="${pageContext.request.contextPath}/views/${cate}/${page + 1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- // pagination -->
        <!-- modal -->
        <div class="modal fade" id="goods-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body">
                        <%--                 <img src="${pageContext.request.getContextPath()}/static/images/goods.jpg" class="modal-img" alt="goods">--%>
                        <%@include file="./goodsdetail.jsp" %>
                    </div>
                </div>
            </div>
        </div>
        <script>
            // 商品详情
            document.querySelectorAll(".card-img-top").forEach((img) => {
                img.addEventListener("click", (e) => {
                    const myModal = new bootstrap.Modal(document.getElementById('goods-modal'))
                    myModal.show()
                })
            });
            // 点击想要，添加到购物车，header 中显示的购物车商品数量

            document.querySelectorAll('.want-btn').forEach(button => {
                console.log("button: " + button)
                button.addEventListener('click', function() {
                    // 获取所有class为iii的span标签
                    console.log("--------------------------------")
                    // 为每个span标签的内容加1
                    document.querySelectorAll('.checkout-items').forEach((checkoutItems) => {
                        checkoutItems.innerText = parseInt(checkoutItems.innerText) + 1;
                    });
                });
            })
        </script>
        <!-- // modal -->
    </section>
    <!-- // goods -->
    <!-- Modal -->

    <!-- // Modal -->
    <!-- footer -->
    <%@include file="../components/footer.jsp" %>
    <!-- //footer -->
</body>
</html>
