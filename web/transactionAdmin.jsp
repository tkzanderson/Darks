<%-- 
    Document   : transactionAdmin
    Created on : Jan 31, 2021, 9:56:38 PM
    Author     : user
--%>


<%@page import="bean.Products"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.Payment"%>
<%@page import="bean.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%  ArrayList payment= (ArrayList) session.getAttribute("payment"); %>
 <%  ArrayList product= (ArrayList) session.getAttribute("products"); %>
  <%  ArrayList paymentDate= (ArrayList) session.getAttribute("paymentDate"); %>
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
                                            <li> <form name="View" action="transactionController" method="POST">
                                                <input type="hidden" name="view" value="admin">
                                                 
                                                <input type="submit" value="Transaction">
                                           </form></li>
                                            <li><form name="rent" action="rentController" method="POST">
                                            
                                            <input type="hidden" name="option" value="ViewRent">
                                            <input type="hidden" name="action" value="1">
                                            <input type="submit" value="Manage Rent">
                                                </form></li>
                                            <li><a href="feedbackadmin.jsp">Feedback </a></li>
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
                    <div class="card-body">
                    <div class="card text-center">
                    <h1 class="card-title"><b>Transaction History</b></h1>
                   
                        </div>
                    </div>
                </div>
                    
            <div>
            <table border="1" cellpadding="10" cellspacing="10" width="100%">
                <tr style="background-color: peachpuff">
                    <th>No.</th>
                    <th>Price</th>
                    <th>Product Name</th>
                    <th>Product Description</th>
                    <th>Product Type</th>
                    <th>Size</th>
                    <th>Payment Date</th>
                    <th>Quantity</th>
                </tr>    
               
                 <% if (payment != null && (payment.size() > 0)) { 
                       for (int i=0; i < payment.size();i++){
                      Payment payments = (Payment) payment.get(i);
                       Products products = (Products) product.get(i);
                           Payment paydates = (Payment) paymentDate.get(i);
                 %>
                   <tr style="background-color: cornsilk">
                    <td><%= i+1 %></td>
                    <td><%= payments.getTotal() %></td>
                    <td><%= products.getProdTitle() %></td>
                    <td><%= products.getProdDescription() %></td>
                    <td><%= products.getProdType() %></td>
                   
                    <td><%= payments.getSize() %></td>
                      <td><%= paydates.getPaidDate() %></td>
                      <td><%= payments.getQuantity() %></td>
                     </tr>
                       <%}%>
               
                <%}else{%>
                
                        <div class="container">
                    <div class="card-body">
                    <div class="card text-center">
                    <h5 class="card-title"></h5>
                    <h5 class="card-title">Hi there</h5>
                    <p class="card-text">Its look like you havent start renting any product yet</p>
                        </div>
                    </div>
                </div>
                             <%}%>

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
    </body>