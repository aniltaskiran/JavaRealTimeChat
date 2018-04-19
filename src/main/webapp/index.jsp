<%@ page import="java.util.ArrayList" %>
<%@ page import="manager.DBConnection" %>
<%@ page import="model.ReturnUser" %>
<%@ page import="model.ReturnHashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: kev
  Date: 8.04.2018
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String userName = "";
    userName = (String) session.getAttribute("userFullName");
    String userID = (String) session.getAttribute("userID");
    if (userName == null){
        userName = "";
    }

if ((session.getAttribute("userID") == null) || (session.getAttribute("userID") == "")) {
        response.sendRedirect("/login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
    <title>Chat</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/css/index/index.css">
    <script src="jquery-3.3.1.min.js"></script>
</head>
<body>
<p id="userID" style="display: none"><%=userID%></p>
<div class="container app">
    <div class="row app-one">
        <div class="col-sm-4 side">
            <div class="side-one">
                <div class="row heading">
                    <div class="col-sm-3 col-xs-3 heading-avatar">
                        <div class="heading-avatar-icon">
                            <img src="/images/profilePhoto.jpg">
                        </div>
                    </div>
                    <div class="col-sm-1 col-xs-1  heading-dot  pull-right">
                        <i class="fa fa-ellipsis-v fa-2x  pull-right" aria-hidden="true" onclick="signOut()"></i>
                    </div>
                    <div class="col-sm-2 col-xs-3 heading-name">
                        <a class="heading-name-meta" id="username"><%=userName%>
                        </a>
                        <span class="heading-online">Online</span>
                    </div>
                </div>
                <div class="row sideBar" id="sideBar">
                    <%
                        DBConnection dao = new DBConnection();
                        ReturnHashMap values = dao.getOnlineUsers();

                        Iterator it = values.getiDToName().entrySet().iterator();
                        while (it.hasNext()) {
                            Map.Entry pair = (Map.Entry)it.next();
                            if (pair.getKey() != userID){
                    %>
                    <div class="row sideBar-body">
                        <div class="col-sm-3 col-xs-3 sideBar-avatar">
                            <div class="avatar-icon">
                                <img src="/images/turkHack.jpg">
                            </div>
                        </div>
                        <div class="col-sm-9 col-xs-9 sideBar-main">
                            <div class="row">
                                <div class="col-sm-8 col-xs-8 sideBar-name">
                  <span class="name-meta">

                      <%=pair.getValue()%>

                </span>
                                </div>
                                <div class="col-sm-4 col-xs-4 pull-right sideBar-time">
                  <span class="time-meta pull-right"><%=values.getIdToLoginTime().get(pair.getKey())%>
                </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                            it.remove(); // avoids a ConcurrentModificationException
                        }

                        }
                    %>

                </div>
            </div>
        </div>

        <div class="col-sm-8 conversation">
            <div class="row heading">
                <div class="col-sm-2 col-md-1 col-xs-3 heading-avatar">
                    <div class="heading-avatar-icon">
                        <img src="/images/roomPhoto.jpg">
                    </div>
                </div>
                <div class="col-sm-8 col-xs-7 heading-name">
                    <a class="heading-name-meta">Global Nerd Herd
                    </a>
                    <span class="heading-online">Online</span>
                </div>
                <div class="col-sm-1 col-xs-1  heading-dot pull-right">
                    <i class="fa fa-ellipsis-v fa-2x  pull-right" aria-hidden="true" onclick="clearHistory()"></i>
                </div>
            </div>

            <div class="row message" id="conversation">
            </div>
                <div class="row reply">
                    <div class="col-sm-1 col-xs-1 reply-emojis">
                        <i class="fa fa-smile-o fa-2x"></i>
                    </div>
                    <div class="col-sm-9 col-xs-9 reply-main">
                        <textarea class="form-control" rows="1" id="comment"></textarea>
                    </div>
                    <div class="col-sm-1 col-xs-1 reply-send pull-right">
                        <i class="fa fa-send fa-2x" aria-hidden="true" onclick="send()"></i>
                    </div>
                </div>
        </div>
    </div>
</div>
<script src="/js/index/index.js" charset="utf-8"></script>
</body>
</html>
