<!DOCTYPE html>
<html lang="en">
<head>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/login.css" />

    <link rel="canonical" href="/index.html" />

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="author" content="Anil Taskiran" />
    <meta name="copyright" content="Anil Taskiran" />
    <meta name="description" content="Real Time Chat" />
    <meta name="keywords" content="WebSocket, Webchat, Chat, Websockets, Sockets" />

    <title>Real Time Chat Login Page</title>

    <!-- Apple & Icons -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <!--
            <link rel="apple-touch-startup-image" href="/img/startup.png">
            <link rel="shortcut icon" href="/img/Icon-Small-60.png">
            <link rel="apple-touch-icon" href="/img/Icon-Small-60.png">
            <link rel="apple-touch-icon" sizes="76x76" href="/img/Icon-76.png">
            <link rel="apple-touch-icon" sizes="120x120" href="/img/Icon-60@2x.png">
            <link rel="apple-touch-icon" sizes="152x152" href="/img/Icon-76@2x.png">
            <link rel="apple-touch-icon" sizes="167x167" href="/img/Icon-83.5@2x.png">
            <link rel="apple-touch-icon" sizes="180x180" href="/img/Icon-60@3x.png">
    -->

    <!--[if gte IE 9]>
    <style type="text/css">
        .gradient {
            filter: none;
        }
    </style>
    <![endif]-->

</head>

<body>

<div id="main">
    <div id="content">
        <div class="container">
            <div class="row">
                <div class="col-xs-10 col-xs-offset-1 col-md-6 col-md-offset-3">
                    <div class="form-window">
                        <form>
                            <div class="form-group">
                                <label for="firstNameRegisterInput">First Name</label>
                                <input type="text" name="firstName" class="form-control" id="firstNameRegisterInput" placeholder="First Name" required>
                            </div>
                            <div class="form-group">
                                <label for="lastNameRegisterInput">Last Name</label>
                                <input type="text" name="lastName" class="form-control" id="lastNameRegisterInput" placeholder="Last Name" required>
                            </div>
                            <div class="form-group">
                                <label for="usernameRegisterInput">Username</label>
                                <input type="text" name="username" class="form-control" id="usernameRegisterInput" placeholder="Username" required>
                            </div>
                            <div class="form-group">
                                <label for="passwordRegisterInput">Password</label>
                                <input type="password" name="password" class="form-control" id="passwordRegisterInput" placeholder="Password" required>
                            </div>
                            <div class="form-group">
                            <label for="emailRegisterInput">Email</label>
                            <input type="text" name="email" class="form-control" id="emailRegisterInput" placeholder="Email" required>
                            </div>
                            <input id="login" class="btn btn-primary pull-left" type="button" value="Already registered. Login Here"/>
                            <button id = "register" type="submit" class="btn btn-primary pull-right">Register</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<footer>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="/js/register.js" charset="utf-8"></script>

    <script type="text/javascript">

        $(document).ready(function() {
            $("img").addClass("img-responsive");
        });

    </script>
</footer>
</body>
</html>
