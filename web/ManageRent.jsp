<%-- 
    Document   : ManageRent
    Created on : Jan 16, 2021, 10:30:25 PM
    Author     : Anderson
--%>


<%@page import="bean.User"%>
<%@page import="bean.rent"%>
<%@page import="bean.Products"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    ArrayList rentAL= (ArrayList) session.getAttribute("rent");
    User user = (User)session.getAttribute("User");
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
        table {
          width: 100%;
          border: 1px solid black;
          border-collapse: collapse;
        }

        th, td {
          text-align: left;
          padding: 8px;
          border: 1px solid black;
        }

        tr:nth-child(even){background-color: #f2f2f2}

        th {
          background-color: black;
          color: white;
        }
        
    </style>
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
    <% if (rentAL != null && (rentAL.size() > 0)) { %>
    <div class="container" style="item-align: center" >
        
                        <table>
                            <tr>
                                <th>No</th>
                                <th>Product Name</th>
                                <th>Quantity</th>
                                <th>Total Price</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th>Status</th>
                                <th colspan="2">Action</th>
                            </tr>
                            <% 
                                 for (int index=0; index < rentAL.size();index++){
                                    rent rent= (rent) rentAL.get(index); %>
                                    <tr>
                                        <td><%= index+1 %></td>
                                        <td><%= rent.getProdTitle() %></td>
                                        <td><%= rent.getQuantity() %></td>
                                        <td>RM<fmt:formatNumber type="number" maxFractionDigits="2" value="<%= rent.getPrice() %>"/></td>
                                        <td><%= rent.getStartdate() %></td>
                                        <td><%= rent.getEnddate() %></td>
                                        <td><%= rent.getStatus() %></td>
                                       
                                            <% if(rent.getStatus().equals("REJECTED")){ %>
                                        <td>
                                            <form name="checkoutForm" action="#" method="#">
                                            <input type="submit" value="Checkout" class="btn" disabled/>
                                             </form>
                                        </td>
                                        <td>
                                             <form name="checkoutForm" action="rentController">
                                                <input type="hidden" name="option" value="removeuser" class="btn btn-info">
                                                <input type="hidden" name="action" value="<%= rent.getId() %>" class="btn btn-info">
                                                <input  type="hidden" name="newUser" value="<%= user.getUserName() %>"/>
                                                 <input type="submit" value="REMOVE" class="btn btn-danger">
                                            </form>
                                        </td>
                                        <%}    
                                        
                                        else if(rent.getStatus().equals("APPROVED")){%>
                                        <td>
                                            <form name="checkoutForm" action="PaymentServlet" method="POST">
                                                <input type="hidden" name="userID" value="<%= user.getId() %>">
                                                <input type="hidden" name="rentID" value="<%= rent.getId() %>">
                                            <input type="submit" value="Checkout" class="btn btn-primary"/>
                                             </form>
                                        </td>
                                        <td>
                                             <form name="checkoutForm" >
                                                 <input type="submit" value="Remove" class="btn" disabled>
                                            </form>
                                        </td>
                                        <%}
                                            else if(rent.getStatus().equals("PENDING")){
                                        %>
                                        <td>
                                            <form name="checkoutForm" action="#" method="#">
                                            <input type="submit" value="Checkout" class="btn" disabled/>
                                             </form>
                                        </td>
                                        <td>
                                             <form name="checkoutForm" action="rentController">
                                                <input type="hidden" name="option" value="removeuser" class="btn btn-info">
                                                <input type="hidden" name="action" value="<%= rent.getId() %>" class="btn btn-info">
                                                <input  type="hidden" name="newUser" value="<%= user.getUserName() %>"/>
                                                 <input type="submit" value="REMOVE" class="btn btn-danger">
                                            </form>
                                        </td> 
                                        <%}
                                            else{
                                        %>
                                        <td>
                                            <form name="checkoutForm" action="#" method="#">
                                            <input type="submit" value="Checkout" class="btn" disabled/>
                                             </form>
                                        </td>
                                        <td>
                                             <form name="checkoutForm" >
                                                 <input type="submit" value="Remove" class="btn" disabled>
                                            </form>
                                        </td> 
                                    </tr>
                                     <% }  
                                                         }
                                }

                            else { %>
                                 <center><b><p>No Rent Made yet</b></center>
                    <% } %>
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