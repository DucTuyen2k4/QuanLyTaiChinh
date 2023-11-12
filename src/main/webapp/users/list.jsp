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
        width: 70%;
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
        width: 20%;
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
        width: 15%;
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
        margin-left: 20px;
        background-color: #45a049;
        color: #ffffff;
        border: none;
        padding: 10px 20px;
        border-radius: 15px;
        margin-top: 10px;
    }

    .login-button {

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

    h5 {
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



    }



</style>
<body>
<header>
    <div class="left-pane"></div>
    <div class="middle-pane">
        <div style="margin-left: 150px">Quản lí ngân sách</div>
    </div>
    <div class="right-pane">
        <form>
            <div class="function-text">
                <button><a href="/users/Register.jsp">Đăng kí</a></button>

                <button class="no-border login-button" style="width: 90px; height: 35px;">
                    <a href="/users/list.jsp" style="color: #ffffff; text-decoration: none"> Đăng nhập</a></button>
            </div>
        </form>
    </div>
</header>


<main>
    <form action="/user" method="post">
        <div class="middle-pane">
            <H1 style="text-align: center">Đăng nhập</H1>
            <div class="centered-text">
                <h5 style="float: left">Tên đăng nhập :</h5>
                <input class="no-border " type="text" name="userName" placeholder="Tên đăng nhập" id="username"
                       style="border-radius: 10px 10px"><br><br>
                <h5 style="float: left">Mật khẩu :</h5>
                <input class="no-border " type="password" name="password" placeholder="Mật khẩu" id="password"
                       style="border-radius: 10px 10px"><br><br>
                <p style="margin-left: 180px ; color: red">${message}</p>
            </div>
            <div class="function-text">
                <button style="margin-left: 5px" class="register-button" name="action" value="login">Đăng nhập</button>
            </div>
        </div>
    </form>
</main>
</body>
</html>
