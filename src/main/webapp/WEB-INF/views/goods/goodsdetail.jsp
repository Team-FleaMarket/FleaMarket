<%--
  Created by IntelliJ IDEA.
  User: YF
  Date: 2023/12/12
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!----------------------- Main Container -------------------------->

<div class="container d-flex justify-content-center align-items-center min-vh-100">
    <!----------------------- Login Container -------------------------->

    <div class="row border rounded-5 p-3 bg-white shadow box-area">
        <!--------------------------- Left Box ----------------------------->

        <div class="col-md-6  d-flex justify-content-center align-items-center flex-column left-box">
            <div class="frosted__glass">
                <img src="" class="goodsImage">
            </div>
        </div>

        <!-------------------- ------ Right Box ---------------------------->

        <div class="col-md-6 right-box">
            <div class="row align-items-center justify-content-center">
                <div class="tips">
                    <span class="goods-information-button">商品详情</span>
                    <span class="seller-information-button">卖家信息</span>
                </div>
                <!-- 商品详情 -->
                <div class="goods-information" style="display: block;">
                    <h3 class="goodsName"></h3>
                    <span>发布时间：</span><span class="goodsAddedTime"></span>
                    <br />
                    <span>新旧程度：</span><span class="goodsDegree"></span>
                    <div class="goods-description-information">
                            <textarea class="goodsDescription fs-6 mt-3" id="exampleFormControlTextarea1" rows="10"
                                      style="width: 100%" disabled>
                    </textarea>
                    </div>
                    <div class="end mt-3">
                        <span class="fs-3" style="color: #ee340f">￥</span><span class="goodsPrice fs-3"
                                                                                style="vertical-align: bottom"></span>

                        <div class="row button-row">
                            <div class="col-8">
                                <button class="want-btn btn btn-md btn-warning mt-2 fs-6" style="width: 100%;">
                                    添加到想要
                                </button>
                            </div>
                            <div class="col-4">
                                <button class="buy-btn btn btn-md btn-primary mt-2 fs-6" style="width: 100%;">
                                    下单!!!
                                </button>
                            </div>
                        </div>

                    </div>
                </div>
                <!-- 卖家信息 -->
                <div class="seller-information" style="display: none;">
                    <div class="seller-basic-information">
                        <img class="seller-img" src="./static/images/category/1.jpg" alt="">
                        <div class="seller-basic-description">
                            <h3 class="sellerName"></h3>
                            <textarea class="sellerStudentNo fs-6 mt-3" rows="2"
                                      style="width: 100%" disabled>
                        </textarea>
                        </div>
                    </div>

                    <div class="card" style="width: 18rem;">
                        <div class="card-header">
                            联系方式
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item sellerWechat">
                                <i class="fa fa-weixin" aria-hidden="true"></i>
                            </li>
                            <li class="list-group-item sellerQq">
                                <i class="fa fa-qq" aria-hidden="true"></i>

                            </li>
                            <li class="list-group-item sellerEmail">
                                <i class="fa fa-email" aria-hidden="true"></i>
                            </li>
                            <li class="list-group-item sellerPhone">
                                <i class="fa fa-phone" aria-hidden="true"></i>
                            </li>

                        </ul>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<script>
    const goodsInformationButton = document.querySelector(".goods-information-button")
    const sellerInformationButton = document.querySelector(".seller-information-button")
    const goodsInformation = document.querySelector(".goods-information")
    const sellerInformation = document.querySelector(".seller-information")

    goodsInformationButton.addEventListener("click", function () {
        sellerInformation.style.display = "none"
        goodsInformation.style.display = "block"
        sellerInformationButton.style.borderBottom = "none";
        goodsInformationButton.style.borderBottom = "4px solid rgb(249, 177, 122)";
        goodsInformationButton.style.color = "#000";
        sellerInformationButton.style.color = "rgb(100, 108, 154)";
    });

    sellerInformationButton.addEventListener("click", function () {
        goodsInformation.style.display = "none"
        sellerInformation.style.display = "block"
        goodsInformationButton.style.borderBottom = "none";
        sellerInformationButton.style.borderBottom = "4px solid rgb(249, 177, 122)";
        goodsInformationButton.style.color = "rgb(100, 108, 154)";
        sellerInformationButton.style.color = "#000";
    });
</script>