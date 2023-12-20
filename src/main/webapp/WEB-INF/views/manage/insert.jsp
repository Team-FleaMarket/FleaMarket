<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>添加商品的页面</title>
    <%@ include file="../components/htmlhead.jsp" %>

</head>
<body>
<%@ include file="../components/header.jsp" %>

<div class="insert">
    <div class="container">
        <br>
        <h3 class="" data-wow-delay=".5s">在这里描述商品</h3>
        <p class="" data-wow-delay=".5s">Describe the details of the goods.</p>
        <div class="login-form-grids">
            <br>
            <h5 class="" data-wow-delay=".5s">商品信息</h5>
            <form action="${pageContext.request.getContextPath()}/goods/insertGoods" class="" data-wow-delay=".5s"
                  method="post" enctype="multipart/form-data">
                <table class="insert-table" style="border-collapse:separate; border-spacing:20px;">
                    <tr>
                        <td class="fw-bold">商品名称</td>
                        <td class="td-input"><input class="form-control" type="text" name="goodsName" id="goodsName"
                                                    required></td>
                    </tr>
                    <tr>
                        <td class="fw-bold">商品价格</td>
                        <td class="td-input"><input class="form-control" type="text" name="price" id="price" required>
                        </td>
                    </tr>
                    <tr>
                        <td class="fw-bold">商品概述</td>
                        <td class="td-input"><textarea class="form-control" type="text" name="description"
                                                       id="description" required></textarea></td>
                    </tr>
                    <tr>
                        <td class="fw-bold">新旧程度</td>
                        <td class="td-input"><select class="form-control" type="text" name="degree" id="degree"
                                                     required>
                            <option value="10">全新</option>
                            <option value="9.9">九九新</option>
                            <option value="9.5">九五新</option>
                            <option value="9">九成新</option>
                            <option value="8">八成新</option>
                            <option value="7">八成新以下</option>
                        </select>
                        </td>
                    </tr>
                    <tr>

                        <td class="fw-bold">商品分类</td>
                        <td class="td-input">
                            <select id="cate" name="cate" required>
                                <option value="1">教材</option>
                                <option value="2">考试</option>
                                <option value="3">文学</option>
                                <option value="4">运动类</option>
                                <option value="5">文具类</option>
                                <option value="6">生活类</option>
                                <option value="7">美妆</option>
                                <option value="8">电子产品</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><input class="form-control" type="file" accept="image/*" id="files[]"
                                               name="files[]" multiple></td>
                    </tr>

                </table>
                <td class="" colspan="2">
                    <input class=" btn btn-primary" type="submit" value="提  交">
                </td>
            </form>
        </div>
    </div>
</div>

<!-- footer -->
<%@ include file="../components/footer.jsp" %>
<!-- //footer -->
</body>
</html>