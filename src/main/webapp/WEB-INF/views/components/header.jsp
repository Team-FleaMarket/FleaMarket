<%--
  Created by IntelliJ IDEA.
  student: YF
  Date: 2023/12/6
  Time: 21:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="logo-nav-left animated wow zoomIn" data-wow-delay=".1s">
                    <h1><a href="${pageContext.request.getContextPath()}/">FleaMarket<span>welcome</span></a></h1>
                    <br>
                </div>
            </div>
            <div class="col-md-7 row">
                <div class="col-md-6  logo-nav-left1 navbar row">
                    <div class="col-md-5 logo-nav-left1">
                        <a href="${pageContext.request.contextPath}/" class="act">主页</a>
                    </div>
                    <div class="col-md-7 logo-nav-left1">
                        <a href="#" class="dropdown-bs-toggle" data-toggle="dropdown">商品分类 <b class="caret"></b></a>
                        <ul class="dropdown-menu columns-3">
                            <div  class=" row">
                                <div class="col-md-xl-4">
                                    <li class="dropdown-header">图书书籍</li>
                                    <li class="dropdown-item"><a href="${pageContext.request.contextPath}/views/books">教材</a></li>
                                    <li class="dropdown-item"><a href="${pageContext.request.contextPath}/views/tests">考试</a></li>
                                    <li class="dropdown-item"><a href="${pageContext.request.contextPath}/views/literature">艺术文学</a></li>
                                </div>
                                <div class="col-md-xl-4">
                                    <li class="dropdown-header">日用百货</li>
                                    <li class="dropdown-item"><a href="${pageContext.request.contextPath}/views/sports">运动类</a></li>
                                    <li class="dropdown-item"><a href="${pageContext.request.contextPath}/views/stationery">文具类</a></li>
                                    <li class="dropdown-item"><a href="${pageContext.request.contextPath}/views/life">生活类</a></li>
                                </div>
                                <div class="col-md-xl-4">
                                    <li class="dropdown-header">娱乐</li>
                                    <li class="dropdown-item"><a href="${pageContext.request.contextPath}/views/beautymakeup">美妆</a></li>
                                    <li class="dropdown-item"><a href="${pageContext.request.contextPath}/views/electronicproducts">电子产品</a></li>
                                </div>
                            </div>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6  logo-nav-left1 navbar row">
                    <div class="col-md-6 logo-nav-left1 ">
                        <c:if test="${sessionScope.student == null}">
                            <a  href="${pageContext.request.contextPath}/login">个人中心</a>
                        </c:if>
                        <c:if test="${sessionScope.student != null}">
                            <a href="${pageContext.request.contextPath}/views/managecenter">个人中心</a>
                        </c:if>
                    </div>
                    <div class="col-md-6 logo-nav-left1 ">
                        <c:if test="${sessionScope.student == null}">
                            <a  href="${pageContext.request.contextPath}/login">购物车</a>
                        </c:if>
                        <c:if test="${sessionScope.student != null}">
                            <a  href="${pageContext.request.contextPath}/checkout">购物车</a>
                        </c:if>
                    </div>
                </div>
                <%--                    <div class="col-md-4">--%>
                <%--                        <div id="sb-search" class="sb-search">--%>
                <%--                            <form>--%>
                <%--                                <input class="sb-search-input" placeholder="输入你想搜索的商品" type="search" id="search">--%>
                <%--                                <input class="sb-search-submit" type="submit" value="">--%>
                <%--                                <span class="sb-icon-search"> </span>--%>
                <%--                            </form>--%>
                <%--                        </div>--%>
                <%--                        <!-- search-scripts -->--%>
                <%--                        <script src="${pageContext.request.getContextPath()}/static/js/classie.js"></script>--%>
                <%--                        <script src="${pageContext.request.getContextPath()}/static/js/uisearch.js"></script>--%>
                <%--                        <script>--%>
                <%--                            new UISearch( document.getElementById( 'sb-search' ) );--%>
                <%--                        </script>--%>
                <%--                    </div>--%>
            </div>

            <div class="col-md-1">
                <div class="login-button">
                    <a href="${pageContext.request.contextPath}/checkout">
                        <i class="glyphicon glyphicon-log-in" aria-hidden="true"></i>
                        <c:if test="${sessionScope.student == null}">
                            <a href="${pageContext.request.contextPath}/login">登陆</a>
                        </c:if>
                        <c:if test="${sessionScope.student != null}">
                            <a href="${pageContext.request.contextPath}/views/modifyInfo">${sessionScope.student.name}</a>
                        </c:if>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
