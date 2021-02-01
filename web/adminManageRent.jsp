<%-- 
    Document   : adminManageRent
    Created on : Jan 31, 2021, 5:07:48 PM
    Author     : Anderson
--%>

<%@page import="bean.rent"%>
<%@page import="bean.Products"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ArrayList rentAL= (ArrayList) session.getAttribute("rent");
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
                    <div class="col-xl-7 col-lg-7 ">
                        <div class="main-menu">
                            <nav>
                                <ul>
                                    <li class="angle-shape"><a href="adminIndex.jsp">Home </a></li>
                                     <li> <form name="View" action="ViewProductsServlet" method="POST" >
                                            <input type="hidden" name="action" value="adminview"> <input class="btn btn-light" type="submit" value="Manage Products"></form> 
                                        </li>
                                    <li><a href="">Promotion <span>hot</span> </a></li>
                                    <li class="angle-shape">Pages
                                        <ul class="submenu">
                                            <li><a href="">About us </a></li>
                                            <li><a href="">Transaction History </a></li>
                                            <li><a href="">Manage Rent</a></li>
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
                                <th colspan="4">Action</th>
                                <th>Payment Details</th>
                            </tr>
                            <% 
                                 for (int index=0; index < rentAL.size();index++){
                                    rent rent= (rent) rentAL.get(index); %>
                                    <tr>
                                        <td><%= index+1 %></td>
                                        <td><%= rent.getProdTitle() %></td>
                                        <td><%= rent.getQuantity() %></td>
                                        <td><%= rent.getPrice() %></td>
                                        <td><%= rent.getStartdate() %></td>
                                        <td><%= rent.getEnddate() %></td>
                                        <td><%= rent.getStatus() %></td>
                                        
                                            <% if(rent.getStatus().equals("PENDING")){ %>
                                        <td>
                                             <form name="approveForm" action="rentController">
                                                 <input type="hidden" name="option" value="approve" class="btn btn-info">
                                                 <input type="hidden" name="action" value="<%= rent.getId() %>" class="btn btn-info">
                                                 <input type="submit" value="APPROVE" class="btn btn-info">
                                            </form>
                                        </td>
                                        <td>
                                             <form name="rejectForm" action="rentController">
                                                 <input type="hidden" name="option" value="reject" class="btn btn-info">
                                                 <input type="hidden" name="action" value="<%= rent.getId() %>" class="btn btn-info">
                                                 <input type="submit" value="REJECT" class="btn btn-danger">
                                            </form>
                                        </td>
                                        <td>
                                            <form name="checkoutForm" action="rentController">
                                                <input type="hidden" name="option" value="return" class="btn btn-info">
                                                <input type="hidden" name="action" value="<%= rent.getId() %>" class="btn btn-info">
                                                 <input type="submit" value="RETURN" class="btn" disabled>
                                            </form>
                                       </td>
                                       <td>
                                            <form name="checkoutForm" action="rentController">
                                                <input type="hidden" name="option" value="remove" class="btn btn-info">
                                                <input type="hidden" name="action" value="<%= rent.getId() %>" class="btn btn-info">
                                                 <input type="submit" value="REMOVE" class="btn" disabled>
                                            </form>
                                        </td>
                                                    <%}
                                            else if (rent.getStatus().equals("APPROVED")){%>
                                        <td>
                                             <form name="approveForm" action="rentController">
                                                 <input type="hidden" name="option" value="approve" class="btn btn-info">
                                                 <input type="hidden" name="action" value="<%= rent.getId() %>" class="btn btn-info">
                                                 <input type="submit" value="APPROVE" class="btn" disabled>
                                            </form>
                                        </td>
                                            <td>
                                            <form name="rejectForm" action="rentController">
                                                 <input type="hidden" name="option" value="reject" class="btn btn-info">
                                                 <input type="hidden" name="action" value="<%= rent.getId() %>" class="btn btn-info">
                                                 <input type="submit" value="REJECT" class="btn btn-danger">
                                            </form>
                                            </td>
                                            <td>
                                            <form name="checkoutForm" action="rentController">
                                                <input type="hidden" name="option" value="return" class="btn btn-info">
                                                <input type="hidden" name="action" value="<%= rent.getId() %>" class="btn btn-info">
                                                 <input type="submit" value="RETURN" class="btn" disabled>
                                            </form>
                                       </td>
                                       <td>
                                            <form name="checkoutForm" action="rentController">
                                                <input type="hidden" name="option" value="remove" class="btn btn-info">
                                                <input type="hidden" name="action" value="<%= rent.getId() %>" class="btn btn-info">
                                                 <input type="submit" value="REMOVE" class="btn" disabled>
                                            </form>
                                        </td>
                                            <%}
                                            else if(rent.getStatus().equals("REJECTED"))
                                            {%>
                                            <td>
                                            <form name="approveForm" action="rentController">
                                                 <input type="hidden" name="option" value="approve" class="btn btn-info">
                                                 <input type="hidden" name="action" value="<%= rent.getId() %>" class="btn btn-info">
                                                 <input type="submit" value="APPROVE" class="btn btn-info">
                                            </form>
                                                </td>
                                            <td>
                                            <form name="rejectForm" action="rentController">
                                                 <input type="hidden" name="option" value="reject" class="btn btn-info">
                                                 <input type="hidden" name="action" value="<%= rent.getId() %>" class="btn btn-info">
                                                 <input type="submit" value="REJECT" class="btn" disabled>
                                            </form>
                                            </td>
                                            <td>
                                            <form name="checkoutForm" action="rentController">
                                                <input type="hidden" name="option" value="return" class="btn btn-info">
                                                <input type="hidden" name="action" value="<%= rent.getId() %>" class="btn btn-info">
                                                 <input type="submit" value="RETURN" class="btn" disabled>
                                            </form>
                                       </td>
                                                
                                                <td>
                                            <form name="checkoutForm" action="rentController">
                                                <input type="hidden" name="option" value="remove" class="btn btn-info">
                                                <input type="hidden" name="action" value="<%= rent.getId() %>" class="btn btn-info">
                                                 <input type="submit" value="REMOVE" class="btn btn-danger">
                                            </form>
                                                </td>
                                            <%}
                                            else if(rent.getStatus().equals("PAID"))
                                            {%>
                                            <td>
                                            <form name="approveForm" action="rentController">
                                                 <input type="hidden" name="option" value="approve" class="btn btn-info">
                                                 <input type="hidden" name="action" value="<%= rent.getId() %>" class="btn btn-info">
                                                 <input type="submit" value="APPROVE" class="btn" disabled>
                                            </form>
                                                </td>
                                            <td>
                                            <form name="rejectForm" action="rentController">
                                                 <input type="hidden" name="option" value="reject" class="btn btn-info">
                                                 <input type="hidden" name="action" value="<%= rent.getId() %>" class="btn btn-info">
                                                 <input type="submit" value="REJECT" class="btn" disabled>
                                            </form>
                                            </td>
                                            <td>
                                            <form name="checkoutForm" action="rentController">
                                                <input type="hidden" name="option" value="return" class="btn btn-info">
                                                <input type="hidden" name="action" value="<%= rent.getId() %>" class="btn btn-info">
                                                 <input type="submit" value="RETURN" class="btn btn-info">
                                            </form>
                                            </td>
                                            <td>
                                            <form name="checkoutForm" action="rentController">
                                                <input type="hidden" name="option" value="remove" class="btn btn-info">
                                                <input type="hidden" name="action" value="<%= rent.getId() %>" class="btn btn-info">
                                                 <input type="submit" value="REMOVE" class="btn" disabled>
                                            </form>
                                                </td>
                                            
                                            <%}
                                            else if(rent.getStatus().equals("COMPLETED"))
                                            {%>
                                            <td>
                                            <form name="approveForm" action="rentController">
                                                 <input type="hidden" name="option" value="approve" class="btn btn-info">
                                                 <input type="hidden" name="action" value="<%= rent.getId() %>" class="btn btn-info">
                                                 <input type="submit" value="APPROVE" class="btn" disabled>
                                            </form>
                                                </td>
                                            <td>
                                            <form name="rejectForm" action="rentController">
                                                 <input type="hidden" name="option" value="reject" class="btn btn-info">
                                                 <input type="hidden" name="action" value="<%= rent.getId() %>" class="btn btn-info">
                                                 <input type="submit" value="REJECT" class="btn" disabled>
                                            </form>
                                            </td>
                                            <td>
                                            <form name="checkoutForm" action="rentController">
                                                <input type="hidden" name="option" value="return" class="btn btn-info">
                                                <input type="hidden" name="action" value="<%= rent.getId() %>" class="btn btn-info">
                                                 <input type="submit" value="RETURN" class="btn" disabled>
                                            </form>
                                            </td>
                                            <td>
                                            <form name="checkoutForm" action="rentController">
                                                <input type="hidden" name="option" value="hide" class="btn btn-info">
                                                <input type="hidden" name="action" value="<%= rent.getId() %>" class="btn btn-info">
                                                 <input type="submit" value="REMOVE" class="btn" disabled>
                                            </form>
                                                </td>
                                            <%}%>
                                        
                                    
                                    <% if(rent.getStatus().equals("PAID")) { %>
                                        <td>
                                    <form name="displayPayment" action="DisplayPaymentServlet" method="POST">
                                        <input type="hidden" name="rentID" value="<%= rent.getId() %>">
                                        <input type="hidden" name="userID" value="<%= rent.getUserID() %>">
                                        <input type="submit" value="View" class="btn btn-info">
                                    </form>
                                        </td>
                                        <% } 
                                        else { %>
                                        <td>
                                            
                                        </td>
                                        <% } %>
                                        </tr>
                                        <%
                                         
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
