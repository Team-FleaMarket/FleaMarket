<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/tld/MyTag.tld" prefix="mytag" %>

<!DOCTYPE html>
<html>
<head>
    <title>管理中心</title>
    <%@ include file="../components/htmlhead.jsp" %>
    <link href="${pageContext.request.contextPath}/static/css/goods/goodsdetail.css" rel="stylesheet"
          type="text/css" media="all"/>
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
    <script src="${pageContext.request.contextPath}/static/js/managecenter.js" defer></script>

    <!-- //animation-effect -->
</head>

<body>
<%@ include file="../components/header.jsp" %>

<div class="manager min-vh-100 ">
    <div class="container">
        <!--banner-bottom-grid-left-->
        <div class="row">
            <div class="col-md-3 information " data-wow-delay=".5s">
                <form>
                    <div class="self_information">
                        <c:if test="${sessionScope.student.imagePath!=null}">
                            <img src="${sessionScope.student.imagePath}"
                                 alt=" " class="avatar rounded-circle mx-auto d-block">
                        </c:if>
                        <c:if test="${sessionScope.student.imagePath==null}">
                            <%--                                        <button type="button" class="avatar-button border-0 rounded-circle" > <img src="/static/images/avatar/nwpu.jpg" class="avatar rounded-circle mx-auto d-block" /></button>--%>
                            <img src="${pageContext.request.contextPath}/static/images/avatar/nwpu.jpg"
                                 alt=" " class="avatar rounded-circle mx-auto d-block">
                        </c:if>
                    </div>
                    <br>
                    <h5>学号:${sessionScope.student.studentNo}</h5>
                    <br>
                    <h5>昵称:${sessionScope.student.name}</h5>
                    <h2></h2>
                    <br>
                    <c:if test="${sessionScope.student.wechat!=null}">
                        <h5>微信:${sessionScope.student.wechat}</h5>
                        <h4></h4>
                        <br>
                    </c:if>
                    <c:if test="${sessionScope.student.phone!=null}">
                        <h5>手机号:${sessionScope.student.phone}</h5>
                        <h4></h4>
                        <br>
                    </c:if>
                    <c:if test="${sessionScope.student.qq!=null}">
                        <h5>QQ:${sessionScope.student.qq}</h5>
                        <h4></h4>
                        <br>
                    </c:if>
                    <c:if test="${sessionScope.student.email!=null}">
                        <h5>邮箱:<br>${sessionScope.student.email}</h5><h4></h4>
                        <h4></h4>
                        <br>
                    </c:if>
                    <%--                                <a href=" /managecenter/modifyInfo">修改信息</a>--%>
                </form>
            </div>
            <div class="col-md-9 " data-wow-delay=".6s">
                <div class="goods">
                    <div class="">
                        <div class="status">
                            <a href="${pageContext.request.contextPath}/views/managecenter?status=0">待审核</a>
                            |
                            <a href="${pageContext.request.contextPath}/views/managecenter?status=-1">审核未通过</a>
                            ||
                            <a href="${pageContext.request.contextPath}/views/managecenter?status=1">待出售</a>
                            |
                            <a href="${pageContext.request.contextPath}/views/managecenter?status=4">出售中</a>
                            |
                            <a href="${pageContext.request.contextPath}/views/managecenter?status=2">已出售</a>
                            ||
                            <a href="${pageContext.request.contextPath}/views/managecenter?status=3">我的订单</a>
                            |
                            <a href="${pageContext.request.contextPath}/views/insert">添加商品</a> <span></span>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-4 status-single">
                                <c:if test="${status == 0}"><h4>待审核: ${totalCnt} 件商品</h4></c:if>
                                <c:if test="${status == -1}"><h4>审核未通过: ${totalCnt} 件商品</h4></c:if>
                                <c:if test="${status == 1}"><h4>待出售: ${totalCnt} 件商品</h4></c:if>
                                <c:if test="${status == 4}"><h4>出售中: ${totalCnt} 件商品</h4></c:if>
                                <c:if test="${status == 2}"><h4>已出售: ${totalCnt} 件商品</h4></c:if>
                                <c:if test="${status == 3}"><h4>我的订单: ${totalCnt} 件商品</h4></c:if>
                            </div>
                            <div class="col-md-8">
                                <form action="${pageContext.request.contextPath}/views/managecenter"
                                      method="get">
                                    <c:if test="${searchText!=null}">
                                        <input type="text" id="searchInput" name="searchInput"
                                               placeholder="${searchText}">
                                    </c:if>
                                    <c:if test="${searchText==null}">
                                        <input type="text" id="searchInput" name="searchInput"
                                               placeholder="搜索商品">
                                    </c:if>
                                    <input type="hidden" name="status" value="${status}">
                                    <input class="search-button" type="submit" value="搜索">
                                </form>

                            </div>
                        </div>
                        <br>

                        <c:forEach items="${orderInformationPageResult.orderInformationList}"
                                   var="orderInformation" varStatus="vs">
                            <c:set var="goods" value="${orderInformation.goods}"/>
                            <c:set var="buyer" value="${orderInformation.buyer}"/>
                            <c:set var="seller" value="${orderInformation.seller}"/>
                            <div class="student-goods  ">
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="student-goods-image">
                                            <img src="${pageContext.request.contextPath}/static/upload/file/${orderInformation.goods.imagePath}"
                                                 alt=" " class="img-rounded" width="125px" height="125px"/>
                                        </div>
                                        <br>
                                            <%--                                                    <h4><a class="item_add" href="${pageContext.request.}/views/single?goodsId=${orderInformation.goods.id}">>>更多</a></h4>--%>
                                    </div>
                                    <div class="col-md-9">
                                        <h3>${orderInformation.goods.goodsName}</h3>
                                        <mytag:cate category="${orderInformation.goods.cate}"/>
                                        <h3 class="money ">￥ ${orderInformation.goods.price}</h3>
                                        <h4 class="date">${orderInformation.goods.degree}新</h4>
                                            <%--审核未通过--%>
                                        <c:if test="${status==-1}">
                                            <button type="button" class="btn btn-outline-dark pull-right"
                                                    data-bs-toggle="modal" data-bs-target="#deleteModal"
                                                    data-bs-whatever="${orderInformation.goods.id}">删除
                                            </button>
                                            <button type="button" class="btn btn-outline-dark pull-right"
                                                    data-bs-toggle="modal" data-bs-target="#editModal"
                                                    data-bs-whatever="${orderInformation.goods.id}"
                                                    name="${orderInformation.goods.goodsName}"
                                                    description="${orderInformation.goods.description}"
                                                    price="${orderInformation.goods.price}"
                                                    degree="${orderInformation.goods.degree}"
                                                    cate="${orderInformation.goods.cate}">编辑
                                            </button>
                                        </c:if>
                                            <%--待审核--%>
                                        <c:if test="${status == 0&&orderInformation.goods.status==0}">
                                            <button type="button" class="btn btn-outline-dark pull-right"
                                                    data-bs-toggle="modal" data-bs-target="#deleteModal"
                                                    data-bs-whatever="${orderInformation.goods.id}">下架
                                            </button>
                                            <button type="button" class="btn btn-outline-dark pull-right"
                                                    data-bs-toggle="modal" data-bs-target="#editModal"
                                                    data-bs-whatever="${orderInformation.goods.id}"
                                                    name="${orderInformation.goods.goodsName}"
                                                    description="${orderInformation.goods.description}"
                                                    price="${orderInformation.goods.price}"
                                                    degree="${orderInformation.goods.degree}"
                                                    cate="${orderInformation.goods.cate}">编辑
                                            </button>
                                        </c:if>
                                            <%--待出售--%>
                                        <c:if test="${status == 1&&orderInformation.goods.status==1}">
                                            <button type="button" class="btn btn-outline-dark pull-right"
                                                    data-bs-toggle="modal" data-bs-target="#deleteModal"
                                                    data-bs-whatever="${orderInformation.goods.id}">下架
                                            </button>
                                            <button type="button" class="btn btn-outline-dark pull-right"
                                                    data-bs-toggle="modal" data-bs-target="#editModal"
                                                    data-bs-whatever="${orderInformation.goods.id}"
                                                    name="${orderInformation.goods.goodsName}"
                                                    description="${orderInformation.goods.description}"
                                                    price="${orderInformation.goods.price}"
                                                    degree="${orderInformation.goods.degree}"
                                                    cate="${orderInformation.goods.cate}">
                                                编辑
                                            </button>
                                        </c:if>
                                            <%--出售中--%>
                                        <c:if test="${status == 4}">
                                            <c:set var="type" value="seller"/>
                                            <button type="button" class="btn btn-outline-dark pull-right"
                                                    data-bs-toggle="modal" data-bs-target="#cancelModal"
                                                    data-bs-whatever="${orderInformation.orderId}">拒绝交易
                                            </button>
                                            <c:if test="${orderInformation.sellerConfirm==0}">
                                                <button type="button"
                                                        class="btn btn-outline-dark pull-right"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#sellerConfirmModal"
                                                        data-bs-whatever="${orderInformation.orderId}">确认出售
                                                </button>
                                            </c:if>

                                            <button type="button" class="btn btn-outline-dark pull-right"
                                                    data-bs-toggle="modal" data-bs-target="#orderModal"
                                                    img-path="${pageContext.request.contextPath}/static/upload/file/${orderInformation.goods.imagePath}"
                                                    name="${orderInformation.goods.goodsName}"
                                                    description="${orderInformation.goods.description}"
                                                    price="${orderInformation.goods.price}"
                                                    degree="${orderInformation.goods.degree}"
                                                    cate="${orderInformation.goods.cate}"
                                                    user-information="${buyer.studentNo},${buyer.name},${buyer.wechat},${buyer.email},${buyer.phone},${buyer.imagePath},${buyer.qq}">
                                                查看订单
                                            </button>
                                        </c:if>
                                            <%--已出售--%>
                                        <c:if test="${status == 2}">
                                            <c:set var="type" value="seller"/>
                                            <button type="button" class="btn btn-outline-dark pull-right"
                                                    data-bs-toggle="modal" data-bs-target="#orderModal"
                                                    data-bs-whatever="${orderInformation.goods.id}"
                                                    img-path="${pageContext.request.contextPath}/static/upload/file/${orderInformation.goods.imagePath}"
                                                    name="${orderInformation.goods.goodsName}"
                                                    description="${orderInformation.goods.description}"
                                                    price="${orderInformation.goods.price}"
                                                    degree="${orderInformation.goods.degree}"
                                                    cate="${orderInformation.goods.cate}"
                                                    user-information="${buyer.studentNo},${buyer.name},${buyer.wechat},${buyer.email},${buyer.phone},${buyer.imagePath},${buyer.qq}">
                                                查看订单
                                            </button>
                                        </c:if>
                                            <%--我的订单--%>
                                        <c:if test="${status == 3}">
                                            <c:set var="type" value="buyer"/>
                                            <c:if test="${orderInformation.goods.goodsStatus==2}">
                                                <button type="button"
                                                        class="btn btn-outline-dark pull-right "
                                                        data-bs-toggle="modal" data-bs-target="#cancelModal"
                                                        data-bs-whatever="${orderInformation.orderId}">取消订单
                                                </button>
                                                <button type="button"
                                                        class="btn btn-outline-dark pull-right"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#buyerConfirmModal"
                                                        data-bs-whatever="${orderInformation.orderId}">
                                                    确认收货
                                                </button>
                                            </c:if>
                                            <button type="button" class="btn btn-outline-dark pull-right"
                                                    data-bs-toggle="modal" data-bs-target="#orderModal"
                                                    img-path="${pageContext.request.contextPath}/static/upload/file/${orderInformation.goods.imagePath}"
                                                    name="${orderInformation.goods.goodsName}"
                                                    description="${orderInformation.goods.description}"
                                                    price="${orderInformation.goods.price}"
                                                    degree="${orderInformation.goods.degree}"
                                                    cate="${orderInformation.goods.cate}"
                                                    user-information="${seller.studentNo},${seller.name},${seller.wechat},${seller.email},${seller.phone},${seller.imagePath},${seller.qq}">
                                                查看订单
                                            </button>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <mytag:pagination status="${status}" currentPage="${currentPage}"
                                          totalPage="${totalPage}" goodsName="${searchText}"/>

                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- //banner-bottom -->

