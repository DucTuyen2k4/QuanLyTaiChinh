<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/9b0347940d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-image: url("/users/hình-nền-ấn-tượng.jpg");
        }

        .header {
            width: 100%;
            height: 15%;
        }

        .logo {
            margin-left: 40px;
            width: 20%;
            height: 10%;
            float: left;
        }

        .menu {
            width: 60%;
            height: 10%;
            float: left;
        }

        .menu1 {
            margin-left: 10%;
            display: flex;
            margin-top: 40px;


        }

        .general {
            height: 75%;
        }

        .left {
            float: left;
            width: 20%;
            height: 100%;
        }

        .content {
            float: left;
            width: 60%;
            height: 100%;

        }

        .right {
            float: left;
            width: 20%;
            height: 100%;
        }

        .footer {
            background-color: #7a7474;
            width: 100%;
            height: 10%;
            border-radius: 10px 10px 0 0;
            text-align: center;
            color: white;
        }
        p.footer{
            vertical-align: middle;
        }


        .headers {
            float: right;
            margin-right: 25px;
            margin-top: 25px;
        }

        button {
            border-radius: 20px;
        }


        li.dropdown {
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            min-width: 80px;
            z-index: 1;
            border-radius: 10px;
        }

        .dropdown-content a {
            color: #dccfcf;
            background-color: #8030c9;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: center;
        }

        .dropdown-content a:hover {
            background-color: #9d9292;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }
        .dropdown-content{
            overflow: auto;
            width: 100px;
            height: 100px;
        }


    </style>
</head>
<body>
<div class="all">
    <div class="header">
        <div class="logo">
            <i class="fa-brands fa-wordpress" style="font-size: 100px; color: #8030c9"></i>
        </div>
        <div class="menu">
            <div class="menu1">
                <div>
                    <a href="" style="color: #ffffff ; text-decoration: none; ">Home</a>
                </div>
                <div class="w" style="margin-left: 20px">
                    <ul>
                        <li class="dropdown">
                            <a href="#" class="dropbtn" style="color: #ffffff ; text-decoration: none">Wallet </a>
                            <div class="dropdown-content">
                                <a href="#" style=""> a</a>
                                <a href="#"> b</a>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="Category" style="margin-left: 20px">
                    <ul>
                        <li class="dropdown">
                            <a href="#" class="dropbtn" style="color: #ffffff ; text-decoration: none">Category </a>
                            <div class="dropdown-content">
                                <a href="#"> a</a>
                                <a href="#"> b</a>
                                <a href="#"> b</a>
                                <a href="#"> b</a>
                                <a href="#"> b</a>
                                <a href="#"> b</a>
                                <a href="#"> b</a>

                            </div>
                        </li>
                    </ul>
                </div>
                <div>
                    <a href="" style="margin-left: 40px; color: #ffffff; text-decoration: none">History</a>
                </div>
                <div>
                    <a href="" style="margin-left: 40px; color: #ffffff ; text-decoration: none">Bank</a>
                </div>
                <div>
                    <a href="" style="margin-left: 40px; color: #ffffff ; text-decoration: none">Spending</a>
                </div>
            </div>
        </div>
        <div class="headers">
            <button class="no-border login-button" style="width: 90px; height: 35px;  background-color: lightpink">
                <a href="/users/Register.jsp" style=" text-decoration: none;color: #8030c9">Register</a></button>
            <button class="no-border login-button" style="width: 90px; height: 35px; ; background-color: lightpink">
                <a href="/users/Register.jsp" style=" text-decoration: none; color: #8030c9">Login</a></button>
        </div>
    </div>

    <div class="general">
        <div class="left">left</div>
        <div class="content">

           dsadsa
        </div>
        <div class="right">right</div>
    </div>
    <div class="footer">
        <div style="padding:  15px 0 0 0">
            <p style="text-align: center"> Copyright &copy; 2023 Financial Management Application</p>
        </div>

    </div>
</div>
</body>
</html>
