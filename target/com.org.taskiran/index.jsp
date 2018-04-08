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
} else {
%>
<%--Welcome <%=session.getAttribute("userID")%>--%>
<%--<a href='logout.jsp'>Log out</a>--%>
<%
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Chat</title>
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.css">
</head>
<body>
<div class="main-section">
    <div class="head-section">
        <div class="headLeft-section">
            <div class="headLeft-sub">
                <label><%=session.getAttribute("userName")%></label>
                <button onclick="signOut()"><i class="fa fa-sign-out"></i></button>
            </div>
        </div>
        <div class="headRight-section">
            <div class="headRight-sub">
                <h3>Lajy Ion</h3>
                <small>Lorem ipsum dolor sit amet...</small>
            </div>
        </div>
    </div>
    <div class="body-section">
        <div class="left-section mCustomScrollbar" data-mcs-theme="minimal-dark">
            <ul>
                <li>
                    <div class="chatList">
                        <div class="img">
                            <i class="fa fa-circle"></i>
                            <img src="images/man01.png">
                        </div>
                        <div class="desc">
                            <small class="time">05:30 am</small>
                            <h5>Luis Yankee</h5>
                            <small>Lorem ipsum dolor sit amet...</small>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="chatList">
                        <div class="img">
                            <i class="fa fa-circle"></i>
                            <img src="images/man02.png">
                        </div>
                        <div class="desc">
                            <small class="time">3 day</small>
                            <h5>Joi Chak</h5>
                            <small>Lorem ipsum dolor sit amet...</small>
                        </div>
                    </div>
                </li>
                <li class="active">
                    <div class="chatList">
                        <div class="img">
                            <img src="images/man03.png">
                        </div>
                        <div class="desc">
                            <small class="time">4 day</small>
                            <h5>Lajy Ion</h5>
                            <small>Lorem ipsum dolor sit amet...</small>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="chatList">
                        <div class="img">
                            <img src="images/man04.png">
                        </div>
                        <div class="desc">
                            <small class="time">18 day</small>
                            <h5>Lod Kine</h5>
                            <small>Lorem ipsum dolor sit amet...</small>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="chatList">
                        <div class="img">
                            <i class="fa fa-circle"></i>
                            <img src="images/man01.png">
                        </div>
                        <div class="desc">
                            <small class="time">11:50 am</small>
                            <h5>Nik Minaj</h5>
                            <small>Lorem ipsum dolor sit amet...</small>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="chatList">
                        <div class="img">
                            <img src="images/man02.png">
                        </div>
                        <div class="desc">
                            <small class="time">20 day</small>
                            <h5>Win Sina</h5>
                            <small>Lorem ipsum dolor sit amet...</small>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="chatList">
                        <div class="img">
                            <img src="images/man03.png">
                        </div>
                        <div class="desc">
                            <small class="time">18 day</small>
                            <h5>Jack Clerk</h5>
                            <small>Lorem ipsum dolor sit amet...</small>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="chatList">
                        <div class="img">
                            <img src="images/man02.png">
                        </div>
                        <div class="desc">
                            <small class="time">20 day</small>
                            <h5>Win Sina</h5>
                            <small>Lorem ipsum dolor sit amet...</small>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="chatList">
                        <div class="img">
                            <img src="images/man03.png">
                        </div>
                        <div class="desc">
                            <small class="time">18 day</small>
                            <h5>Jack Clerk</h5>
                            <small>Lorem ipsum dolor sit amet...</small>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="right-section">
            <div class="message mCustomScrollbar" data-mcs-theme="minimal-dark">
                <ul>
                    <li class="msg-left">
                        <div class="msg-left-sub">
                            <img src="images/man03.png">
                            <div class="msg-desc">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                tempor incididunt ut labore et dolore magna aliqua.
                            </div>
                            <small>05:25 am</small>
                        </div>
                    </li>
                    <li class="msg-right">
                        <div class="msg-left-sub">
                            <img src="images/man04.png">
                            <div class="msg-desc">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                tempor incididunt ut labore et dolore magna aliqua.
                            </div>
                            <small>05:25 am</small>
                        </div>
                    </li>
                    <li class="msg-day"><small>Wednesday</small></li>
                    <li class="msg-left">
                        <div class="msg-left-sub">
                            <img src="images/man03.png">
                            <div class="msg-desc">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit
                            </div>
                            <small>05:25 am</small>
                        </div>
                    </li>
                    <li class="msg-right">
                        <div class="msg-left-sub">
                            <img src="images/man04.png">
                            <div class="msg-desc">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                tempor incididunt ut labore et dolore magna aliqua.
                            </div>
                            <small>05:25 am</small>
                        </div>
                    </li>
                    <li class="msg-left">
                        <div class="msg-left-sub">
                            <img src="images/man03.png">
                            <div class="msg-desc">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit
                            </div>
                            <small>05:25 am</small>
                        </div>
                    </li>
                    <li class="msg-right">
                        <div class="msg-left-sub">
                            <img src="images/man04.png">
                            <div class="msg-desc">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                tempor incididunt ut labore et dolore magna aliqua.
                            </div>
                            <small>05:25 am</small>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="right-section-bottom">
                <form>
                    <div class="upload-btn">
                        <button class="btn"><i class="fa fa-photo"></i></button>
                        <input type="file" name="myfile" />
                    </div>
                    <input type="text" name="" placeholder="type here...">
                    <button class="btn-send"><i class="fa fa-send"></i></button>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="/js/functions.js" charset="utf-8"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<!-- custom scrollbar plugin -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
</body>
</html>
