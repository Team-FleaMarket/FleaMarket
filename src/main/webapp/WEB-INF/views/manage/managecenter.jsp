<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 2018/5/21
  Time: 14:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>管理中心</title>
    <%@ include file="../components/htmlhead.jsp" %>
    <script language="JavaScript">
        // $(document).ready(function() {
        //     //绑定下拉框change事件，当下来框改变时调用 SelectChange()方法
        //     $("#checkGoodsStatus").change(function() { SelectChange(); });
        // })

        function SelectChange(selectId) {
            //获取下拉框选中项的value属性值
            var selectValue = $("#" + selectId).val();

            var twoText = selectValue.split(".");
            var status = twoText[0];
            var goodsId = twoText[1];
            $.ajax({
                type: "post",
                contentType: "application/string",
                dataType: "json",
                async: false,
                url: "/goodswill/goods/changeGoodsStatus?status=" + status + "&goodsId=" + goodsId,
                success: function (data) {
                    datas = data;
                },
            });

        }
    </script>

    <!-- //animation-effect -->
</head>

<body>
<%@ include file="../components/header.jsp" %>
<div class="single">
    <div class="container">
        <div class="">
            <div class="container">
                <div class="footer-grids">
                    <!--banner-bottom-grid-left-->
                    <div class="information col-md-3 footer-grid animated wow slideInLeft" data-wow-delay=".5s">
                        <form>
                            <div class="self_information">
                                <img src="${pageContext.request.contextPath}/static/images/${sessionScope.student.studentNo}.jpg"
                                     alt=" " class="img_self img-circle center-block">
                            </div>
                            <br>
                            <h4>学号：${sessionScope.student.studentNo}</h4>
                            <br>
                            <h4>昵称：${sessionScope.student.name}</h4>
                            <h2></h2>
                            <br>
                            <h4>微信号：${sessionScope.student.wechat}</h4><h4></h4>
                            <br>
                            <h4>手机号：${sessionScope.student.phone}</h4><h4></h4>
                            <br>
                            <h4>邮箱：${sessionScope.student.email}</h4><h4></h4>
                        </form>
                    </div>
                    <div class="col-md-4 footer-grid animated wow slideInLeft" data-wow-delay=".6s">
                        <div class="goods">
                            <div class="container">
                                <div class="status">
                                    <a href="${pageContext.request.getContextPath()}/managecenter?status=0">待审核</a> |
                                    <a href="${pageContext.request.getContextPath()}/managecenter?status=1">待出售</a> |
                                    <a href="${pageContext.request.getContextPath()}/managecenter?status=2">已出售</a> |
                                    <a href="${pageContext.request.getContextPath()}/managecenter?status=3">我的购买</a>
                                    |
                                    <a href="insert">添加商品</a> <span></span>
                                </div>
                                <br>
                                <c:if test="${status == 0}"><h4>待审核: ${goodsList.size()} 件商品</h4></c:if>
                                <c:if test="${status == 1}"><h4>待出售: ${goodsList.size()} 件商品</h4></c:if>
                                <c:if test="${status == 2}"><h4>已出售: ${goodsList.size()} 件商品</h4></c:if>
                                <c:if test="${status == 3}"><h4>我的购买: ${goodsList.size()} 件商品</h4></c:if>
                                <br>
                                <c:if test="${status == 0}">
                                    <div class="user-goods  ">
                                        <div class="col-md-3">
                                            <div class="user-goods-image">
                                                <img src="${pageContext.request.getContextPath()}/static/images/dz11.jpg"
                                                     alt=" " class="img-rounded" width="125px" height="125px"/>
                                            </div>
                                            <br>
                                            <h4><a class="item_add"
                                                   href="${pageContext.request.getContextPath()}/views/single?goodsId=5">>>更多</a>
                                            </h4>
                                        </div>
                                        <div class="col-md-9">
                                            <h3>于2023年5月3299购入的电脑</h3>
                                            <p>电子产品</p>
                                            <br>
                                            <h3 class="money display-3">￥ 2899</h3>
                                            <br>
                                            <h4 class="date">2023年12月</h4>
                                            <button type="button " class="btn btn-outline-light pull-right  ">删除
                                            </button>
                                            <button type="button " class="btn btn-outline-light pull-right ">编辑
                                            </button>
                                            <button type="button " class="btn btn-outline-light pull-right  ">降价
                                            </button>

                                        </div>
                                    </div>
                                    <c:forEach items="${goodsList}" var="goods" varStatus="vs">
                                        <c:if test="${goods.status == 0}">
                                            <div class="user-goods  ">
                                                <div class="col-md-3">
                                                    <div class="user-goods-image">
                                                        <img src="${pageContext.request.getContextPath()}/static/upload/file/${goods.imagePath}.jpg"
                                                             alt=" " class="img-rounded" width="125px" height="125px"/>
                                                    </div>
                                                    <br>
                                                    <h4><a class="item_add"
                                                           href="${pageContext.request.getContextPath()}/views/single?goodsId=5">>>更多</a>
                                                    </h4>
                                                </div>
                                                <div class="col-md-9">
                                                    <h3>${goods.goodsName}</h3>
                                                    <p>${goods.goodsStatus}</p>
                                                    <br>
                                                    <h3 class="money display-3">${goods.price}</h3>
                                                    <br>
                                                    <h4 class="date">${goods.description}</h4>
                                                    <button type="button " class="btn btn-outline-light pull-right  ">
                                                        删除
                                                    </button>
                                                    <button type="button " class="btn btn-outline-light pull-right ">
                                                        编辑
                                                    </button>
                                                    <button type="button " class="btn btn-outline-light pull-right  ">
                                                        降价
                                                    </button>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${status == 1}">
                                    <div class="user-goods  ">
                                        <div class="col-md-3">
                                            <div class="user-goods-image">
                                                <img src="${pageContext.request.getContextPath()}/static/images/dz11.jpg"
                                                     alt=" " class="img-rounded" width="125px" height="125px"/>
                                            </div>
                                            <br>
                                            <h4><a class="item_add"
                                                   href="${pageContext.request.getContextPath()}/views/single?goodsId=5">>>更多</a>
                                            </h4>
                                        </div>
                                        <div class="col-md-9">
                                            <h3>于2023年5月3299购入的电脑</h3>
                                            <p>电子产品</p>
                                            <br>
                                            <h3 class="money display-3">￥ 2899</h3>
                                            <br>
                                            <h4 class="date">2023年12月</h4>
                                            <button type="button " class="btn btn-outline-light pull-right  ">删除
                                            </button>
                                            <button type="button " class="btn btn-outline-light pull-right ">编辑
                                            </button>
                                            <button type="button " class="btn btn-outline-light pull-right  ">降价
                                            </button>

                                        </div>
                                    </div>
                                    <c:forEach items="${goodsList}" var="goods" varStatus="vs">
                                        <c:if test="${goods.status == 1}">
                                            <div class="user-goods  ">
                                                <div class="col-md-3">
                                                    <div class="user-goods-image">
                                                        <img src="${pageContext.request.getContextPath()}/static/upload/file/${goods.imagePath}.jpg"
                                                             alt=" " class="img-rounded" width="125px" height="125px"/>
                                                    </div>
                                                    <br>
                                                    <h4><a class="item_add"
                                                           href="${pageContext.request.getContextPath()}/views/single?goodsId=5">>>更多</a>
                                                    </h4>
                                                </div>
                                                <div class="col-md-9">
                                                    <h3>${goods.goodsName}</h3>
                                                    <p>${goods.goodsStatus}</p>
                                                    <br>
                                                    <h3 class="money display-3">${goods.price}</h3>
                                                    <br>
                                                    <h4 class="date">${goods.description}</h4>
                                                    <button type="button " class="btn btn-outline-light pull-right  ">
                                                        删除
                                                    </button>
                                                    <button type="button " class="btn btn-outline-light pull-right ">
                                                        编辑
                                                    </button>
                                                    <button type="button " class="btn btn-outline-light pull-right  ">
                                                        降价
                                                    </button>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${status == 3}">
                                    <div class="user-goods  ">
                                        <div class="col-md-3">
                                            <div class="user-goods-image">
                                                <img src="${pageContext.request.getContextPath()}/static/images/2021301455.jpg"
                                                     alt=" " class="img-rounded" width="125px" height="125px"/>
                                            </div>
                                            <br>
                                            <h4><a class="item_add"
                                                   href="${pageContext.request.getContextPath()}/views/single?goodsId=5">>>更多</a>
                                            </h4>
                                        </div>
                                        <div class="col-md-9">
                                            <h3>于2023年5月3299购入的电脑</h3>
                                            <p>电子产品</p>
                                            <br>
                                            <h3 class="money display-3">￥ 2899</h3>
                                            <br>
                                            <h4 class="date">2023年12月</h4>

                                        </div>
                                    </div>
                                    <c:forEach items="${goodsList}" var="goods" varStatus="vs">
                                        <c:if test="${goods.status == 3}">
                                            <div class="user-goods  ">
                                                <div class="col-md-3">
                                                    <div class="user-goods-image">
                                                        <img src="${pageContext.request.getContextPath()}/static/upload/file/${goods.imagePath}.jpg"
                                                             alt=" " class="img-rounded" width="125px" height="125px"/>
                                                    </div>
                                                    <br>
                                                    <h4><a class="item_add"
                                                           href="${pageContext.request.getContextPath()}/views/single?goodsId=5">>>更多</a>
                                                    </h4>
                                                </div>
                                                <div class="col-md-9">
                                                    <h3>${goods.goodsName}</h3>
                                                    <p>${goods.goodsStatus}</p>
                                                    <br>
                                                    <h3 class="money display-3">${goods.price}</h3>
                                                    <br>
                                                    <h4 class="date">${goods.description}</h4>
                                                </div>
                                            </div>
                                        </c:if>


                                    </c:forEach>
                                </c:if>


                                <%--<tr class="rem1">--%>
                                <%--<td class="invert">1</td>--%>
                                <%--<td class="invert-image"><a href="single.html">深度学习</a></td>--%>
                                <%--<td class="invert">图书书籍</td>--%>
                                <%--<td class="invert">&yen168.00</td>--%>
                                <%--<td class="invert">已审核</td>--%>
                                <%--</tr>--%>
                                <%--<tr class="rem2">--%>
                                <%--<td class="invert">2</td>--%>
                                <%--<td class="invert-image"><a href="single.html">羽毛球拍</a></td>--%>
                                <%--<td class="invert">日用百货：运动类</td>--%>
                                <%--<td class="invert">&yen128.00</td>--%>
                                <%--<td class="invert">已审核</td>--%>
                                <%--</tr>--%>
                                <%--<tr class="rem3">--%>
                                <%--<td class="invert">3</td>--%>
                                <%--<td class="invert-image"><a href="single.html">小米头戴式耳机</a></td>--%>
                                <%--<td class="invert">娱乐：电子产品</td>--%>
                                <%--<td class="invert">&yen499.00</td>--%>
                                <%--<td class="invert">已审核 </td>--%>
                                <%--</tr>--%>
                                <%--<tr class="rem1">--%>
                                <%--<td class="invert">4</td>--%>
                                <%--<td class="invert-image"><a href="single.html">深度学习</a></td>--%>
                                <%--<td class="invert">图书书籍</td>--%>
                                <%--<td class="invert">&yen168.00</td>--%>
                                <%--<td class="invert">已审核</td>--%>
                                <%--</tr>--%>
                                <%--<tr class="rem1">--%>
                                <%--<td class="invert">5</td>--%>
                                <%--<td class="invert-image"><a href="single.html">深度学习</a></td>--%>
                                <%--<td class="invert">图书书籍</td>--%>
                                <%--<td class="invert">&yen168.00</td>--%>
                                <%--<td class="invert">已审核</td>--%>
                                <%--</tr>--%>
                                <%--<tr class="rem1">--%>
                                <%--<td class="invert">6</td>--%>
                                <%--<td class="invert-image"><a href="single.html">深度学习</a></td>--%>
                                <%--<td class="invert">图书书籍</td>--%>
                                <%--<td class="invert">&yen168.00</td>--%>
                                <%--<td class="invert">已审核</td>--%>
                                <%--</tr>--%>
                                <%--<tr class="rem1">--%>
                                <%--<td class="invert">7</td>--%>
                                <%--<td class="invert-image"><a href="single.html">深度学习</a></td>--%>
                                <%--<td class="invert">图书书籍</td>--%>
                                <%--<td class="invert">&yen168.00</td>--%>
                                <%--<td class="invert">已审核</td>--%>
                                <%--</tr>--%>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="clearfix"></div>
        </div>
    </div>
