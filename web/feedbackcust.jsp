<%-- 
    Document   : feedbackcust
    Created on : Jan 16, 2021, 5:10:44 PM
    Author     : User
--%>

<%@page import="bean.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Darks: Feedback Page</title>
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
                                            <li><a href="">Transaction History </a></li>
                                            <li><a href="">Wishlist</a></li>
                                            <li><a href="">Renting Cart</a></li>
                                            <li><a href="">Feedback </a></li>
                                            <li><a href="">My Profile </a></li>
                                            <li><a href="<%=request.getContextPath()%>/LogoutServlet">Logout</a></li>
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
    <div class="team-area pt-95 pb-70">
        <div class="container">
            <div class="section-title text-center pb-60">
                <h2>Customer Feedbacks</h2>
                <p>“A satisfied customer is the best source of advertisement”</p>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="team-wrapper mb-30">
                        <div class="team-img">
                            <a href="#">
                                <img src="assets/img/team/team-1.jpg" alt="">
                            </a>
                            <div class="team-action">
                                <a class="facebook" href="#">
                                    <i class="sli sli-social-facebook"></i>
                                </a>
                                <a class="twitter" title="Wishlist" href="#">
                                    <i class="sli sli-social-twitter"></i>
                                </a>
                                <a class="instagram" href="#">
                                    <i class="sli sli-social-instagram"></i>
                                </a>
                            </div>
                        </div>
                        <div class="team-content text-center">
                            <h4>Mr.Mike Banding</h4>
                            <span>Manager </span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="team-wrapper mb-30">
                        <div class="team-img">
                            <a href="#">
                                <img src="assets/img/team/team-3.jpg" alt="">
                            </a>
                            <div class="team-action">
                                <a class="facebook" href="#">
                                    <i class="sli sli-social-facebook"></i>
                                </a>
                                <a class="twitter" title="Wishlist" href="#">
                                    <i class="sli sli-social-twitter"></i>
                                </a>
                                <a class="instagram" href="#">
                                    <i class="sli sli-social-instagram"></i>
                                </a>
                            </div>
                        </div>
                        <div class="team-content text-center">
                            <h4>Mr.Peter Pan</h4>
                            <span>Developer </span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="team-wrapper mb-30">
                        <div class="team-img">
                            <a href="#">
                                <img src="assets/img/team/team-2.jpg" alt="">
                            </a>
                            <div class="team-action">
                                <a class="facebook" href="#">
                                    <i class="sli sli-social-facebook"></i>
                                </a>
                                <a class="twitter" title="Wishlist" href="#">
                                    <i class="sli sli-social-twitter"></i>
                                </a>
                                <a class="instagram" href="#">
                                    <i class="sli sli-social-instagram"></i>
                                </a>
                            </div>
                        </div>
                        <div class="team-content text-center">
                            <h4>Ms.Sophia</h4>
                            <span>Designer </span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="team-wrapper mb-30">
                        <div class="team-img">
                            <a href="#">
                                <img src="assets/img/team/team-4.jpg" alt="">
                            </a>
                            <div class="team-action">
                                <a class="facebook" href="#">
                                    <i class="sli sli-social-facebook"></i>
                                </a>
                                <a class="twitter" title="Wishlist" href="#">
                                    <i class="sli sli-social-twitter"></i>
                                </a>
                                <a class="instagram" href="#">
                                    <i class="sli sli-social-instagram"></i>
                                </a>
                            </div>
                        </div>
                        <div class="team-content text-center">
                            <h4>Mr.John Lee</h4>
                            <span>Chairmen </span>
                        </div>
                    </div>
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
