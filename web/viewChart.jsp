<%-- 
    Document   : viewChart
    Created on : Feb 2, 2021, 3:49:17 PM
    Author     : Anderson
--%>

<%@page import="bean.Chart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>   
<%@page import="bean.User"%>
<%User user = (User)session.getAttribute("User");%>
<%Chart chart = (Chart)session.getAttribute("chart"); 
    String dataPoints = chart.getDataPoints();
    int total;
%>
<%Chart chart1 = (Chart)session.getAttribute("chart1"); 
    String dataPoints1 = chart1.getDataPoints();
    int total1;
%>
<!DOCTYPE HTML>
<html>
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
    
<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2", // "light1", "dark1", "dark2"
	exportEnabled: true,
	animationEnabled: true,
	title: {
		text: "Summary of Number of Rents"
	},
	data: [{
		type: "pie",
		toolTipContent: "<b>{label}</b>: {y}%",
		indexLabelFontSize: 16,
		indexLabel: "{label} - {y}%",
		dataPoints: <%out.print(dataPoints);%>
	}]
});

var chart2 = new CanvasJS.Chart("chartContainer2", {
	theme: "light2", // "light1", "dark1", "dark2"
	exportEnabled: true,
	animationEnabled: true,
	title: {
		text: "Summary of percentages of each products that had been rented"
	},
	data: [{
		type: "pie",
		toolTipContent: "<b>{label}</b>: {y}%",
		indexLabelFontSize: 16,
		indexLabel: "{label} - {y}%",
		dataPoints: <%out.print(dataPoints1);%>
	}]
});

chart.render();
chart2.render();
 
}
</script>




<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<div id="chartContainer2" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>       
