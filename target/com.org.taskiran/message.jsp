<%--
  Created by IntelliJ IDEA.
  User: kev
  Date: 22.04.2018
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%
        String message = (String) session.getAttribute("message");
        if (message == null){
            message = "";
        }
    %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Upload Result</title>
</head>
<body>
    <h2><%=message%></h2>
</body>
</html>