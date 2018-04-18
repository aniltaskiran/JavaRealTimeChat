<%--
  Created by IntelliJ IDEA.
  User: kev
  Date: 8.04.2018
  Time: 23:22
  To change this template use File | Settings | File Templates.
--%>
<%
    session.setAttribute("userID", null);
    session.setAttribute("userName", null);
    session.invalidate();
    response.sendRedirect("login.jsp");
%>