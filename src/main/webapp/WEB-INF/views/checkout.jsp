<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 2018/5/23
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>
    <%@ include file="components/htmlhead.jsp"%>
</head>

<body>
<%@ include file="./components/header.jsp"%>
<!-- //header -->
<!-- breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
            <li><a href="index.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
            <li class="active">Checkout Page</li>
        </ol>
    </div>
</div>
<!-- //breadcrumbs -->
<!-- checkout -->
<div class="checkout">
    <div class="container">
        <h3 class="animated wow slideInLeft" data-wow-delay=".5s">Your shopping cart contains: <span>3 Products</span></h3>
        <div class="checkout-right animated wow slideInUp" data-wow-delay=".5s">
            <table class="timetable_sub">
                <thead>
                <tr>
                    <th>SL No.</th>
                    <th>Product</th>
                    <th>Quality</th>
                    <th>Product Name</th>
                    <th>Service Charges</th>
                    <th>Price</th>
                    <th>Remove</th>
                </tr>
                </thead>
                <tr class="rem1">
                    <td class="invert">1</td>
                    <td class="invert-image"><a href="single.html"><img src="images/22.jpg" alt=" " class="img-responsive" /></a></td>
                    <td class="invert">
                        <div class="quantity">
                            <div class="quantity-select">
                                <div class="entry value-minus">&nbsp;</div>
                                <div class="entry value"><span>1</span></div>
                                <div class="entry value-plus active">&nbsp;</div>
                            </div>
                        </div>
                    </td>
                    <td class="invert">Black Shoe</td>
                    <td class="invert">$5.00</td>
                    <td class="invert">$290.00</td>
                    <td class="invert">
                        <div class="rem">
                            <div class="close1"> </div>
                        </div>
                        <script>$(document).ready(function(c) {
                            $('.close1').on('click', function(c){
                                $('.rem1').fadeOut('slow', function(c){
                                    $('.rem1').remove();
                                });
                            });
                        });
                        </script>
                    </td>
                </tr>
                <tr class="rem2">
                    <td class="invert">2</td>
                    <td class="invert-image"><a href="single.html"><img src="images/30.jpg" alt=" " class="img-responsive" /></a></td>
                    <td class="invert">
                        <div class="quantity">
                            <div class="quantity-select">
                                <div class="entry value-minus">&nbsp;</div>
                                <div class="entry value"><span>1</span></div>
                                <div class="entry value-plus active">&nbsp;</div>
                            </div>
                        </div>
                    </td>
                    <td class="invert">Centre Table</td>
                    <td class="invert">$5.00</td>
                    <td class="invert">$250.00</td>
                    <td class="invert">
                        <div class="rem">
                            <div class="close2"> </div>
                        </div>
                        <script>$(document).ready(function(c) {
                            $('.close2').on('click', function(c){
                                $('.rem2').fadeOut('slow', function(c){
                                    $('.rem2').remove();
                                });
                            });
                        });
                        </script>
                    </td>
                </tr>
                <tr class="rem3">
                    <td class="invert">3</td>
                    <td class="invert-image"><a href="single.html"><img src="images/11.jpg" alt=" " class="img-responsive" /></a></td>
                    <td class="invert">
                        <div class="quantity">
                            <div class="quantity-select">
                                <div class="entry value-minus">&nbsp;</div>
                                <div class="entry value"><span>1</span></div>
                                <div class="entry value-plus active">&nbsp;</div>
                            </div>
                        </div>
                    </td>
                    <td class="invert">Stone Bangles</td>
                    <td class="invert">$5.00</td>
                    <td class="invert">$299.00</td>
                    <td class="invert">
                        <div class="rem">
                            <div class="close3"> </div>
                        </div>
                        <script>$(document).ready(function(c) {
                            $('.close3').on('click', function(c){
                                $('.rem3').fadeOut('slow', function(c){
                                    $('.rem3').remove();
                                });
                            });
                        });
                        </script>
                    </td>
                </tr>
                <!--quantity-->
                <script>
                    $('.value-plus').on('click', function(){
                        var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)+1;
                        divUpd.text(newVal);
                    });

                    $('.value-minus').on('click', function(){
                        var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10)-1;
                        if(newVal>=1) divUpd.text(newVal);
                    });
                </script>
                <!--quantity-->
            </table>
        </div>
        <div class="checkout-left">
            <div class="checkout-left-basket animated wow slideInLeft" data-wow-delay=".5s">
                <h4>Continue to basket</h4>
                <ul>
                    <li>Product1 <i>-</i> <span>$250.00 </span></li>
                    <li>Product2 <i>-</i> <span>$290.00 </span></li>
                    <li>Product3 <i>-</i> <span>$299.00 </span></li>
                    <li>Total Service Charges <i>-</i> <span>$15.00</span></li>
                    <li>Total <i>-</i> <span>$854.00</span></li>
                </ul>
            </div>
            <div class="checkout-right-basket animated wow slideInRight" data-wow-delay=".5s">
                <a href="single.html"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>Continue Shopping</a>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!-- //checkout -->
<!-- footer -->
<%@ include file="./components/footer.jsp"%>
<!-- //footer -->
</body>
</html>
