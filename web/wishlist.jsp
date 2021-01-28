<%-- 
    Document   : wishlist
    Created on : Jan 19, 2021, 2:42:55 PM
    Author     : User
--%>

<%@page import="java.util.Vector"%>
<%@page import="bean.Products"%>
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
                                    <li class="angle-shape">
                                    <form name="View" action="ViewPromotionsServlet" method="POST">
                                    <input type="hidden" name="action" value="userview"><input type="submit" value="Promotion"></form></li>
                                    <li class="angle-shape">Pages
                                        <ul class="submenu">
                                            <li><a href="">About us </a></li>
                                            <li><a href="">Transaction History </a></li>
                                            <li><a href="wishlist.jsp">Wishlist</a></li>
                                            <li><a href="">Renting Cart</a></li>
                                            <li><a href="feedbackcust.jsp">Feedback </a></li>
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
    <div class="breadcrumb-area pt-35 pb-35 bg-gray">
        <div class="container">
            <div class="breadcrumb-content text-center">
                <ul>
                    <li>
                        <a href="userIndex.jsp">Home</a>
                    </li>
                    <li class="active">wishlist </li>
                </ul>
            </div>
        </div>
    </div>
    
        <%
        String output=(String)request.getAttribute("output");
        Products p = (Products)request.getAttribute("VCD");
        Vector wish = (Vector) session.getAttribute("wishlist");
        
        if(wish != null && (wish.size() > 0)){
            out.println("<div class=\"cart-main-area pt-95 pb-100\">\n" +
"        <div class=\"container\">\n" +
"            <h3 class=\"cart-page-title\">Your Wishlist</h3>\n" +
"            <div class=\"row\">\n" +
"                <div class=\"col-lg-12 col-md-12 col-sm-12 col-12\">\n" +
"                    <form action=\"#\">\n" +
"                        <div class=\"table-content table-responsive cart-table-content\">\n" +
"                            <table>\n" +
"                                <thead>\n" +
"                                    <tr>\n" +
"                                        <th>Image</th>\n" +
"                                        <th>Product Name</th>\n" +
"                                        <th>Until Price</th>\n" +
"                                        <th>Qty</th>\n" +
"                                        <th>Subtotal</th>\n" +
"                                        <th>Add To Cart</th>\n" +
"                                    </tr>\n" +
"                                </thead>\n" +
"                                <tbody>");
            
            out.println("LOOP TR CONTENTS HERE");
            
            out.println("</tbody>\n" +
"                            </table>\n" +
"                        </div>\n" +
"                    </form>\n" +
"                </div>\n" +
"            </div>\n" +
"        </div>\n" +
"    </div>");
        }else{
            out.println("<br></br><div class=\"container\">\n" +
"        <div class=\"card-body\">\n" +
"            <div class=\"card text-center\">\n" +
"                <br></br>\n" +
"                <h1 class=\"card-title\">Your wishlist is currently <b>EMPTY</b></h1>\n" +
"                <br></br>\n" +
"            </div>\n" +
"        </div>\n" +
"    </div>");
        }
    %>
    
    <!--
    <br></br>
    <div class="container">
        <div class="card-body">
            <div class="card text-center">
                <br></br>
                <h1 class="card-title">Your wishlist is currently <b>EMPTY</b></h1>
                <br></br>
            </div>
        </div>
    </div>
    -->
    <!--
    <div class="cart-main-area pt-95 pb-100">
        <div class="container">
            <h3 class="cart-page-title">Your Wishlist</h3>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                    <form action="#">
                        <div class="table-content table-responsive cart-table-content">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Image</th>
                                        <th>Product Name</th>
                                        <th>Until Price</th>
                                        <th>Qty</th>
                                        <th>Subtotal</th>
                                        <th>Add To Cart</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    -->
                                    <!--
                                    <tr>
                                        <td class="product-thumbnail">
                                            <a href="#"><img src="assets/img/cart/cart-3.svg" alt=""></a>
                                        </td>
                                        <td class="product-name"><a href="#">Product Name</a></td>
                                        <td class="product-price-cart"><span class="amount">RM260.00</span></td>
                                        <td class="product-quantity">
                                            <div class="cart-plus-minus">
                                                <input class="cart-plus-minus-box" type="text" name="qtybutton" value="2">
                                            </div>
                                        </td>
                                        <td class="product-subtotal">RM110.00</td>
                                        <td class="product-wishlist-cart">
                                            <a href="#">add to cart</a>
                                            <form   name="Rent" action="rentController" method="POST">
                                            <input  type="hidden" name="action" value="prod.getId()">
                                            <input  type="submit" name="option" value="Rent" style="background-color: red; color: white">
                                            </form>
                                       </td>
                                    </tr>
                                    -->
                                    <!--
                                </tbody>
                            </table>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    -->
    
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
