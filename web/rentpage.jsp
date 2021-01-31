<%-- 
    Document   : rentpage
    Created on : Jan 18, 2021, 9:05:22 AM
    Author     : Anderson
--%>
<%@page import="bean.User"%>
<%@page import="bean.Products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
   <% Products prod = (Products)session.getAttribute("products"); 
      //String username = (String)session.getAttribute("username");
      User user = (User)session.getAttribute("users");
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"/></script>
    <link rel="stylesheet" ref="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/themes/smoothness/jquery-ui.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>
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
                    <div class="col-xl-7 col-lg-7 ">
                        <div class="main-menu">
                            <nav>
                                <ul>
                                    <li class="angle-shape"><a href="userIndex.jsp">Home </a></li>
                                     <li class="angle-shape"><a href="/Darks/ViewProductsServlet"> Products <span>new</span> </a></li>
                                    <li><a href="">Promotion <span>hot</span> </a></li>
                                    <li class="angle-shape">Pages
                                        <ul class="submenu">
                                            <li><a href="">About us </a></li>
                                            <li><a href="">Transaction History </a></li>
                                            <li><a href="wishlist.jsp">Wishlist</a></li>
                                            <li><a href="">Manage Rent</a></li>
                                            <li><a href="feedbackcust.jsp">Feedback </a></li>
                                            <li><a href="">My Profile </a></li>
                                            <li><a href="">Manage Products </a></li>
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
    
 
    <div class="shop-list-wrap shop-list-mrg mb-30">
        <div class="row">
            <div class="col-lg-4 col-md-5 align-self-center">
                <div class="product-list-img">
                    <img src="<%= prod.getProdImage() %>" style="width: 300px; height:400px" />
               </div>
             </div>
             <div class="col-lg-8 col-md-7 align-self-center">
                                            <div class="row">
                                                <div class="col-lg-6 col-md-12">
                                                    <div class="shop-list-content">
                                                        <h3><a href="product-details.html"><%= prod.getProdTitle() %></a></h3>
                                                        <span><%= prod.getProdType() %></span>
                                                        <div class="shop-list-paragraph">
                                                        <p><%= prod.getProdDescription() %></p>
                                                        
                                                    </div>
                                                        <div class="ht-product-list-price">
                                                            <span class="new">RM<%= prod.getProdPrice() %></span>
                                                        </div>
                                                        <form action="rentController" method="POST">
                                                            <label for="size">Choose your size:</label>
                                                            <select name="size">
                                                                 <option value="S">Small</option>
                                                                 <option value="M">Medium</option>
                                                                 <option value="L">Large</option>
                                                                 <option value="XL">Extra large</option>
                                                                 <option value="XXL">Extra extra large</option>
                                                            </select>
                                                            <b>Quantity: </b><input type="text" name="quantity" SIZE="1" value=1>
<!--                                                            <label>
                                                            Start <br/>
                                                            <input type="date" name="startrent" value="Today"/>
                                                            </label>
 
                                                            <label>
                                                            End <br/>
                                                            <input type="date" name="endrent" data-value="7" value="After one week"/>
                                                            </label>-->

                                                             <label for="from">From</label> 
                                                            <input type="text" id="from" name="from"/> 

                                                            <label for="to">to</label> 
                                                            <input type="text" id="to" name="to"/>
                                                            <input  type="hidden" name="action" value="<%= prod.getId() %>"/>
                                                            <input  type="hidden" name="newUser" value="<%= user.getUserName() %>"/>
                                                            <input class="btn btn-dark" type="submit" name="option" value="Confirm Rent"/>
                                                        </form>
                                                        
                                                    </div>
                                                </div>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
    
    
    
    
    
    
    
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
                                                        <script> 
                                                        var dateToday = new Date();
var dates = $("#from, #to").datepicker({
    defaultDate: dateToday,
    changeMonth: true,
    numberOfMonths: 2,
    minDate: dateToday,
    maxDate: '+14D',
    onSelect: function(selectedDate) {
        var option = this.id == "from" ? "minDate" : "maxDate",
            instance = $(this).data("datepicker"),
            date = $.datepicker.parseDate(instance.settings.dateFormat || $.datepicker._defaults.dateFormat, selectedDate, instance.settings);
        dates.not(this).datepicker("option", option, date);
    }
});
                                                        </script>                                                      
                                                        
</html>
