<%-- 
    Document   : wishlist
    Created on : Jan 19, 2021, 2:42:55 PM
    Author     : User
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="bean.Products"%>
<%@page import="bean.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    //Products prod = (Products)session.getAttribute("wishlist"); 
    ArrayList products= (ArrayList) session.getAttribute("wishlist");
%>

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
    
<% if (products != null && (products.size() > 0)) { %>
<div class="team-area pt-15 pb-0">
        <div class="container">
            <div class="section-title text-center pb-60"> 
                <form name="resetwish" action="WishlistController" method="POST">
                    <input  type="hidden" name="output" value="RESET">
                    <input  type="submit" class="btn btn-outline-danger" value="Clear Wishlist">
                </form>
            </div>
        </div>
    </div>
    <div class="cart-main-area pt-0 pb-100">
        <div class="container">
            <h3 class="cart-page-title">Your Wishlist</h3>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-12 align-self-center">
                        <div class="table-content table-responsive cart-table-content">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Product ID</th>
                                        <th>Image</th>
                                        <th>Product Name</th>
                                        <th>Subtotal</th>
                                        <th>Remove</th>
                                        <th>Rent</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                    for (int index=0; index < products.size();index++)
                                       {
                                           Products prod = (Products) products.get(index); %>
                                    <tr>
                                        <td class="product-subtotal"><%= prod.getId() %></td>
                                        <td class="product-thumbnail">
                                            <img src="<%= prod.getProdImage() %>" alt="Image <%= index %>">
                                        </td>
                                        <td class="product-name"><%= prod.getProdTitle() %></td>
                                        
                                        <td class="product-subtotal">RM<%= prod.getProdPrice() %></td>
                                        
                                        <td class="product-wishlist-cart">
                                            <form   name="delwish" action="WishlistController" method="POST">
                                            <input  type="hidden" name="title" value="<%= prod.getProdTitle() %>">
                                            <input  type="hidden" name="index" value="<%= index %>">
                                            <input  type="submit" class="btn btn-outline-danger" name="output" value="Remove">
                                            </form>
                                       </td>
                                       
                                        <td class="product-wishlist-cart">
                                            <form   name="rent" action="rentController" method="POST">
                                            <input  type="hidden" name="action" value="<%= prod.getId() %>">
                                            <input  type="submit" class="btn btn-outline-danger" name="option" value="Rent">
                                            </form>
                                       </td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                </div>
            </div>
        </div>
    </div>
    <% }else { %>
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
    <% } %>
    
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
