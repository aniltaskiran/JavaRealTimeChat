<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <%
        String email = "";
        if ((session.getAttribute("userID") != null)){
            response.sendRedirect("index.jsp");
        }  else {

            Boolean result = (Boolean) request.getAttribute("result");
            String userID = (String) request.getAttribute("userID");
            String userFullName = (String) request.getAttribute("userFullName");
            email = (String) request.getAttribute("email");
            if (email == null){
                email = "";
            }
            if(result != null){
                if (result){
                    session.setAttribute("userID", userID);
                    session.setAttribute("userFullName",userFullName);
                    session.setAttribute("email",email);
                    response.sendRedirect("index.jsp");
                } else {
                    %>
                    <div class="alert alert-danger">
                        <p style="text-align: center; font-size: large;"><strong>Warning!</strong> Your mail or password is wrong.</p>
</div>
    <%
                }
            }
        }

    %>
    <title>Login</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="css/login/util.css">
    <link rel="stylesheet" type="text/css" href="css/login/main.css">
    <link rel="stylesheet" type="text/css" href="css/login/style.css">
    <link rel="stylesheet" type="text/css" href="css/register/register.css">

    <!--===============================================================================================-->
</head>
<body>
<!-- particles.js container -->
<div id="particles-js"></div>
<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <form class="login100-form validate-form" method="post" action="/login">
					<span class="login100-form-title p-b-26 unselectable" id="welcome-title">
						Welcome
					</span>

                <span class="login100-form-title p-b-48">
                    <div class="heading-avatar-icon" id="profile-photo">
                        <i class="zmdi zmdi-font"></i>
                    </div>
                </span>

                <div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
                    <input class="input100" type="text" id="email" name="email" autocomplete="email">
                    <span class="focus-input100" data-placeholder="Email"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Enter password">
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
                    <input class="input100" type="password" oninput="getProfilePhoto()" name="pass" autocomplete="current_password">
                    <span class="focus-input100" data-placeholder="Password"></span>
                </div>

                <div class="container-login100-form-btn p-t-113">
                    <div class="wrap-login100-form-btn">
                        <div class="login100-form-bgbtn"></div>
                        <button class="login100-form-btn unselectable">
                            Login
                        </button>
                    </div>
                </div>

                <div class="text-center p-t-15">
						<span class="txt1 unselectable">
							Don’t have an account?
						</span>

                    <a class="txt2 unselectable" href="/register.jsp" style="z-index: 2">
                        Sign Up
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>


<div id="dropDownSelect1"></div>

<!--===============================================================================================-->
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/bootstrap/js/popper.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/daterangepicker/moment.min.js"></script>
<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="js/login/main.js"></script>
<!--===============================================================================================-->
<script src="../particles.js"></script>
<script src="js/coolBackgroundParticles.js"></script>

</body>
</html>
