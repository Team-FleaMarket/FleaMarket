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

        <div class="col-md-6 rounded-4 d-flex justify-content-center align-items-center flex-column left-box" style="background: #9c9fa5;">
            <div id="carouselExampleIndicators" class="carousel slide">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="./static/images/carousel/NPU1.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="./static/images/carousel/NPU2.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="./static/images/carousel/NPU4.jpg" class="d-block w-100" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>

        <!-------------------- ------ Right Box ---------------------------->

        <div class="col-md-6 right-box">
            <div class="row align-items-center">
                <div class="header-text mb-4">
                    <h2>圣诞节佛奥搜集发哦</h2>
                    <span>发布时间：</span><span>2023-11-21</span>
                    <br>
                    <span>新旧程度：</span><span>99 新</span>
                </div>
                <textarea class="goodsDescription fs-5" id="exampleFormControlTextarea1" rows="10" style="width: 90%" disabled>
                    商品是为了出售而生产的劳动成果，
                    人类社会生产力发展到一定历史阶段的产物，
                    用于交换的劳动产品。恩格斯对此进行了科学的总结：
                    商品“首先是私人产品。但是，只有这些私人产品不是为自己消费，
                    而是为他人的消费，即为社会的消费而生产时，它们才成为商品
                </textarea>

                <div class="input-group mt-3">
                    <h2>￥</h2><h2 class="price" style="vertical-align: bottom;">1231</h2>
                    <button class="want-btn btn btn-md btn-warning w-100 mt-2 fs-6">添加到想要</button>
                </div>
            </div>
        </div>

    </div>
</div>