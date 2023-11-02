<%--
  Created by IntelliJ IDEA.
  User: kimanh
  Date: 24/10/2023
  Time: 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
    * {
        margin: 0;
        padding: 0;
    }

    #wrapper {
        width: auto;
        margin: auto;
        position: relative; /* Added this line */
    }
    #header {
        width: 1848px;
        height: 100px;
        background-color: #1f1f1f;
    }
    #menu {
        width: 1848px;
        height: 70px;
        background-color: #18191e;
    }
    #left {
        width: 20%;
        height: 704px;
        background-color: #171b25;
        float: left;
    }
    #content {
        width: 60%;
        height: 704px;
        background-color: #030715;
        float: left;
    }
    #right {
        width: 20%;
        height: 704px;
        background-color: #030715;
        float: left;
    }
    #footer {
        width: 1848px;
        height: 70px;
        background-color:#18191e;
        clear: both;
    }
    #zing-logo {
        position: absolute;
        top: 10px; /* Adjust the top position as needed */
        left: 10px; /* Adjust the left position as needed */
        width: 40px;
        height: 40px;
    }
</style>
<head>
    <title>Zing MP3</title>
</head>
<body>
<div id="wrapper">
    <div id="header"></div>
    <div id="menu"></div>
    <div id="left"></div>
    <div id="content"></div>
    <div id="right"></div>
    <div id="footer"></div>
    <img src="ZingMP3logo.svg.png" id="zing-logo">
</div>

<%--// Nút thay đổi mật khẩu // --%>
<%--<form action="/login" method="post">--%>
<%--    <button value="formChangePassword" name="action" >Change Password</button>--%>
<%--</form>--%>
</body>
</html>
