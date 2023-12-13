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
    <style>
        img {
            width: 100%;
        }
        .goods {
            background-color: #f9f6f2;
            padding: 80px 0;
        }
        .goods .card {
            border-radius: 30px;
            box-shadow: rgba(0, 0, 0, 0.25) 0px 0.0625em 0.0625em, rgba(0, 0, 0, 0.25) 0px 0.125em 0.5em, rgba(255, 255, 255, 0.1) 0px 0px 0px 1px inset;
        }
        .goods .card .card-img-top {
            border-radius: 50px;
            padding: 25px;
            height: auto;
            aspect-ratio: 5 / 6; /* 设置宽高比为5:6 */
            object-fit: cover; /* 保持原始比例，填充整个容器 */
            cursor: pointer;
        }
        .goods .card .card-body {
            padding: 25px;
            margin-top: -15px;
        }
        .goods .card .btn {
            border-radius: 50px;
            width: 120px;
        }
        .goods .card .btn:hover{
            background-color: blanchedalmond;
            border: none;
        }
        .goods .card h3, h5 {
            color: #dd6161;
        }
        #goods-modal .modal-dialog {
            max-width: 80vw;
        }

    </style>
</head>

<body>
    <!-- header -->
    <%@ include file="../components/header.jsp" %>
    <!-- // header -->
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
                <li class="breadcrumb-item">${navigation}</li>
            </ol>
        </div>
    </div>
    <!-- // breadcrumbs -->
    <!-- goods -->
    <section class="goods min-vh-100">
        <div class="container py-5">
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
                        <h4>${navigation}</h4>
                        <p>${navigation}</p>
                        <%--<h4>${sessionScope.category}</h4>
                        <p>GoodsWill:${sessionScope.parentCategory}.</p>--%>
                    </div>
                </div>
            </div>
            <h1 class="text-center">${navigation}</h1>
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4 py-5">
                <div class="col">
                    <div class="card">
                        <img src="${pageContext.request.getContextPath()}/static/images/goods.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">时间简史</h5>
                            <p class="card-text">dfasfasdfsafgagadfgbrymndhjdfhdrturmfhk ,,hgk.ghikfyarnyanysrtvsbys5ybbrjdthsnrg</p>
                        </div>
                        <div class="d-flex justify-content-around mb-5">
                            <h3>19 元</h3>
                            <button class="btn btn-warning">我想要</button>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card">
                        <img src="${pageContext.request.getContextPath()}/static/images/goods.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">时间简史</h5>
                            <p class="card-text">dfasfasdfsafgagadfgbrymndhjdfhdrturmfhk ,,hgk.ghikfyarnyanysrtvsbys5ybbrjdthsnrg</p>
                        </div>
                        <div class="d-flex justify-content-around mb-5">
                            <h3>19 元</h3>
                            <button class="btn btn-warning">我想要</button>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card">
                        <img src="${pageContext.request.getContextPath()}/static/images/goods2.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">时间简史</h5>
                            <p class="card-text">dfasfasdfsafgagadfgbrymndhjdfhdrturmfhk</p>
                        </div>
                        <div class="d-flex justify-content-around mb-5">
                            <h3>19 元</h3>
                            <button class="btn btn-warning">我想要</button>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card">
                        <img src="${pageContext.request.getContextPath()}/static/images/2.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">时间简史</h5>
                            <p class="card-text">dfasfasdfsafgagadfgbrymndhjdfhdrturmfhk</p>
                        </div>
                        <div class="d-flex justify-content-around mb-5">
                            <h3>19 元</h3>
                            <button class="btn btn-warning">我想要</button>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card">
                        <img src="${pageContext.request.getContextPath()}/static/images/3.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">时间简史</h5>
                            <p class="card-text">dfasfasdfsafgagadfgbrymndhjdfhdrturmfhk</p>
                        </div>
                        <div class="d-flex justify-content-around mb-5">
                            <h3>19 元</h3>
                            <button class="btn btn-warning">我想要</button>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card">
                        <img src="${pageContext.request.getContextPath()}/static/images/4.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">时间简史</h5>
                            <p class="card-text">dfasfasdfsafgagadfgbrymndhjdfhdrturmfhk</p>
                        </div>
                        <div class="d-flex justify-content-around mb-5">
                            <h3>19 元</h3>
                            <button class="btn btn-warning">我想要</button>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card">
                        <img src="${pageContext.request.getContextPath()}/static/images/5.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">时间简史</h5>
                            <p class="card-text">dfasfasdfsafgagadfgbrymndhjdfhdrturmfhk</p>
                        </div>
                        <div class="d-flex justify-content-around mb-5">
                            <h3>19 元</h3>
                            <button class="btn btn-warning">我想要</button>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card">
                        <img src="${pageContext.request.getContextPath()}/static/images/6.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">时间简史</h5>
                            <p class="card-text">dfasfasdfsafgagadfgbrymndhjdfhdrturmfhk</p>
                        </div>
                        <div class="d-flex justify-content-around mb-5">
                            <h3>19 元</h3>
                            <button class="btn btn-warning">我想要</button>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <img src="${pageContext.request.getContextPath()}/static/images/goods.jpg" class="goods-item" alt="goods">
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
    </section>
    <!-- // goods -->
    <!-- Modal -->
    <div class="modal fade" id="goods-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-body">
<%--                 <img src="${pageContext.request.getContextPath()}/static/images/goods.jpg" class="modal-img" alt="goods">--%>
                    <%@include file="./goodsdetail.jsp" %>
                </div>
            </div>
        </div>
    </div>
    <script>
        document.querySelectorAll(".card").forEach((card) => {
            card.addEventListener("click", (e) => {
                const myModal = new bootstrap.Modal(document.getElementById('goods-modal'))
                myModal.show()
            })
        });
            /*function (e) {
            if (e.target.classList.contains("card")) {
                // const src = e.target.getAttribute("src")
                // document.querySelector(".modal-img").src = src
                const myModal = new bootstrap.Modal(document.getElementById('goods-modal'))
                myModal.show()
            }*/
    </script>
    <!-- // Modal -->
    <!-- footer -->
    <%@include file="../components/footer.jsp" %>
    <!-- //footer -->
</div>
</body>
</html>
