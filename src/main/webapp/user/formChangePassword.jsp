<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 11/1/2023
  Time: 4:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>[------------------------]</title>
</head>
<style>
    body {
        height: 1200px;
        margin: 0;
        padding: 0;

        /*overflow: hidden;*/
    }

    header {

        width: 100%;
        height: 78px;


    }

    header .left-pane {
        float: left;
        width: 10%;
        height: 100%;
        background-image: url("https://i.pinimg.com/564x/81/93/33/819333bd2b8d3284385017549dafc84e.jpg");
        background-size: 100% 100%; /* Điều chỉnh kích thước hình ảnh để nó vừa với phần tử */
    }

    header .middle-pane {
        float: left;
        width: 80%;
        height: 100%;
        background-color: #819759;
        font-family: "Arial Black";
        font-size: 30px;
        text-align: center;
        vertical-align: center;
        align-items: center;
    }


    header .right-pane {
        float: left;
        width: 10%;
        height: 100%;
        background-color: #819759;
    }

    /*thanh chức năng*/
    /*nav {*/
    /*    display: flex;*/
    /*    justify-content: space-between; !* Các mục sẽ cách nhau cùng 1 dòng *!*/

    /*    width: 100%;*/
    /*    height: 6.5%;*/

    /*}*/
    nav div {
        display: flex;
        width: 25%;
        height: 100%;
        align-items: center;
        justify-content: center;
    }

    /*giao diện*/
    main {

        width: 100%;
        height: 100%;
    }

    /*!* giao diện ở trái *!*/
    /*main .left-pane {*/
    /*    width: 35%; !* Chiếm 25% chiều rộng *!*/
    /*    float: left;*/
    /*    height: 100%;*/


    /*}*/

    /* giao diện ở giữa */
    main .middle-pane {
        border-radius: 20px 20px;
        margin-top: 120px;

        width: 30%; /* Chiếm 50% chiều rộng */
        text-align: center;
        margin-left: 35%;
        height: 85%;
        /*background-color: #f0f0f0;*/
        text-align: center;
        border: 1px solid #4e5647;
        background-color: #FFFFFF;
    }
    .register-button {
        background-color: #45a049;
        color: #ffffff;
        border: none;
        padding: 10px 20px;
        border-radius: 15px;
        margin-top: 10px;
    }

    .login-button {
        margin-left: 50px;
        background-color: transparent;
        color: #ffffff;
        border: none;
        padding: 10px 20px;
        border-radius: 15px;
        margin-top: 10px;

    }

    .function-text .no-border {
        margin-top: 30px;
        background-color: #1d1e1c;
        width: 70px;
        height: 40px;
        border-radius: 10%;
    }

    .centered-text {
        text-align: center; /* Căn giữa theo chiều ngang */

    }

    .centered-text .no-border {
        border: 1px solid #333431;
        height: 30px;
        width: 120%;
        border-radius: 10px 10px;
        margin-left: -20px;
    }
    h5{
        margin-left: -20px;
    }

    .centered-text {
        display: inline-block;
        width: 50%;
    }
    .function-text {

        text-align: center;
    }

    .function-text .no-border {
        background-color: #45a049;
        text-align: center;
        border-radius: 15px 15px;
    }

    /* giao diện ở phải */
    main .right-pane {
        width: 35%; /* Chiếm 25% chiều rộng */
        float: left;
        height: 100%;


    }


    /*form {*/
    /*    !*border: 1px solid #4e5647;*!*/
    /*    background-color: #f0f0f0;*/
    /*    width: 100%;*/
    /*    height: 20%;*/

    /*}*/

</style>
<body>
<header>
    <div class="left-pane"></div>
    <div class="middle-pane">Budget</div>
    <div class="right-pane"></div>
</header>


<%--thanh chức năng--%>
<nav>
</nav>

<%--giao diện--%>
<main>

    <form action="/user" method="post">

        <div class="middle-pane">
            <div class="back-button" style="float: left;margin-left: 10px">
                <a href="/user?action=update&id=${sessionScope['user'].getId()}"><i class="fas fa-arrow-left"></i>  Quay lại </a>
            </div>
            <H1 style="text-align: center">Đổi mk</H1>
            <div class="centered-text">
                <div class="form-group">
                    <input type="hidden" name="id" value="${id}" />
                    <h5 style="float: left" for="current-password" style="width: 480px">Mật khẩu hiện tại:</h5>
                    <p style="color: red">${message}</p>
                    <input class="no-border " type="password" id="current-password"  name="oldPassword" required>
                </div>
                <div class="form-group">
                    <h5 style="float: left" for="new-password">Mật khẩu mới(6-8 kí tự):</h5>
                    <input class="no-border " type="password" id="new-password" name="newPassword" minlength="6" maxlength="8" required>
                </div>

                <div class="form-group">
                    <h5 style="float: left" for="confirm-password" >Xác nhận mật khẩu mới:</h5>
                    <p style="color: red">${messages}</p>
                    <input class="no-border " type="password" id="confirm-password"  name="confirmPassword" minlength="6" maxlength="8" required>
                </div>
                <button style="margin-top: 30px;width: 90px" class="no-border " type="submit" name="action" value="confirmPassword" class="btn-submit" >Đổi mật khẩu</button>
            </div>
            <%--        <hr style="background-color: #4CAF50">--%>


        </div>
    </form>
</main>
<%--<form>--%>
<%--</form>--%>
</body>
</html>