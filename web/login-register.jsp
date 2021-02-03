<%-- 
    Document   : login-register
    Created on : Jan 15, 2021, 3:04:09 PM
    Author     : user
--%>

<%@page import="bean.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                                    <script>
var check = function() {
  if (document.getElementById('password').value ==
    document.getElementById('confirm_password').value) {
    document.getElementById('message').style.color = 'green';
    document.getElementById('message').innerHTML = 'matching';
  } else {
    document.getElementById('message').style.color = 'red';
    document.getElementById('message').innerHTML = 'not matching';
  }
}
</script>
  <script>
function checkPass()
{
    var pass1 = document.getElementById('password');
    var pass2 = document.getElementById('confirm_password');
    var message = document.getElementById('error-nwl');
    var goodColor = "#66cc66";
    var badColor = "#ff6666";
 	
    if(pass1.value.length > 5)
    {
       
        message.style.color = goodColor;
        message.innerHTML = "Password strenght is good!"
    }
    else
    {
       
        message.style.color = badColor;
        message.innerHTML = "Password have to be at least 6 characters"
        return;
    }
  
  
} 
 </script>
 <style>
        .center {
          margin: 0;
          position: absolute;
          
          left: 50%;
          -ms-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
        }
</style>
</head>

<body>
<div class="wrapper">
    <header class="header-area sticky-bar">
        <div class="main-header-wrap">
            <div class="container">
                <div class="row">
                    <div class="center pt-60 pb-0">
                        <div class="logo pt-0">
                            <a href="adminIndex.jsp">
                                <h1><b>Welcome to Darks</b></h1>
                            </a>
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
    <%
        User user = (User)session.getAttribute("User");
        
      
    %>

    
    <div class="login-register-area pt-80 pb-0">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 col-md-12 ml-auto mr-auto">
                    <div class="login-register-wrapper">
                        <div class="login-register-tab-list nav">
                            <a class="active" data-toggle="tab" href="#lg1">
                                <h4> login </h4>
                            </a>
                            <a data-toggle="tab" href="#lg2">
                                <h4> register </h4>
                            </a>
                        </div>
                        <div class="tab-content">
                            <div id="lg1" class="tab-pane active">
                                <div class="login-form-container">
                                    <div class="login-register-form">
                                        <form action="LoginController" method="post">
                                            <label><b>Username</b></label>
                                            <input type="text" name="userName" placeholder="Username">
                                            <label><b>Password</b></label>
                                            <input type="password" name="userPassword" placeholder="Password">
                                            <div class="button-box">
                                                <div class="login-toggle-btn">
                                                    <input type="checkbox">
                                                    <label>Remember me</label>
                                                    <a href="#">Forgot Password?</a>
                                                </div>
                                                <button type="submit">Login</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div id="lg2" class="tab-pane">
                                <div class="login-form-container">
                                    <div class="login-register-form">
                                    <form action="RegisterController" method="post">
                                        <label>Name</label>
                                       <input type="text" name="userName" placeholder="Username" required>
                                       
                                       <label>Password</label>
                                       <input type="password" name="userPassword" placeholder="Password" id="password" onblur="validate()" onkeyup='check(); checkPass(); return false; ' required>
                                           <div id="error-nwl"></div><br>
                                            
                                       <label>Confirm Password
                                           <br><span id='message'></span>
                                       </label>
                                       <input type="password" name="confirmUserPassword" placeholder="Confirm password" id="confirm_password" onblur="validate()" onkeyup='check(); checkPass(); return false; ' required>
                                        
                                        <br>
                                       <label>Gender</label>
                                       <select name="gender" >
                                           <option value="Male">Male</option>
                                           <option value="Female">Female</option> 
                                        </select><br><br>
                                        
                                        <label>Email</label>
                                       <input type="email" name="email" placeholder="Email" required>
                                       
                                       <label>Shipping Address</label>
                                        <textarea name="shippingAddress" placeholder="Shipping address" rows="4" cols="50" required></textarea><br><br>
                                       
                                       <label>Phone Number</label>
                                        <input type="tel" name="phoneNumber" placeholder="Telephone number: 012-345-6789" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" required>
                                       <div class="button-box">
                                           <button type="submit">Register</button>
                                       </div>
                                   </form>

                                    </div>
                                </div>
                            </div>
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