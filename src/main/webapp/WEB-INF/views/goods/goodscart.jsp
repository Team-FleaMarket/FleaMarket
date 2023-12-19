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
                <li class="breadcrumb-item">想要列表</li>
            </ol>
        </div>
    </div>
    <!-- // breadcrumbs -->
    <div class="container">
        <p class="text-center display-1 mt-4 mb-4" style="letter-spacing: 7px">我的想要列表</p>
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
                                    <button class="want-btn btn btn-primary">去下单！</button>
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
    <!-- modal -->
    <div class="modal fade" id="goods-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="max-width: 930px; padding: 20px">
            <div class="modal-content">
                <div class="modal-body" style="overflow: auto;max-height: 95vh; padding: 0px;">
                    <%@ include file="./goodscartdetail.jsp" %>
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
        // 用 js 获取商品和用户信息
        let goodsItemList;
        window.onload = async () => {
            const response = await getCartAPI()
            goodsItemList = response.data
            console.log("--------------------------------:" + JSON.stringify(goodsItemList))
        }

        // 商品详情
        document.querySelectorAll(".card-img-top").forEach((img, index) => {
            img.addEventListener("click", (e) => {
                const goodsModal = document.getElementById('goods-modal')
                console.log("index:", index);
                console.log("goodsItemList:", JSON.stringify(goodsItemList));
                console.log("goodsItemList[index]:", goodsItemList[index]);
                console.log("goodsItemList[index].goods:", goodsItemList[index].goods);

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
                if (goodsItemList[index].student.hasOwnProperty("phone")) {
                    goodsModal.querySelector(".sellerPhone").innerText = goodsItemList[index].student.phone
                }
                if (goodsItemList[index].student.hasOwnProperty("wechat")) {
                    goodsModal.querySelector(".sellerWechat").innerText = goodsItemList[index].student.wechat
                }
                if (goodsItemList[index].student.hasOwnProperty("email")) {
                    goodsModal.querySelector(".sellerEmail").innerText = goodsItemList[index].student.email
                }
                if (goodsItemList[index].student.hasOwnProperty("qq")) {
                    goodsModal.querySelector(".sellerQq").innerText = goodsItemList[index].student.qq
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
    </script>
    <!-- // modal -->
</section>
<!-- // goods -->
<!-- footer -->
<%@include file="../components/footer.jsp" %>
<!-- //footer -->
</body>
</html>
