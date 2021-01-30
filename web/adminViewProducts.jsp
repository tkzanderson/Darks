<%-- 
    Document   : adminViewProducts
    Created on : Jan 15, 2021, 10:27:47 PM
    Author     : janic
--%>


<%@page import="bean.Products"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ArrayList products= (ArrayList) session.getAttribute("products");
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
    <div style="width:200px; text-align: center; margin: auto">
        <a href="addproducts.jsp"><input type="submit" value="Add Product" class="btn btn-info"></a>
        </div>
    <br>
    <% if (products != null && (products.size() > 0)) { %>
    <div class="container" style="item-align: center" >
        
                        <table>
                            <tr>
                                <th>Id</th>
                                <th>Product Title</th>
                                <th>Product Description</th>
                                <th>Product Price</th>
                                <th>Product Type</th>
                                <th>Product Image</th>
                                <th>Active Status</th>
                                <th colspan="4">Action</th>
                            </tr>
                            <% 
                                 for (int index=0; index < products.size();index++){
                                    Products prod = (Products) products.get(index); %>
                                    <tr>
                                        <td><%= prod.getId() %></td>
                                        <td><%= prod.getProdTitle() %></td>
                                        <td><%= prod.getProdDescription() %></td>
                                        <td><%= prod.getProdPrice() %></td>
                                        <td><%= prod.getProdType() %></td>
                                        <td><%= prod.getProdImage() %></td>
                                        <td><%= prod.getActivate() %></td>
                                        <td>
                                             <form name="updateForm" action="ManageProductServlet" method="POST">
                                                 <input type="submit" value="Update" class="btn btn-secondary">
                                                 <input type="hidden" name="upindex" value="<%= prod.getId() %>">
                                                 <input type="hidden" name="action" value="UPDATE">
                                            </form>
                                        </td>
                                        <td>
                                             <form name="deleteForm" action="ManageProductServlet" method="POST">
                                                 <input type="submit" value="Delete" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this product?');">
                                                 <input type="hidden" name="delindex" value="<%= prod.getId() %>">
                                                 <input type="hidden" name="action" value="DELETE">
                                            </form>
                                        </td>
                                        
                                        <td>
                                             <form name="activateForm" action="activationServlet" method="POST">
                                                 <input type="submit" value="Activate" class="btn btn-primary">
                                                 <input type="hidden" name="index" value="<%= prod.getId() %>">
                                                 <input type="hidden" name="action" value=1>
                                            </form>
                                        </td>
                                        
                                        <td>
                                             <form name="deactivateForm" action="activationServlet" method="POST">
                                                 <input type="submit" value="Deactivate" class="btn btn-danger">
                                                 <input type="hidden" name="index" value="<%= prod.getId() %>">
                                                 <input type="hidden" name="action" value=0>
                                            </form>
                                        </td>
                                    </tr>
                                     <% } 
                                                         } 
                else { %>
                                 <center><b><p>Products Empty</b></center>
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