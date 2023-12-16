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
    <link href="${pageContext.request.getContextPath()}/static/css/goods/goodsdetail.css" rel="stylesheet"
          type="text/css" media="all"/>
    <link href="${pageContext.request.getContextPath()}/static/css/goods/goodsview.css" rel="stylesheet" type="text/css"
          media="all"/>
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
                            <c:if test="${sessionScope.student == null}">
                                <button class="redirect-btn btn btn-warning">我想要...</button>
                            </c:if>>
                            <c:if test="${sessionScope.student != null}">
                                <button class="want-btn btn btn-warning">我想要...</button>
                            </c:if>>
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
                <a class="page-link" href="${pageContext.request.contextPath}/views/${cate}/${page - 1}"
                   aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <!-- 输出所有页数 -->
            <c:forEach var="pageNumber" begin="1" end="${pages}">
                <li class="page-item"><a class="page-link"
                                         href="${pageContext.request.contextPath}/views/${cate}/${pageNumber}">${pageNumber}</a>
                </li>
            </c:forEach>
            <!-- 判断是否禁用下一页 -->
            <li class="page-item<c:if test='${page == pages}'> disabled</c:if>">
                <a class="page-link" href="${pageContext.request.contextPath}/views/${cate}/${page + 1}"
                   aria-label="Next">
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
    <%-- 登录成功或失败消息提示 --%>
    <div class="position-fixed bottom-0 end-0 p-3 col-xl-2" style="z-index: 5;">
        <div id="liveToast" class="toast hide" data-bs-animation="false" role="alert" aria-live="assertive"
             aria-atomic="true">
            <div class="toast-header text-black" id="toast-header">
                <strong class="me-auto">消息提示</strong>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body" id="toast-body">
                消息内容...
            </div>
        </div>
    </div>
    <script type="module">
        import {getCartAPI, addGoodsToCartAPI, getGoodsAPI} from "/static/js/apis/goods.js"
        // 用 js 获取商品
        let goodsList;
        window.onload = async () => {
            const currentUrl = window.location.href;
            const segments = currentUrl.split('/'); // 将 URL 按照 '/' 分割成数组
            const cate = segments[segments.length - 2]; // 获取倒数第二个参数
            const page = segments[segments.length - 1]; // 获取最后一个参数
            const response = await getGoodsAPI(cate, page)
            goodsList = response.data
        }
        // 商品详情
        document.querySelectorAll(".card-img-top").forEach((img, index) => {
            img.addEventListener("click", (e) => {
                const goodsModal = document.getElementById('goods-modal')
                goodsModal.querySelector(".goodsName").innerText = goodsList[index].goodsName
                goodsModal.querySelector(".goodsDegree").innerText = goodsList[index].degree
                goodsModal.querySelector(".goodsDescription").innerText = goodsList[index].description
                const myModal = new bootstrap.Modal(goodsModal)
                myModal.show()
            })
        });
        // 从 cookie 中获取 studentName
        const cookiesArray = document.cookie.split(';');
        let studentNo;
        cookiesArray.forEach(cookie => {
            const parts = cookie.split('=');
            const name = parts[0].trim();
            const value = parts[1];
            if (name === 'studentNo') {
                studentNo = value;
            }
        });
        console.log("cookiesArray: " + cookiesArray)
        console.log("studentNo: " + studentNo)
        // 点击想要，添加到购物车，header 中显示的购物车商品数量
        document.querySelectorAll('.card .want-btn').forEach((wantBtn, index) => {
            wantBtn.addEventListener('click', async () => {
                const response = await addGoodsToCartAPI({goodsId: goodsList[index].id, studentNo: studentNo})
                console.log(typeof response.data)
                if (response.data === "ok") {
                    document.getElementById("toast-body").innerText = "商品已成功添加至想要列表！"
                    document.getElementById("toast-header").classList.remove("bg-danger")
                    document.getElementById("toast-header").classList.add("bg-success")
                } else {
                    document.getElementById("toast-body").innerText = "未知原因，添加失败！"
                    document.getElementById("toast-header").classList.remove("bg-success")
                    document.getElementById("toast-header").classList.add("bg-danger")
                }
                new bootstrap.Toast(document.querySelector('.toast')).show();

                // header 外面和伸缩边框里面的购物车都要更新
               /* document.querySelectorAll('.checkout-items').forEach((checkoutItems) => {
                    await addGoodsToCartAPI({goodsId, studentNo})
                });*/
            });
        })
        document.querySelectorAll(".redirect-btn").forEach((redirectBtn) => {
            redirectBtn.addEventListener("click", () => {
                const myModal = new bootstrap.Modal(document.getElementById('goods-modal'))
                window.location.href = window.location.origin + "/login";
            })
        });
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
