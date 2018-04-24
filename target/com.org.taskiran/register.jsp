<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <%

        if ((session.getAttribute("userID") != null)){
            response.sendRedirect("index.jsp");
        }

    %>

    <title>Login V2</title>
    <script type="text/javascript" src="version?n=<%=Math.random()*100 + 1%>"></script>
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
    <link rel="stylesheet" type="text/css" href="css/loader.css">
    <link rel="stylesheet" type="text/css" href="css/dialog.css">
    <link rel="stylesheet" type="text/css" href="css/register/register.css">


    <!--===============================================================================================-->
</head>
<body>
<!-- particles.js container -->
<div id="particles-js"></div>
<div id="loader" style="display: none"></div>
<div class="alert alert-success" id="alert-success" style="display: none; z-index: 500;">
   <p style="text-align: center; font-size: large;"><strong>Success!</strong> You are redirected to login page.</p>
</div>
<!-- cd-popup -->
<div class="cd-popup" role="alert">
    <!-- cd-popup-container -->
    <div class="cd-popup-container">
        <p id="popup-text">Are you sure you want to delete this element?</p>
        <ul class="cd-buttons" id="buttons">
            <li><a href="#" id="first-button">Yes</a></li>
            <li id="second-li"><a href="#" id="second-button">No</a></li>
        </ul>
        <a href="#" onclick="closePopup()" class="cd-popup-close img-replace"></a>
    </div> <!-- cd-popup-container -->
</div> <!-- cd-popup -->
<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <form class="login100-form validate-form" id="user-form" method="post" action="uploadFile" enctype="multipart/form-data">
					<span class="login100-form-title p-b-26 unselectable">
						Register
					</span>
                <span class="login100-form-title p-b-45">
					    <div class="row heading">
                            <div class="col-sm-12 col-xs-4 heading-avatar p-b-15">
                                <div class="heading-avatar-icon" id="profile-photo">
                                    <i class="zmdi zmdi-font"></i>
                                </div>
                            </div>
                        </div>
                     </span>

                <%--<div class="col-sm-8 col-xs-4 heading-avatar">--%>

                    <%--<div class="container-login100-form-btn">--%>
                        <%--<div class="wrap-login100-form-btn">--%>
                            <%--<div class="addPhoto100-form-bgbtn"></div>--%>
                            <%--<button class="login100-form-btn unselectable" type="submit">--%>
                                <%--Sign Up--%>
                            <%--</button>--%>
                        <%--</div>--%>
                    <%--</div></div>--%>


                    <div class="wrap-input100 validate-input" data-validate="Enter Full Name">
                    <input class="input100" type="text" id="fullNameRegisterInput" name="fullName">
                    <span class="focus-input100" data-placeholder="Full Name"></span>
                </div>
                <div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
                    <input class="input100" type="text" id="emailRegisterInput" name="email">
                    <span class="focus-input100" data-placeholder="Email"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Enter password">
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
                    <input class="input100" type="password" id="passwordRegisterInput" name="pass">
                    <span class="focus-input100" data-placeholder="Password"></span>
                </div>

                <%--<div class="upload-btn-wrapper">--%>
                    <%--<button class="btn">Upload a file</button>--%>
                    <%--<input type="file" id="files" name="uploadFile"/>--%>
                <%--</div>--%>
                <div class="container-login100-form-btn">
                    <div class="wrap-addPhoto100-form-btn">
                        <div class="addPhoto100-form-bgbtn"></div>
                        <label class="addPhoto100-form-btn unselectable">
                            Add Profile Photo
                            <input type="file" id="files" name="uploadFile"/>
                        </label>
                        <input type="submit" value="Upload" id="send-profile-photo" style="display:none;"/>
                    </div>
                </div>

                <div class="container-login100-form-btn p-t-60">
                    <div class="wrap-login100-form-btn">
                        <div class="login100-form-bgbtn"></div>
                        <button class="login100-form-btn unselectable" type="button" id="submit-button">
                            Sign Up
                        </button>
                    </div>
                </div>

                <div class="text-center p-t-15">
						<span class="txt1 unselectable">
							Have an account?
						</span>

                    <a class="txt2 unselectable" href="/login.jsp">
                        Log in
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
<script src="/js/register/registerFunc.js" charset="utf-8"></script>

</body>
</html>
