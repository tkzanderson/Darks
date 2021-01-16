<%-- 
    Document   : updatePromotions
    Created on : Jan 17, 2021, 5:33:27 AM
    Author     : user
--%>

<%@page import="bean.Products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    Products products = (Products) session.getAttribute("products");

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
    <style>
        
    </style>
   
</head>

<body>
<div class="wrapper">
    <header class="header-area sticky-bar">
        <div class="main-header-wrap">
            <div class="container">
                <div class="row">
                    <div class="col-xl-2 col-lg-2">
                        <div class="logo pt-40">
                            <a href="adminIndex.jsp">
                                <h1><b>Darks</b></h1>
                            </a>
                        </div>
                    </div>
                      <div class="col-xl-15 col-lg-15">
                        <div class="main-menu">
                            <nav>
                                <ul>
                                    <li class="angle-shape"><a href="adminIndex.jsp">Home </a></li>
                                    <li> <form name="View" action="ViewProductsServlet" method="POST" >
                                            <input type="hidden" name="action" value="adminview"> <input class="btn btn-light" type="submit" value="Manage Products"></form> 
                                        </li>
                                    <li>
                                        <form name="View" action="ViewPromotionsServlet" method="POST" >
                                             <input type="hidden" name="action" value="adminview">
                                            <input class="btn btn-light" type="submit" value="Manage Promotions">
                                        </form>
                                    </li>
                                    <li class="angle-shape">Pages
                                        <ul class="submenu">
                                            <li><a href="">About us </a></li>
                                            <li><a href="">Transaction History </a></li>
                                            <li><a href="">Manage Rent</a></li>
                                            <li><a href="">Feedback </a></li>
                                            <li><a href="">My Profile </a></li>
                                            <li><a href="admin-register.jsp">Register new admin</a></li>                                            

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
    <div class="container">
    <form name="editForm" action="UpdatePromotionServlet" method="POST" >
        <h1> Update Promotions</h1>
        Product Title: <input type="text" name="prodTitle" value="<%= products.getProdTitle() %>" readOnly=""><br><br>
        Product Description: <input type="text" name="prodDescription" value="<%= products.getProdDescription() %>" readOnly><br><br>
        Product Price: <input type="text" name="prodPrice" value="<%= products.getProdPrice() %>" readOnly=""><br><br>
        Product Type: <input type="text" name="prodType" value="<%= products.getProdType() %>" readOnly=""><br><br>
       <input type="hidden" name="prodImage" value="<%= products.getProdImage() %>">
         <input type="hidden" name="prodType" value="<%= products.getProdType()%>">
        
          Promotion Status
        <select name="promotionStatus" >
             <option value="1">On</option>
             <option value="0">Off</option> 
         </select><br>
        <br>Product Promotion Price: <input type="text" name="promotionPrice" value="<%= products.getPromotionPrice() %>" ><br>
      
    
        <br>
            <input type="submit" value="Update Promotions" class="btn btn-info">
            <input type="hidden" name="editindex" value="<%= products.getId() %>">
            <input type="hidden" name="action" value="EDIT">
        </form>
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
