<%@ include file="/includes/header.html" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<link rel="stylesheet" href="css/login.css" />

</head>
<body>
<%
    Boolean result = (Boolean) request.getAttribute("result");
    String userID = (String) request.getAttribute("userID");
    String userName = (String) request.getAttribute("userName");

   String message = "";
    if(result != null){
        if (result){
            session.setAttribute("userID", userID);
            session.setAttribute("userName",userName);
            response.sendRedirect("index.jsp");
        } else {
            message = "hatalı giriş";

        }
    }
%>
<h1><%=message%></h1>
<div id="main">
    <div id="content">
        <div class="container">
            <div class="row">
                <div class="col-xs-10 col-xs-offset-1 col-md-6 col-md-offset-3">
                    <div class="form-window">
                        <form method="post" action="/login">
                            <div class="form-group">
                                <label for="usernameInput">Username</label>
                                <input type="text" name="username" class="form-control" id="usernameInput" placeholder="Username" required>
                            </div>
                            <div class="form-group">
                                <label for="passwordInput">Password</label>
                                <input type="password" name="password" class="form-control" id="passwordInput" placeholder="Password" required>
                            </div>
                            <input id="registerButton" class="btn btn-primary pull-left" type="button" value="Register"/>
                            <button id = "login" type="submit" class="btn btn-primary pull-right">Login</button>
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
    <script src="/js/functions.js" charset="utf-8"></script>

    <script type="text/javascript">

        $(document).ready(function() {
            $("img").addClass("img-responsive");
        });

    </script>
</footer>
</body>
</html>
