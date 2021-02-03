<%-- 
    Document   : paymentform
    Created on : Jan 30, 2021, 5:04:09 PM
    Author     : janic
--%>

<%@page import="bean.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%User user = (User)session.getAttribute("users");
double total = (Double)session.getAttribute("total");
    
int rentID = (Integer)session.getAttribute("rentID");
%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Darks: Dress & Suits Renting System</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
    
    <!-- CSS
	============================================ -->
   
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <!-- Icon Font CSS -->
    <link rel="stylesheet" href="assets/css/icons.min.css">
    <!-- Plugins CSS -->
    <link rel="stylesheet" href="assets/css/plugins.css">
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="assets/css/style.css">
    <!-- Modernizer JS -->
    <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
<div>
    <header class="header-area sticky-bar">
        <div class="main-header-wrap">
            <div class="container">
                <div class="row">
                    <div class="col-xl-2 col-lg-2">
                        <div class="logo pt-40">
                            <a href="userIndex.jsp">
                                <h1><b>Darks</b></h1>
                            </a>
                        </div>
                    </div>
                    <div class="col-xl-7 col-lg-7 ">
                        <div class="main-menu">
                            <nav>
                                <ul>
                                    <li class="angle-shape"><form name="Home" action="HomeServlet" method="POST">                                   
                                    <input type="hidden" name="userName" value="<%= user.getUserName() %>">
                                    <input type="hidden" name="option" value="userhome">
                                    <input type="submit" value="Home">
                                    </form></li>
                                    <li class="angle-shape">
                                    <form name="View" action="ViewProductsServlet" method="POST">
                                    <input type="hidden" name="action" value="userview">
                                    <input type="hidden" name="username" value="<%= user.getUserName() %>">
                                    <input type="submit" value="Products">
                                    </form></li>
                                    <li class="angle-shape">
                                    <form name="View" action="ViewPromotionsServlet" method="POST">
                                    <input type="hidden" name="action" value="userview">
                                    <input type="hidden" name="username" value="<%= user.getUserName() %>">
                                    <input type="submit" value="Promotion">
                                    </form></li>
                                    <li class="angle-shape">Pages
                                        <ul class="submenu">
                                            <li>
                                                <form name="View" action="transactionController" method="POST">
                                                    <input type="hidden" name="view" value="user">
                                                     <input type="hidden" name="userID" value=" <%=user.getId()%>">
                                                    <input type="submit" value="Transaction">
                                                </form>
                                            </li>
                                            <li>
                                                <form name="wish" action="WishlistController" method="POST">
                                                    <input type="hidden" name="output" value="VIEW">
                                                    <input type="submit" value="Wishlist">
                                                </form>
                                            </li>
                                            <li>
                                                <form name="rent" action="rentController" method="POST">
                                                    <input type="hidden" name="newUser" value="<%= user.getUserName() %>">
                                                    <input type="hidden" name="option" value="ViewRent">
                                                    <input type="hidden" name="action" value="0">
                                                    <input type="submit" value="Manage Rent">
                                                </form></li>
                                            <li>
                                                <form name="feedback" action="FeedbackController" method="POST">
                                                    <input type="hidden" name="action" value="CUSTOMER">
                                                    <input type="submit" value="Feedback">
                                                </form>
                                            </li>
                                            <li>
                                                <form name="profile" action="ProfileServlet" method="POST">
                                                    <input type="hidden" name="id" value="<%= user.getId()%>">
                                                    <input type="hidden" name="action" value="display">
                                                    <input type="submit" value="My Profile">
                                                </form>
                                            </li>
                                            <li>
                                                <form name="logout" action="LogoutServlet" method="POST">
                                                    <input type="hidden" name="action" value="logout">
                                                    <input type="submit" value="Logout">
                                                </form>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                    
                </div>
            </div>
            <!-- main-search start -->
            <div class="main-search-active">
                <div class="sidebar-search-icon">
                    <button class="search-close"><span class="sli sli-close"></span></button>
                </div>
                <div class="sidebar-search-input">
                    <form>
                        <div class="form-search">
                            <input id="search" class="input-text" value="" placeholder="Search Now" type="search">
                            <button>
                                <i class="sli sli-magnifier"></i>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </header>
    
    
    <!-- Content start here -->
    <div class="container">
    <div class="checkout-wrap pt-30">
                <div class="row">
                    
                    <div class="col-lg-7">
                        <div class="billing-info-wrap mr-50">
                            <h3>Billing Details</h3>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="billing-info mb-20">
                                        <label>Full Name <abbr class="required" title="required">*</abbr></label>
                                        <input type="text" name="userName" value="<%=user.getUserName()%>" disabled>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="billing-info mb-20">
                                        <label>Shipping Address <abbr class="required" title="required">*</abbr></label>
                                        <textarea class="billing-address"  name="shippingAddress" disabled> <%=user.getShippingAddress()%> </textarea>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12">
                                    <div class="billing-info mb-20">
                                        <label>Phone <abbr class="required" title="required">*</abbr></label>
                                        <input type="text" name="phoneNumber" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" value="<%=user.getPhoneNumber() %>" disabled>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12">
                                    <div class="billing-info mb-20">
                                        <label>Email Address <abbr class="required" title="required">*</abbr></label>
                                        <input type="text" name="email" value="<%=user.getEmail() %>" disabled>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                         <form method="POST" action="PaymentProofServlet" enctype="multipart/form-data">
                        <div class="your-order-area">
                            <h3>Receipt Order</h3>
                            <div class="your-order-wrap gray-bg-4">
                                <div class="your-order-info-wrap">
                                    
                                    <div class="your-order-info order-total">
                                        <ul>
                                            <li>Total <span>RM <fmt:formatNumber type="number" maxFractionDigits="2" value="<%= total %>"/> </span></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="payment-method">
                                    <div class="pay-top sin-payment">
                                        <input id="payment_method_1" class="input-radio" type="radio" value="cheque" checked="checked" name="payment_method">
                                        <label for="payment_method_1"> Direct Bank Transfer </label>
                                        <div class="payment-box payment_method_bacs">
                                            <h6>Darks Bank Account Number: <b>9773287420390</b> </h6>
                                        <p>Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order will not be shipped until the funds have cleared in our account.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <div class="col-lg-12 col-md-12">
                                    <div class="billing-info mb-20">
                                        <label><b>Payment Proof</b></label>
                                        <input type="file" name="file" required>
                                    </div>
                             </div>
                           
                            <div class="Place-order mt-40">
                                <input type="hidden" name="userID" value="<%= user.getId()%>">
                                <input type="hidden" name="rentID" value="<%= rentID %>">
                                <input type="hidden" name="userName" value="<%= user.getUserName() %>">
                                <input type="submit" value="Confirm Payment" style="background-color: red; color: white">
                            </div>
                               
                        </div>
                                 </form>
                    </div>
                        
                </div>
            </div>
    </div>
    <!-- Content ends here here -->
    
    
    <footer class="footer-area">
        <div class="footer-bottom border-top-2 pt-30">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                        <div class="copyright-2 pb-30">
                            <p>Copyright ©  All Right Reserved.</p>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                        <div class="payment-mathod-2 pb-30">
                            <a href="#"><img src="assets/img/icon-img/payment-2.png" alt=""></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</div>










<!-- All JS is here
============================================ -->

<!-- jQuery JS -->
<script src="assets/js/vendor/jquery-1.12.4.min.js"></script>
<!-- Popper JS -->
<script src="assets/js/popper.min.js"></script>
<!-- Bootstrap JS -->
<script src="assets/js/bootstrap.min.js"></script>
<!-- Plugins JS -->
<script src="assets/js/plugins.js"></script>
<!-- Ajax Mail -->
<script src="assets/js/ajax-mail.js"></script>
<!-- Main JS -->
<script src="assets/js/main.js"></script>

</body>

</html>

