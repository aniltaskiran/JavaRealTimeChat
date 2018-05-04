<%--
  Created by IntelliJ IDEA.
  User: kev
  Date: 8.04.2018
  Time: 23:22
  To change this template use File | Settings | File Templates.
--%>
<%
    session.invalidate();

    for (Cookie cookie : request.getCookies()) {
        cookie.setValue("");
        cookie.setMaxAge(0);
        cookie.setPath("/");

        response.addCookie(cookie);
    }
    response.sendRedirect("login.jsp");
%>