</div>

<div class="clearfix"></div>
</div>
</div>
<!-- -->


<!--&lt;!&ndash; banner-bottom &ndash;&gt;-->
<div class="banner-bottom">
    <div class="container">
        <h3 class="animated wow zoomIn" data-wow-delay=".5s">热门商品</h3>
        <div class="banner-bottom-grids">
            <div class="banner-bottom-grid-left animated wow slideInLeft" data-wow-delay=".5s">
                <div class="grid">
                    <figure class="effect-julia">
                        <img src="${pageContext.request.getContextPath()}/static/images/rmsp1.jpg" alt=" "
                             class="img-responsive"/>
                    </figure>
                    <div class="banner-bottom-grid-left-grid left1-grid grid-left-grid1">
                        <div class="banner-bottom-grid-left-grid1">
                            <img src="${pageContext.request.getContextPath()}/static/images/rmsp2.jpg" alt=" "
                                 class="img-responsive"/>
                        </div>
                        <div class="banner-bottom-grid-left1-position">
                            <div class="banner-bottom-grid-left1-pos1">
                                <p>Latest New Collections</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="banner-bottom-grid-left1 animated wow slideInUp" data-wow-delay=".5s">
                <div class="banner-bottom-grid-left-grid left1-grid grid-left-grid1">
                    <div class="banner-bottom-grid-left-grid1">
                        <img src="${pageContext.request.getContextPath()}/static/images/rmsp3.jpg" alt=" "
                             class="img-responsive"/>
                    </div>
                    <div class="banner-bottom-grid-left1-pos">
                        <p>Discount 45%</p>
                    </div>
                </div>
                <div class="banner-bottom-grid-left-grid left1-grid grid-left-grid1">
                    <div class="banner-bottom-grid-left-grid1">
                        <img src="${pageContext.request.getContextPath()}/static/images/rmsp4.jpg" alt=" "
                             class="img-responsive"/>
                    </div>
                    <div class="banner-bottom-grid-left1-position">
                        <div class="banner-bottom-grid-left1-pos1">
                            <p>Latest New Collections</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="banner-bottom-grid-right animated wow slideInRight" data-wow-delay=".5s">
                <div class="banner-bottom-grid-left-grid grid-left-grid1">
                    <div class="banner-bottom-grid-left-grid1">
                        <img src="${pageContext.request.getContextPath()}/static/images/rmsp5.jpg" alt=" "
                             class="img-responsive"/>
                        <!--<img src="images/3.jpg" alt=" " class="img-responsive" />-->
                    </div>
                    <div class="grid-left-grid1-pos">
                        <p>top and classic designs </p>
                    </div>
                </div>
                <div class="banner-bottom-grid-left-grid left1-grid grid-left-grid1">
                    <div class="banner-bottom-grid-left-grid1">
                        <img src="${pageContext.request.getContextPath()}/static/images/rmsp6.jpg" alt=" "
                             class="img-responsive"/>
                    </div>
                    <div class="banner-bottom-grid-left1-position">
                        <div class="banner-bottom-grid-left1-pos1">
                            <p>2016 Collection</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- //banner-bottom -->

<!-- footer -->
<%@ include file="../components/footer.jsp" %>

<!-- //footer -->
</body>
</html>