<!-- footer -->
<%--编辑商品信息模态框--%>
<div class="modal fade" id="editModal" tabindex="-1"
     aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="editModalLabel">修改商品信息</h1>
                <button type="button" class="btn-close"
                        data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="mb-3">
                        <label for="goodsName"
                               class="col-form-label">商品名称:</label>
                        <input type="text" class="form-control"
                               id="goodsName" required>
                    </div>
                    <div class="mb-3">
                        <label for="price"
                               class="col-form-label">商品价格:</label>
                        <input type="text" class="form-control"
                               id="price" required>
                    </div>
                    <div class="mb-3">
                        <label for="description"
                               class="col-form-label">商品描述:</label>
                        <textarea class="form-control"
                                  id="description" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="degree"
                               class="col-form-label">新旧程度:</label>
                        <select class="form-control"
                                id="degree" required>
                            <option value="10">全新</option>
                            <option value="9.9">九九新</option>
                            <option value="9.5">九五新</option>
                            <option value="9">九成新</option>
                            <option value="8">八成新</option>
                            <option value="7">八成新以下</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="cate"
                               class="col-form-label">商品分类:</label>
                        <select class="form-select" id="cate" required>
                            <option value="1">教材</option>
                            <option value="2">考试</option>
                            <option value="3">文学</option>
                            <option value="4">运动类</option>
                            <option value="5">文具类</option>
                            <option value="6">生活类</option>
                            <option value="7">美妆</option>
                            <option value="8">电子产品</option>
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button id="editSubmitButton" type="button"
                        class="btn btn-primary">保存更改
                </button>
                <button type="button" class="btn btn-secondary"
                        data-bs-dismiss="modal">关闭
                </button>
            </div>
        </div>
    </div>
