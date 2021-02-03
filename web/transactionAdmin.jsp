<%-- 
    Document   : transactionAdmin
    Created on : Jan 31, 2021, 9:56:38 PM
    Author     : user
--%>


<%@page import="bean.rent"%>
<%@page import="bean.Products"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.Payment"%>
<%@page import="bean.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%User user = (User)session.getAttribute("User");%>

<%  ArrayList users= (ArrayList) session.getAttribute("users"); %>
 <%  ArrayList payment= (ArrayList) session.getAttribute("payment"); %>
 <%  ArrayList product= (ArrayList) session.getAttribute("products"); %>
 <%  ArrayList renting= (ArrayList) session.getAttribute("renting"); %>
 
  <%  ArrayList payment1= (ArrayList) session.getAttribute("payment1"); %>
 <%  ArrayList product1= (ArrayList) session.getAttribute("products1"); %>
 <%  ArrayList renting1= (ArrayList) session.getAttribute("renting1"); %>
 
  <%  ArrayList payment2= (ArrayList) session.getAttribute("payment2"); %>
 <%  ArrayList product2= (ArrayList) session.getAttribute("products2"); %>
 <%  ArrayList renting2= (ArrayList) session.getAttribute("renting2"); %>
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
<div >
  
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
                                    <li class="angle-shape">
                                        <form name="Home" action="HomeServlet" method="POST">                                   
                                        <input type="hidden" name="userName" value="<%= user.getUserName() %>">
                                        <input type="hidden" name="option" value="adminhome">
                                        <input type="submit" value="Home">
                                    </form>
                                    </li>
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
                                            <li> <form name="View" action="transactionController" method="POST">
                                                <input type="hidden" name="view" value="admin">
                                                 <input type="hidden" name="userID" value=" <%=user.getId()%>">
                                                <input type="submit" value="Transaction">
                                           </form></li>
                                            <li><form name="rent" action="rentController" method="POST">
                                            <input type="hidden" name="newUser" value="<%= user.getUserName() %>">
                                            <input type="hidden" name="option" value="ViewRent">
                                            <input type="hidden" name="action" value="1">
                                            <input type="submit" value="Manage Rent">
                                                </form></li>
                                            <li>
                                                <form name="feedback" action="FeedbackController" method="POST">
                                                    <input type="hidden" name="action" value="ADMIN">
                                                    <input type="submit" value="Feedback">
                                                </form>
                                            </li>
                                            <li><form name="profile" action="ProfileServlet" method="POST">
                                            <input type="hidden" name="id" value="<%= user.getId()%>"><input type="hidden" name="action" value="display"><input type="submit" value="My Profile"></form></li>
                                            <li><a href="admin-register.jsp">Register new admin</a></li> 
                                            <li><form name="rent" action="chartController" method="POST">
                                            <input type="hidden" name="newUser" value="<%= user.getUserName() %>">
                                            <input type="submit" value="View Reports">
                                                </form></li>

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
            <div class="card-body">
            <div class="card text-center">
                <h1 class="card-title"><b>Transaction History</b></h1>
            </div>
            </div>
        </div>       
                    
       <br>

        <!--Table 1 for all the item that havent been returned-->
        <div class="container">

        <div class="card text-center">
            <h5 class="card-title">List of all dress and suit that had been paid</h5>
            <div>
            <table border="1" cellpadding="10" cellspacing="10" width="100%">
                <tr style="background-color: peachpuff">
                     <th>No.</th>
                    <th>Product Name</th>
                    <th>Product Description</th>
                    <th>Product Type</th>
                    <th>Size</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                    <th>Payment Date</th>
                </tr>    
               
                 <% if (renting2 != null && (renting2.size() > 0)) { 
                       for (int i=0; i < renting2.size();i++){
                      Payment payments2 = (Payment) payment2.get(i);
                       Products products2 = (Products) product2.get(i);
                        rent rentings2 = (rent) renting2.get(i);
                 %>
                   <tr style="background-color: cornsilk">
                   <td><%= i+1 %></td>
                    
                    <td><%= products2.getProdTitle() %></td>
                    <td><%= products2.getProdDescription() %></td>
                    <td><%= products2.getProdType() %></td>
                   
                     <td><%= rentings2.getSize() %></td>

                   <td><%= rentings2.getQuantity() %></td>
                   <td><%= rentings2.getTotalprice() %></td>
                                      <td><%= payments2.getPaidDate() %></td>
                     </tr>
                       <%}%>
               
                <%}%>
            </table>
            </div>
        </div>
        </div>
        <hr>
        <br>    
        <br> 
                                     
 <!--Table 2 for item that haven't been returned-->
    <div class="container">
        <div class="card text-center">
            <h5 class="card-title">List of dress and suit that currently rented out</h5>
        <div>        

 <table border="1" cellpadding="10" cellspacing="10" width="100%">
                <tr style="background-color: peachpuff">
                    <th>No.</th>
                    <th>Product Name</th>
                    <th>Product Description</th>
                    <th>Product Type</th>
                    <th>Size</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                    <th>Payment Date</th>
                     <th>Customer Name</th>
                </tr>    
               
                 <% if (renting != null && (renting.size() > 0)) { 
                       for (int i=0; i < renting.size();i++){
                      Payment payments = (Payment) payment.get(i);
                       Products products = (Products) product.get(i);
                        rent rentings = (rent) renting.get(i);
                        User userr = (User) users.get(i);
                 %>
                   <tr style="background-color: cornsilk">
                   <td><%= i+1 %></td>
                   
                    <td><%= products.getProdTitle() %></td>
                    <td><%= products.getProdDescription() %></td>
                    <td><%= products.getProdType() %></td>
                   
                     <td><%= rentings.getSize() %></td>
                   
                   <td><%= rentings.getQuantity() %></td>
                    <td><%= rentings.getTotalprice() %></td>
                    <td><%= payments.getPaidDate() %></td>
                     <td><%= userr.getUserName() %></td>
                     </tr>
                       <%}%>
               
                <%}%>
        </table>
        </div>
        </div>
        </div>              
        <hr>         
        <br>               
        <br>  
                            
  <!--Table 3 for item that has been returned--> 
     <div class="container">

       <div class="card text-center">
            <h5 class="card-title">List of dress and suit that have been returned</h5>
             <div>
            <table border="1" cellpadding="10" cellspacing="10" width="100%">
                <tr style="background-color: peachpuff">
                    <th>No.</th>
                    <th>Product Name</th>
                    <th>Product Description</th>
                    <th>Product Type</th>
                    <th>Size</th>
                    <th>Quantity</th>
                   <th>Total Price</th>
                    <th>Payment Date</th>
                </tr>    
               
                 <% if (renting1 != null && (renting1.size() > 0)) { 
                       for (int i=0; i < renting1.size();i++){
                     Payment payments1 = (Payment) payment1.get(i);
                       Products products1 = (Products) product1.get(i);
                        rent rentings1 = (rent) renting1.get(i);
                 %>
                   <tr style="background-color: cornsilk">
                   <td><%= i+1 %></td>
                   
                    <td><%= products1.getProdTitle() %></td>
                    <td><%= products1.getProdDescription() %></td>
                    <td><%= products1.getProdType() %></td>
                   
                     <td><%= rentings1.getSize() %></td>
                

                   <td><%= rentings1.getQuantity() %></td>
                    <td><%= rentings1.getTotalprice() %></td>
                      <td><%= payments1.getPaidDate() %></td>
                     </tr>
                       <%}%>
               
                <%}%>
        </table>
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
    </body>
