<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 2018/5/21
  Time: 14:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/tld/MyTag.tld" prefix="mytag" %>

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

<div class="manager">
    <div class="container">
        <div class="">
            <div class="container">
                <div class="footer-grids">
                    <!--banner-bottom-grid-left-->
                    <div class="row">
                        <div class="col-md-3 information " data-wow-delay=".5s">
                            <form>
                                <div class="self_information">
                                    <c:if test="${sessionScope.student.img!=0}">
                                        <img src="${pageContext.request.contextPath}/static/images/avatar/${sessionScope.student.studentNo}.jpg"
                                             alt=" " class="avatar rounded-circle mx-auto d-block">
                                    </c:if>
                                    <c:if test="${sessionScope.student.img==0}">
                                        <%--                                        <button type="button" class="avatar-button border-0 rounded-circle" > <img src="/static/images/avatar/nwpu.jpg" class="avatar rounded-circle mx-auto d-block" /></button>--%>
                                        <img src="${pageContext.request.contextPath}/static/images/avatar/nwpu.jpg"
                                             alt=" " class="avatar rounded-circle mx-auto d-block">
                                        <div class="avatar overlay rounded-circle">
                                            <input type="file" accept="image/*" id="imageInput" style="display: none;">
                                            <button class="avatar-button rounded-3" onclick="uploadImage()">上传图像
                                            </button>
                                            <script>
                                                function uploadImage() {
                                                    document.getElementById('imageInput').click();
                                                }

                                                document.getElementById('imageInput').addEventListener('change', function () {
                                                    var selectedFile = this.files[0];
                                                    if (selectedFile) {
                                                        var formData = new FormData();
                                                        formData.append('image', selectedFile);
                                                        console.log('Selected file:', selectedFile);
                                                    }
                                                });
                                            </script>
                                        </div>
                                    </c:if>
                                </div>
                                <br>
                                <h4>学号:${sessionScope.student.studentNo}</h4>
                                <br>
                                <h4>昵称:${sessionScope.student.name}</h4>
                                <h2></h2>
                                <br>
                                <h4>邮箱:${sessionScope.student.email}</h4><h4></h4>
                                <br>
                                <h4>微信号:${sessionScope.student.wechat}</h4><h4></h4>
                                <br>
                                <h4>手机号:${sessionScope.student.phone}</h4><h4></h4>
                            </form>
                        </div>
                        <div class="col-md-9 " data-wow-delay=".6s">
                            <div class="goods">
                                <div class="">
                                    <div class="status">
                                        <a href="${pageContext.request.getContextPath()}/views/managecenter?status=0">待审核</a>
                                        |
                                        <a href="${pageContext.request.getContextPath()}/views/managecenter?status=1">待出售</a>
                                        |
                                        <a href="${pageContext.request.getContextPath()}/views/managecenter?status=2">已出售</a>
                                        |
                                        <a href="${pageContext.request.getContextPath()}/views/managecenter?status=3">我的购买</a>
                                        |
                                        <a href="views/mange/insert">添加商品</a> <span></span>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="col-md-4 status-single">
                                            <c:if test="${status == 0}"><h4>待审核: ${totalCnt} 件商品</h4></c:if>
                                            <c:if test="${status == 1}"><h4>待出售: ${totalCnt} 件商品</h4></c:if>
                                            <c:if test="${status == 2}"><h4>已出售: ${totalCnt} 件商品</h4></c:if>
                                            <c:if test="${status == 3}"><h4>我的购买: ${totalCnt} 件商品</h4></c:if>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="search-container">
                                                <input type="text" id="searchInput" placeholder="搜索商品">
                                                <button class="search-button rounded-5" onclick="search()">搜索</button>
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                    <%--                                    <c:if test="${status == 0}">--%>
                                    <div class="student-goods  ">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="student-goods-image">
                                                    <img src="${pageContext.request.getContextPath()}/static/images/dz11.jpg"
                                                         alt=" " class="img-rounded" width="125px" height="125px"/>
                                                </div>
                                                <br>
                                                <h4><a class="item_add"
                                                       href="${pageContext.request.getContextPath()}/views/single?goodsId=1">>>更多</a>
                                                </h4>
                                            </div>
                                            <div class="col-md-9">
                                                <h3>于2023年5月3299购入的电脑</h3>
                                                <p>电子产品</p>
                                                <h3 class="money ">￥ 2899</h3>
                                                <h4 class="date">2023年12月</h4>
                                                <button type="button" class="btn btn-outline-dark pull-right">删除
                                                </button>
                                                <button type="button" class="btn btn-outline-dark pull-right"
                                                        onclick="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">
                                                    编辑
                                                </button>
                                                <button type="button" class="btn btn-outline-dark pull-right">降价
                                                </button>
                                            </div>
                                        </div>
                                    </div>

                                    <c:forEach items="${goodsList}" var="goods" varStatus="vs">
                                        <div class="student-goods  ">
                                            <div class="row">
                                                <div class="col-md-md-3">
                                                    <div class="student-goods-image">
                                                        <img src="${pageContext.request.getContextPath()}/static/upload/file/${goods.imagePath}.jpg"
                                                             alt=" " class="img-rounded" width="125px"
                                                             height="125px"/>
                                                    </div>
                                                    <br>
                                                    <h4><a class="item_add"
                                                           href="${pageContext.request.getContextPath()}/views/single?goodsId=${goods.id}">>>更多</a>
                                                    </h4>
                                                </div>
                                                <div class="col-md-md-9">
                                                    <h3>${goods.goodsName}</h3>
                                                    <mytag:cate category="${goods.cate}"/>
                                                    <h3 class="money ">${goods.price}</h3>
                                                    <h4 class="date">${goods.description}</h4>
                                                    <button type="button" class="btn btn-outline-dark pull-right"
                                                            data-bs-toggle="modal" data-bs-target="#deleteModal"
                                                            data-bs-whatever="${goods.id}">
                                                        删除
                                                    </button>
                                                    <button type="button" class="btn btn-outline-dark pull-right"
                                                            data-bs-toggle="modal" data-bs-target="#editModal"
                                                            data-bs-whatever="${goods.id}"
                                                            name="${goods.goodsName}"
                                                            description="${goods.description}" price="${goods.price}"
                                                            degree="${goods.degree}" cate="${goods.cate}">
                                                        编辑
                                                    </button>
                                                    <button type="button" class="btn btn-outline-dark pull-right">
                                                        降价
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <mytag:pagination status="${status}" currentPage="${currentPage}"
                                                      totalPage="${totalPage}"/>
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
                               id="goodsName">
                    </div>
                    <div class="mb-3">
                        <label for="price"
                               class="col-form-label">商品价格:</label>
                        <input type="text" class="form-control"
                               id="price">
                    </div>
                    <div class="mb-3">
                        <label for="description"
                               class="col-form-label">商品描述:</label>
                        <textarea class="form-control"
                                  id="description"></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="degree"
                               class="col-form-label">新旧程度:</label>
                        <select class="form-control"
                                id="degree">
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
                        <select class="form-select" id="cate">
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
                <%--                                                        <button type="button" class="btn btn-primary">删除--%>
                <%--                                                        </button>--%>
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
                    确认购买</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>请确认是否购买该商品。</p>
            </div>
            <div class="modal-footer">
                <a href="" class="btn btn-primary">购买</a>
                <button type="button" class="btn btn-secondary"
                        data-bs-dismiss="modal">取消
                </button>
            </div>
        </div>
    </div>
