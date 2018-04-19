<%--
  Created by IntelliJ IDEA.
  User: kev
  Date: 8.04.2018
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    if ((session.getAttribute("userID") == null) || (session.getAttribute("userID") == "")) {
        response.sendRedirect("login.jsp");
}
%>
