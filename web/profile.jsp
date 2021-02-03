<%-- 
    Document   : profile
    Created on : Jan 19, 2021, 10:28:28 PM
    Author     : janic
--%>

<%@page import="bean.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%User user = (User)session.getAttribute("users");
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
function changePassword(form)
{
   
const oldpwd = document.getElementsByName("OldPassword")[0].value;
const newpass = document.getElementsByName("newpassword")[0].value;
const conpass = document.getElementsByName("conpassword")[0].value;

const compareOld = document.getElementsByName("OldPassword")[1].value;


if(oldpwd !== compareOld )
{
alert('Please enter the correct old password');
return false;
}

else if(newpass =="")
{
alert('Enter a new password');
return false;
}


else if(newpass !== conpass)
{
alert('New Password Do Not Match'); 
return false;
}

else if(newpass.length < 6){
    alert('Password has to be at least 6 characters');
    return false;
}

else{
    return true;
}
}
</script>
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
    <div class="container">
    <div class="myaccount-content">
        
        
                                            <h3>Account Details</h3>    
                                            <div class="account-details-form">
                                                <form action="ProfileServlet" method="POST">
                                                    
                                                    <div class="row">
                                                    <div class="single-input-item">
                                                        <label for="display-name" class="required">UserName</label>
                                                        <input type="text" name="userName" value="<%=user.getUserName()%>" required/>
                                                    </div>    
                                                    <div class="single-input-item">
                                                        <label for="email" class="required">Email Address</label>
                                                        <input type="email" name="email" value="<%=user.getEmail() %>" required/>
                                                    </div>    
                                                        <div class="">
                                                        <label for="gender" class="required">Gender</label>
                                                        <% if(user.getGender().equals("Male")){ %>
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
                                                        <textarea name="shippingAddress" rows="3" cols="50" required><%=user.getShippingAddress() %></textarea>
                                                    </div>   
                                                        <div class="single-input-item">
                                                        <label for="phone" class="required">Phone Number</label>
                                                        <input type="text" name="phoneNumber" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" value="<%=user.getPhoneNumber() %>" required/>
                                                    </div>   
                                                    <hr>
                                                    <div class="single-input-item">
                                                        
                                                        <button type="submit" class="check-btn sqr-btn" onclick="return confirm('Are you sure you wish to change your details?')">Save Changes</button>
                                                        <input type="hidden" name="action" value="update"><input type="hidden" name="userid" value="<%= user.getId() %>">
                                                        <input type="hidden" name="role" value="<%= user.getRole() %> ">
                                                        <input type="hidden" name="userPassword" value="<%= user.getUserPassword() %> ">
                                                    </div>
                                            </div>
                                                     </form>
                                                    <form name="ChangePasswordForm" action="ProfileServlet" method="POST" onSubmit="return changePassword(this)">
                                             <div class="row">
                                                 <div class="single-input-item">
                                                        <label for="OldPassword" class="required">Old Password</label>
                                                        <input type="password" name="OldPassword" id="OLDpwd"/>
                                                        <input type="hidden" name="OldPassword" value="<%= user.getUserPassword() %>"/>
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
                                                        
                                                        <button type="submit" class="check-btn sqr-btn">Change Password</button>
                                                        <input type="hidden" name="action" value="changePassword"><input type="hidden" name="userid" value="<%= user.getId() %>">
                                                        <input type="hidden" name="role" value="<%= user.getRole() %> ">
                                                        <input type="hidden" name="phoneNumber" value="<%=user.getPhoneNumber() %>">
                                                        <input type="hidden" name="userPassword" value="<%= user.getUserPassword() %> ">
                                                        <input type="hidden" name="shippingAddress" value="<%=user.getShippingAddress() %>">
                                                        <input type="hidden" name="email" value="<%=user.getEmail() %>">
                                                        <input type="hidden" name="userName" value="<%=user.getUserName()%>">
                                                        <input type="hidden" name="gender" value="<%=user.getGender() %>">
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