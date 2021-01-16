<%-- 
    Document   : userTransactionHistory
    Created on : Jan 16, 2021, 9:37:40 AM
    Author     : user
--%>

<%-- 
    Document   : userIndex
    Created on : Jan 15, 2021, 2:38:33 PM
    Author     : janic
--%>

<%@page import="bean.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<div class="wrapper">
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
                                    <li class="angle-shape"><a href="userIndex.jsp">Home </a></li>
                                    <li class="angle-shape">
                                    <form name="View" action="ViewProductsServlet" method="POST">
                                    <input type="hidden" name="action" value="userview"><input type="submit" value="Products"></form></li>
                                    <li><a href="">Promotion <span>hot</span> </a></li>
                                    <li class="angle-shape">Pages
                                        <ul class="submenu">
                                            <li><a href="">About us </a></li>
                                            <li><a href="userTransactionHistory.jsp">Transaction History </a></li>
                                            <li><a href="">Wishlist</a></li>
                                            <li><a href="">Renting Cart</a></li>
                                            <li><a href="">Feedback </a></li>
                                            <li><a href="">My Profile </a></li>
                                            <li><a href="">Logout </a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3">
                        <div class="header-right-wrap pt-40">
                            <div class="header-search">
                                <a class="search-active" href=""><i class="sli sli-magnifier"></i></a>
                            </div>
                                  
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
                    <div class="card-body">
                    <div class="card text-center">
                    <h1 class="card-title">Welcome to <br><b>Dress & Suits Renting System.</b></h1>
                    <p class="card-text">Rent the best quality of dress and suits here.</p>
                        </div>
                    </div>
                </div>
                    
            <div>
            <table border="1" cellpadding="10" cellspacing="10" width="100%">
                <tr style="background-color: peachpuff">
                    <td>Munchkin Cat</td>
                    <td></td>
                </tr>
                <tr style="background-color: cornsilk">
                    <td>Age</td>
                    <td>6</td>
                </tr>
                <tr style="background-color: cornsilk">
                    <td>Quantity</td>
                    <td><input type="text" name="itemQuant1" id="itemQuant1" placeholder="Enter quantity here" required></td>
                </tr>
                <tr style="background-color: cornsilk">
                    <td>Price per unit</td>
                    <td>RM500</td>
                </tr>
                <tr style="background-color: cornsilk">
                    <td>Item Total</td>
                    <td><input type="text" name="total1" id="total1" placeholder="0" readonly></td>
                </tr>
                <tr style="background-color: peachpuff">
                    <td>British Shorthair Cat</td>
                    <td></td>
                </tr>
                <tr style="background-color: cornsilk">
                    <td>Age</td>
                    <td>3</td>
                </tr>
                <tr style="background-color: cornsilk">
                    <td>Quantity</td>
                    <td><input type="text" name="itemQuant2" id="itemQuant2" placeholder="Enter quantity here" required></td>
                </tr>
                <tr style="background-color: cornsilk">
                    <td>Price per unit</td>
                    <td>RM650</td>
                </tr>
                <tr style="background-color: cornsilk">
                    <td>Item Total</td>
                    <td><input type="text" name="total2" id="total2" placeholder="0" readonly></td>
                </tr>
                <tr>
                    <td colspan="2">
                       
                        <a href="cart.html"><button class="btn btn-primary">Checkout</button></a>
                    </td>
                </tr>
            </table>
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

