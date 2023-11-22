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
            background-color: #ffffff;
            background-image: url('https://c.wallhere.com/photos/da/b2/digital_art_artwork_illustration_sky_clouds_minimalism_blue_nature-2285538.jpg!d');
            background-size: cover; /* Ensures the background image covers the entire body */
            background-repeat: no-repeat; /* Prevents the background image from repeating */
        }

        .header {
            width: 100%;
            text-align: center;
            height: 5%;
        }

        /*.logo {*/
        /*    margin-left: 40px;*/
        /*    width: 20%;*/
        /*    height: 10%;*/
        /*    float: left;*/
        /*    display: flex;*/
        /*    margin-top: 5px;*/
        /*}*/

        .menu {
            width: 100%;
            height: 10%;
            float: left;
        }


        .general {
            height: 80%;
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
            background-color: #ffffff;
            width: 100%;
            height: 10%;
            /*border-radius: 10px 10px 0 0;*/
            text-align: center;
            color: white;
        }

        p.footer {
            vertical-align: middle;
        }


        /*.headers {*/
        /*    float: right;*/
        /*    margin-right: 25px;*/
        /*    margin-top: 10px;*/
        /*}*/

        button {
            border-radius: 5px;
        }

        .register {
            margin-top: 50px;
            height: 65%;
            width: 50%;
            margin-left: 25%;
            border-radius: 1px;
            box-shadow: 0 0 1px 1px rgba(197, 190, 190, 0.69);
            background: rgba(255, 255, 255, 0.8); /* Sử dụng rgba để thiết lập màu nền với độ mờ */
        }
    </style>
</head>
<body>
<div class="all">
    <div class="header">


                           <span style="display: inline-block;margin-top: 20px;text-align: center
">
                   <i class="fa-brands fa-wordpress" style="font-size: 30px; color: #8030c9;"></i>
                   <h5 style="margin-top: 6px; display: inline-block;font-size: 30px;font-weight: bold;">Quản lý tài chính</h5>
                </span>


    </div>

    <div class="general">
        <div class="left"></div>
        <div class="content">
            <div class="register">
                <form action="/user" method="post">
                    <div class="login">
                        <h4 style="text-align: center;padding-top: 30px;margin-top: 20px;border-top-color: #f0f0f0 ">
                            Đăng nhập
                            tài khoản</h4>
                        <%--                    <p style="margin-left: 17%">Username :</p>--%>
                        <input type="text" name="userName" placeholder="Tên đăng nhập :"
                               style="border-radius: 10px;width: 70%; margin-left: 17%;padding-left: 10px;height: 35px;margin-top: 30px">

                        <%--                    <p style="margin-left: 17%; top: 20px">Password :</p>--%>
                        <input type="password" name="password" placeholder="Mật khẩu :"
                               style="border-radius: 10px;width: 70%; margin-left: 17%;padding-left: 10px;height: 35px;margin-top: 30px">
                        <p style="margin-left: 30% ; color: red">${message}</p>
                        <br>

                            <button style="width: 69.5%; height: 30px; margin-left:17%;margin-top: 20px;background-color: #8030c9;color: #ffffff"
                                    name="action" value="login">
                                Đăng nhập
                            </button>

                        <p style="width: 250px; height: 30px;margin-left:17%;margin-top: 20px   ">
                            Bạn chưa có tài khoản ? <a href="/users/Register.jsp" style="text-decoration: none;color: #000000">Đăng ký</a></p>

                    </div>
                </form>
            </div>
        </div>
        <div class="right"></div>
    </div>
</div>
</body>
</html>