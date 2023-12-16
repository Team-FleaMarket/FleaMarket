<%--
  Created by IntelliJ IDEA.
  User: YF
  Date: 2023/12/12
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!----------------------- Main Container -------------------------->
<div class="goodsdetail container d-flex justify-content-center align-items-center">
    <!----------------------- Login Container -------------------------->
    <div class="row box-area">
        <!--------------------------- Left Box ----------------------------->
        <div class="col-md-6 rounded-4 d-flex justify-content-center align-items-center flex-column left-box" style="background: #9c9fa5;">
            <div class="featured-image mb-3">
                <%--                                    <img src="images/R.jpg" class="img-fluid" style="width: 250px;">--%>
            </div>
            <p class="text-white fs-2" style="font-family: 'Courier New', Courier, monospace; font-weight: 600;">Be Verified</p>
            <small class="text-white text-wrap text-center" style="width: 17rem;font-family: 'Courier New', Courier, monospace;">Join experienced Designers on this platform.</small>
        </div>
        <!-------------------- ------ Right Box ---------------------------->
        <div class="col-md-6 right-box">
            <div class="row align-items-center">
                <div class="header-text mb-4">
                    <h2 class="goodsName"></h2>
                    <p class="goodsDegree"></p>
                </div>
                <textarea class="form-control goodsDescription" id="exampleFormControlTextarea1" rows="3" disabled>
                </textarea>
                <div class="input-group mb-3">
                    <button class="want-btn btn btn-md btn-warning w-100 mt-2 fs-6">添加到想要</button>
                </div>
            </div>
        </div>
    </div>
</div>