</div>

<%-- 卖家取消交易/买家取消订单模态框 --%>
<div class="modal fade" id="cancelModal" tabindex="-1"
     aria-labelledby="cancelModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="cancelModalLabel">
                    取消交易</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>请确认是否取消交易。</p>
            </div>
            <div class="modal-footer">
                <a href="" class="btn btn-primary">取消交易</a>
                <button type="button" class="btn btn-secondary"
                        data-bs-dismiss="modal">关闭
                </button>
            </div>
        </div>
    </div>
</div>

<%-- 卖家删除订单模态框 --%>
<div class="modal fade" id="sellerDeleteModal" tabindex="-1"
     aria-labelledby="sellerDeleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="sellerDeleteModalLabel">
                    删除订单</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>请确认是否删除该订单。</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">删除</button>
                <button type="button" class="btn btn-secondary"
                        data-bs-dismiss="modal">取消
                </button>
            </div>
        </div>
    </div>
</div>

<%-- 买家删除订单模态框 --%>
<div class="modal fade" id="buyerDeleteModal" tabindex="-1"
     aria-labelledby="buyerDeleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="buyerDeleteModalLabel">
                    确认删除</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>请确认是否删除该订单。</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">删除</button>
                <button type="button" class="btn btn-secondary"
                        data-bs-dismiss="modal">取消
                </button>
            </div>
        </div>
    </div>
</div>
<div id="alert-box"></div>
<!-- //banner-bottom -->
<%--<div class="alert alert-primary position-fixed"--%>
<%--     role="alert">--%>
<%--    A simple primary alert—check it out!--%>
<%--</div>--%>
<!-- footer -->
<%@ include file="../components/footer.jsp" %>
<!-- //footer -->
<script src="${pageContext.request.contextPath}/static/js/managecenter.js"></script>
</body>
</html>