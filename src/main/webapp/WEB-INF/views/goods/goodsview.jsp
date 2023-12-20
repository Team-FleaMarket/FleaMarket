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
                    <a href="${pageContext.request.contextPath}/">
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
        <p class="text-center display-3 mt-4 mb-4" style="letter-spacing: 10px">${category}</p>
        <hr>
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4 py-5">
            <c:forEach var="goodsItem" items="${goodsItemList}">

                <div class="col">
                    <div class="card">
                        <img src="${pageContext.request.contextPath}/static/upload/file/${goodsItem.goods.imagePath}" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h6 class="card-title">${goodsItem.goods.goodsName}</h6>
                            <p class="card-text">${goodsItem.goods.description}</p>
                        </div>
                        <div class="d-flex justify-content-between mb-3 px-3">
                            <div class="card-price d-flex justify-content-start">
                                <h5>￥</h5><h5>${goodsItem.goods.price}</h5>
                            </div>
                            <div class="card-button d-flex justify-content-end px-2">
                                <c:if test="${false eq goodsItem.inCart}">
                                    <button class="want-btn btn btn-warning">我想要...</button>
                                </c:if>
                                <c:if test="${true eq goodsItem.inCart}">
                                    <button class="want-btn btn btn-warning disabled " disabled>已添加！</button>
                                </c:if>
                            </div>
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
        <div class="modal-dialog" style="max-width: 930px; padding: 20px">
            <div class="modal-content">
                <div class="modal-body" style="overflow: auto;max-height: 95vh; padding: 0px;">
                    <%@ include file="./goodsdetail.jsp" %>
                </div>
            </div>
        </div>
        <%-- 登录成功或失败消息提示 --%>
        <div class="position-fixed bottom-0 end-0 p-3 col-xl-2" style="z-index: 5;">
            <div id="modal-toast" class="toast hide" data-bs-animation="false" role="alert" aria-live="assertive"
                 aria-atomic="true">
                <div class="toast-header text-black" id="modal-toast-header">
                    <strong class="me-auto">消息提示</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
                <div class="toast-body" id="modal-toast-body">
                    消息内容...
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
        import {addGoodsToCartAPI, getGoodsAPI} from "/static/js/apis/goods.js"
        // 用 js 获取商品和用户信息
        let goodsItemList;
        window.onload = async () => {
            const currentUrl = window.location.href;
            const segments = currentUrl.split('/'); // 将 URL 按照 '/' 分割成数组
            const cate = segments[segments.length - 2]; // 获取倒数第二个参数
            const page = segments[segments.length - 1]; // 获取最后一个参数
            const response = await getGoodsAPI(cate, page)
            goodsItemList = response.data
        }

        // 商品详情
        document.querySelectorAll(".card-img-top").forEach((img, index) => {
            img.addEventListener("click", (e) => {
                const goodsModal = document.getElementById('goods-modal')
                goodsModal.querySelector(".goodsImage").src = "${pageContext.request.contextPath}/static/upload/file/"+goodsItemList[index].goods.imagePath
                goodsModal.querySelector(".goodsName").innerText = goodsItemList[index].goods.goodsName
                goodsModal.querySelector(".goodsAddedTime").innerText = goodsItemList[index].goods.addedTime
                goodsModal.querySelector(".goodsDegree").innerText = goodsItemList[index].goods.degree
                goodsModal.querySelector(".goodsDescription").innerText = goodsItemList[index].goods.description
                goodsModal.querySelector(".goodsPrice").innerText = goodsItemList[index].goods.price
                goodsModal.querySelector(".goodsId").innerText = goodsItemList[index].goods.id
                goodsModal.querySelector(".sellerImage").src = goodsItemList[index].student.imagePath
                goodsModal.querySelector(".sellerName").innerText = goodsItemList[index].student.name
                goodsModal.querySelector(".sellerDescription").innerText = goodsItemList[index].student.description
                goodsModal.querySelector(".sellerDepartment").innerText = goodsItemList[index].student.department
                goodsModal.querySelector(".sellerPhone").innerText = goodsItemList[index].student.phone
                console.log(goodsItemList[index])
                console.log(goodsItemList)
                // seller 是否有微信
                if (goodsItemList[index].student.wechat === null || goodsItemList[index].student.wechat === "" || !goodsItemList[index].student.hasOwnProperty("wechat")) {
                   document.querySelector(".li-wechat").style.display = "none"
                } else {
                    document.querySelector(".li-wechat").style.display = "block"
                    goodsModal.querySelector(".sellerWechat").innerText = goodsItemList[index].student.wechat
                }
                // seller 是否有 QQ
                if (goodsItemList[index].student.qq === null || goodsItemList[index].student.qq === "" || !goodsItemList[index].student.hasOwnProperty("qq")) {
                    document.querySelector(".li-qq").style.display = "none"
                    console.log("noQQ")
                } else {
                    document.querySelector(".li-qq").style.display = "block"
                    goodsModal.querySelector(".sellerQq").innerText = goodsItemList[index].student.qq
                    console.log("haveQQ: " + goodsItemList[index].student.qq)
                }
                // seller 是否有邮箱
                if (goodsItemList[index].student.email === null || goodsItemList[index].student.email === "" || !goodsItemList[index].student.hasOwnProperty("email")) {
                    document.querySelector(".li-email").style.display = "none"
                } else {
                    document.querySelector(".li-email").style.display = "block"
                    goodsModal.querySelector(".sellerEmail").innerText = goodsItemList[index].student.email
                }
                // 找到对应的card
                const button = img.closest('.card').querySelector('.want-btn');
                if (button.disabled === true) {
                    goodsModal.querySelector(".want-btn").disabled = true;
                    goodsModal.querySelector(".want-btn").innerText = "已添加到想要！";
                } else {
                    goodsModal.querySelector(".want-btn").disabled = false;
                }

                if (goodsItemList[index].goods.status === 2) {
                    goodsModal.querySelector(".buy-btn").innerText = "已下单！";
                    goodsModal.querySelector(".buy-btn").disabled = true;
                } else if (goodsItemList[index].goods.status === 0){
                    goodsModal.querySelector(".buy-btn").disabled = false;
                }



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
                const response = await addGoodsToCartAPI(goodsItemList[index].goods.id)
                console.log(typeof response.data)
                if (response.data ==="ok") {
                    document.getElementById("toast-body").innerText = "添加想要列表成功！"
                    document.getElementById("toast-header").classList.remove("bg-danger")
                    document.getElementById("toast-header").classList.add("bg-warning")
                    document.querySelectorAll(".checkout-items").forEach((checkoutItems) => {
                        checkoutItems.innerText = parseInt(document.querySelector(".checkout-items").textContent) + 1
                    })
                    wantBtn.disabled = true
                    wantBtn.innerText = "已添加！"
                } else  {
                    document.getElementById("toast-body").innerText = "未知原因，添加失败！"
                    document.getElementById("toast-header").classList.remove("bg-warning")
                    document.getElementById("toast-header").classList.add("bg-danger")
                }
                new bootstrap.Toast(document.getElementById('liveToast')).show();

                // header 外面和伸缩边框里面的购物车都要更新
               /* document.querySelectorAll('.checkout-items').forEach((checkoutItems) => {
                    await addGoodsToCartAPI({goodsId, studentNo})
                });*/
            });
        })
    </script>
    <!-- // modal -->
</section>
<!-- // goods -->
<!-- footer -->
<%@include file="../components/footer.jsp" %>
<!-- //footer -->
</body>
</html>
