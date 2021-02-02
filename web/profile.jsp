<%-- 
    Document   : profile
    Created on : Jan 19, 2021, 10:28:28 PM
    Author     : janic
--%>

<%@page import="bean.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%User users = (User)session.getAttribute("users");
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
  <script language="javascript">
function changePassword()
{
var oldpwd = document.getElementsByName("OldPassword")[0].value;
var newpass = document.getElementsByName("newpassword")[0].value;
var conpass = document.getElementsByName("conpassword")[0].value;
var compareOld = oldpwd.localeCompare(users.getUserPassword());
var compareNew = newpass.localeCompare(conpass);

//alert(document.getElementById("OLDpwd").value);
//alert("bla bla bola");



if(oldpwd.localeCompare(users.getUserPassword()) !=0)
{
alert('Please input old password');
document.ChangePasswordForm.OldPassword.focus();
return false;
} 


if(newpass.localeCompare(conpass) !="0")
{
alert('Confirm Password Not Match');
document.ChangePasswordForm.conpassword.focus(); 
return false;
} 

document.ChangePasswordForm.submit();

}
</script>
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
    <div class="container">
    <div class="myaccount-content">
        
        
                                            <h3>Account Details</h3>    
                                            <div class="account-details-form">
                                                <form action="ProfileServlet" method="POST">
                                                    
                                                    <div class="row">
                                                    <div class="single-input-item">
                                                        <label for="display-name" class="required">UserName</label>
                                                        <input type="text" name="userName" value="<%=users.getUserName()%>" required/>
                                                    </div>    
                                                    <div class="single-input-item">
                                                        <label for="email" class="required">Email Address</label>
                                                        <input type="email" name="email" value="<%=users.getEmail() %>" required/>
                                                    </div>    
                                                        <div class="">
                                                        <label for="gender" class="required">Gender</label>
                                                        <% if(users.getRole().equals("Male")){ %>
                                                        <select name="gender">
                                                            <option>Male</option>
                                                            <option>Female</option>
                                                        </select><br><br>
                                                        <% } else { %>
                                                        <select name="gender">
                                                            <option>Female</option>
                                                            <option>Male</option>
                                                        </select><br><br> <% } %>
                                                        </div>
                                                    </div>
                                                        <div class="row">
                                                       
                                                        <div class="single-input-item">
                                                        <label for="shipping" class="required">Shipping Address</label>
                                                        <textarea name="shippingAddress" rows="3" cols="50" required><%=users.getShippingAddress() %></textarea>
                                                    </div>   
                                                        <div class="single-input-item">
                                                        <label for="phone" class="required">Phone Number</label>
                                                        <input type="text" name="phoneNumber" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" value="<%=users.getPhoneNumber() %>" required/>
                                                    </div>   
                                                    <hr>
                                                    <div class="single-input-item">
                                                        
                                                        <button type="submit" class="check-btn sqr-btn" onclick="return confirm('Are you sure you wish to change your details?')">Save Changes</button>
                                                        <input type="hidden" name="action" value="update"><input type="hidden" name="userid" value="<%= users.getId() %>">
                                                        <input type="hidden" name="role" value="<%= users.getRole() %> ">
                                                        <input type="hidden" name="userPassword" value="<%= users.getUserPassword() %> ">
                                                    </div>
                                            </div>
                                                     </form>
                                                    <form name="ChangePasswordForm" action="ProfileServlet" method="POST">
                                             <div class="row">
                                                 <div class="single-input-item">
                                                        <label for="OldPassword" class="required">Old Password</label>
                                                        <input type="password" name="OldPassword" id="OLDpwd"/>
                                                  </div>  
                                                    <div class="single-input-item">
                                                        <label for="newpassword" class="required">New Password</label>
                                                        <input type="password" name="newpassword" id="newpassword"/>
                                                    </div>    
                                                    <div class="single-input-item">
                                                        <label for="newpassword" class="required">Confirm Password</label>
                                                        <input type="password" name="conpassword" id="conpassword"/>
                                                    </div>  
                                                 <hr>
                                                    <div class="single-input-item">
                                                        
                                                        <button type="submit" class="check-btn sqr-btn" onClick="changePassword()">Change Password</button>
                                                        <input type="hidden" name="action" value="changePassword"><input type="hidden" name="userid" value="<%= users.getId() %>">
                                                        <input type="hidden" name="role" value="<%= users.getRole() %> ">
                                                        <input type="hidden" name="phoneNumber" value="<%=users.getPhoneNumber() %>">
                                                        <input type="hidden" name="userPassword" value="<%= users.getUserPassword() %> ">
                                                        <input type="hidden" name="shippingAddress" value="<%=users.getShippingAddress() %>">
                                                        <input type="hidden" name="email" value="<%=users.getEmail() %>">
                                                        <input type="hidden" name="userName" value="<%=users.getUserName()%>">
                                                        <input type="hidden" name="gender" value="<%=users.getGender() %>">
                                                    </div>
                                                       
                                            </div>
                                                    </form>
                                                   
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