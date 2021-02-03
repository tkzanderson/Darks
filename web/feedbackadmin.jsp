<%-- 
    Document   : feedbackadmin
    Created on : Jan 17, 2021, 7:56:06 PM
    Author     : User
--%>

<%@page import="bean.Feedbacks"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="bean.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Darks: Feedback Page</title>
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
    
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="assets/css/feedback.css">
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
    <div class="team-area pt-50 pb-0">
        <div class="container">
            <div class="section-title text-center pb-60">
                <h2>Customer Feedbacks</h2>
                <p>“A satisfied customer is the best source of advertisement”</p><br><br>
                <button type="button" class="btn btn-outline-secondary">
                    <a href="addfeedbackadmin.jsp">
                        Add a Feedback
                    </a>
                </button>
            </div>
            <div class="row">
                <table class="table table-hover">
  <thead>
    <tr>
      <th style="width: 3%">Feedback ID</th>
      <th style="width: 6%">Customer Name</th>
      <th style="width: 20%">Feedback</th>
      <td style="width: 6%" align="center" scope="row"><b>Manage</b></td>
    </tr>
  </thead>
  <tbody>
     <!--
    <tr>
      <td> here(id) </td>
      <td> here(name) </td>
      <td> here(feedback) </td>
      <td>
        <form name="deleteFeedback" action="FeedbackController" method="POST">
            <input type="hidden" name="id" value=" here(id) ">
            <input type="hidden" name="action" value="DELETE">
            <INPUT class="btn btn-outline-secondary" NAME="submit" TYPE="submit" VALUE="DELETE">
        </form>
       </td>
    </tr>
     -->
                <% 
                    String driver = "com.mysql.jdbc.Driver";
                    String dbName = "darks";
                    String url = "jdbc:mysql://localhost/" + dbName + "?";
                    String userNameDB = "root";
                    String password = "";
                    String query = "SELECT * FROM feedback";

                    Class.forName(driver); //2. load and register the driver
                    Connection con = DriverManager.getConnection(url, userNameDB, password); //3. establish the connection

                    Statement st = con.createStatement(); //4. create the statement
                    ResultSet rs = st.executeQuery(query); //5.execute the query
                    
                    ArrayList<Feedbacks> fblist = new ArrayList<Feedbacks>(); 
                    String name, feedback;
                    int id;
                    
                    while(rs.next()){ //6. process the result
                        
                        id = rs.getInt(1);
                        name = rs.getString(2);
                        feedback = rs.getString(3);
                        Feedbacks f = new Feedbacks(id, name, feedback);
                        fblist.add(f);
    
                        /*out.println("<div class=\"col-lg-3 col-md-6 col-sm-6\">\n" +
"                    <div class=\"team-wrapper mb-30\">\n" +
"                        <div class=\"team-content text-center\">\n" +
"                            <h4> " + name + " </h4>\n" +
"                            <span>\"" + feedback + "\"</span><br><br>\n" +
"                            <form name=\"updateFeedback\" action=\"FeedbackController\" method=\"POST\">\n" +
"                                <input type=\"hidden\" name=\"id\" value=\"" + id + "\">\n" +
"                                <input type=\"hidden\" name=\"name\" value=\"" + name + "\">\n" +
"                                <input type=\"hidden\" name=\"feedback\" value=\"" + feedback + "\">\n" +
"                                <input type=\"hidden\" name=\"action\" value=\"UPDATE\">\n" +
"                                <INPUT class=\"btn btn-outline-secondary\" NAME=\"submit\" TYPE=\"submit\" VALUE=\"Update\">\n" +
"                            </form><br>\n" +
"                            <form name=\"deleteFeedback\" action=\"FeedbackController\" method=\"POST\">\n" +
"                                <input type=\"hidden\" name=\"id\" value=\"" + id + "\">\n" +
"                                <input type=\"hidden\" name=\"action\" value=\"DELETE\">\n" +
"                                <INPUT class=\"btn btn-outline-secondary\" NAME=\"submit\" TYPE=\"submit\" VALUE=\"DELETE\">\n" +
"                            </form>\n" +
"                        </div>\n" +
"                    </div>\n" +
"                </div>");*/
                        out.println("    <tr>\n" +
"      <td> " + id + " </td>\n" +
"      <td> " + name + " </td>\n" +
"      <td> " + feedback + " </td>\n" +
"      <td>\n" +
"        <form name=\"deleteFeedback\" action=\"FeedbackController\" method=\"POST\">\n" +
"            <input type=\"hidden\" name=\"id\" value=\"" + id + "\">\n" +
"            <input type=\"hidden\" name=\"action\" value=\"DELETE\">\n" +
"            <INPUT class=\"btn btn-outline-secondary\" NAME=\"submit\" TYPE=\"submit\" VALUE=\"DELETE\">\n" +
"        </form>\n" +
"       </td>\n" +
"    </tr>");
                    }
                                
                %> 
  </tbody>
</table>
                <!--
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="team-wrapper mb-30">
                        <div class="team-content text-center">
                            <h4> here(feedback) </h4>
                            <span>- here(name) </span><br><br>
                            <form name="updateFeedback" action="FeedbackController" method="POST">
                                <input type="hidden" name="id" value=" here(id) ">
                                <input type="hidden" name="name" value=" here(name) ">
                                <input type="hidden" name="feedback" value=" here(feedback) ">
                                <input type="hidden" name="action" value="UPDATE">
                                <INPUT class="btn btn-outline-secondary" NAME="submit" TYPE="submit" VALUE="Update">
                            </form><br>
                            <form name="deleteFeedback" action="FeedbackController" method="POST">
                                <input type="hidden" name="id" value=" here(id) ">
                                <input type="hidden" name="action" value="DELETE">
                                <INPUT class="btn btn-outline-secondary" NAME="submit" TYPE="submit" VALUE="DELETE">
                            </form>
                        </div>
                    </div>
                </div>
                
                -->
                
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