</div>
<%--编辑商品信息模态框end--%>

<%--下架模态框--%>
<div class="modal fade" id="deleteModal" tabindex="-1"
     aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="deleteModalLabel">
                    下架商品</h1>
                <button type="button" class="btn-close"
                        data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>请确认是否下架该商品。</p>
            </div>
            <div class="modal-footer">
                <a href="" class="btn btn-primary">下架</a>
                <button type="button" class="btn btn-secondary"
                        data-bs-dismiss="modal">取消
                </button>
            </div>
        </div>
    </div>
</div>
<%--下架模态框end--%>

<%--卖家确认出售模态框--%>
<div class="modal fade" id="sellerConfirmModal" tabindex="-1"
     aria-labelledby="sellerConfirmModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="sellerConfirmModalLabel">
                    确认出售</h1>
                <button type="button" class="btn-close"
                        data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>请确认是否出售该商品。</p>
            </div>
            <div class="modal-footer">
                <a href="" class="btn btn-primary">出售</a>
                <button type="button" class="btn btn-secondary"
                        data-bs-dismiss="modal">取消
                </button>
            </div>
        </div>
    </div>
</div>
<%--卖家确认模态框end--%>

<%-- 买家确认购买模态框 --%>
<div class="modal fade" id="buyerConfirmModal" tabindex="-1"
     aria-labelledby="buyerConfirmModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="buyerConfirmModalLabel">
                    确认收货</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>请确认是否收货。</p>
            </div>
            <div class="modal-footer">
                <a href="" class="btn btn-primary">确认收货</a>
                <button type="button" class="btn btn-secondary"
                        data-bs-dismiss="modal">取消
                </button>
            </div>
        </div>
    </div>
</div>

<%-- 卖家拒绝交易/买家取消订单模态框 --%>
<div class="modal fade" id="cancelModal" tabindex="-1"
     aria-labelledby="cancelModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="cancelModalLabel">
                    <c:if test="${type=='seller'}">
                        拒绝交易
                    </c:if>
                    <c:if test="${type=='buyer'}">
                        取消订单
                    </c:if></h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>
                    <c:if test="${type=='seller'}">
                        请确认是否拒绝交易。
                    </c:if>
                    <c:if test="${type=='buyer'}">
                        请确认是否取消订单。
                    </c:if>
                </p>
            </div>
            <div class="modal-footer">
                <a href="" class="btn btn-primary">
                    <c:if test="${type=='seller'}">
                        拒绝
                    </c:if>
                    <c:if test="${type=='buyer'}">
                        取消
                    </c:if>
                </a>
                <button type="button" class="btn btn-secondary"
                        data-bs-dismiss="modal">关闭
                </button>
            </div>
        </div>
    </div>
</div>

<%--查看订单信息模态框--%>
<div class="modal fade" id="orderModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="max-width: 930px; padding: 20px">
        <div class="modal-content">
            <div class="modal-body" style="overflow: auto;max-height: 95vh; padding: 0px;">
                <%@include file="orderDetail.jsp" %>
            </div>
        </div>
    </div>
</div>
<%--消息提示框--%>
<div id="alert-box"></div>
<!-- footer -->
<%@ include file="../components/footer.jsp" %>
<!-- //footer -->

<!-- //footer -->
</body>
</html>