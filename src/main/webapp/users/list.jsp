<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/9b0347940d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {



            background-image: url("/users/notepad-3316267_1280.jpg");
        }

        .header {
            height: 80px;
        }

        .header1 {

            width: 100px;
            height: 60px;
        }

        .content {
            background-color: #e1d3d3;
            opacity: 0.7;
            max-width: 600px;
            margin-left: 300px;
            margin-top: 30px;
            height: 800px;
            border-radius: 20px 10px;

        }

        .content1 {
            color: black;
            text-align: center;
            padding: 30px 0 20px;


        }

        #password {
            width: 300px;
            height: 50px;

        }

        #username {
            width: 300px;
            height: 50px;

        }

        .content2 {
            text-align: center;
            margin: 50px;
        }
        button{
            border-radius: 10px 10px;
            color: #318a18;
        }


        p {
            display: flex;
            margin-left: 100px;
            color: #bb4fbb;
        }

        .footer {
            border: 1px solid #318a18;
            text-align: right;
            height: 80px;
            background-color: white;
            padding: 20px 0 20px;

        }

    </style>
</head>
<body>
<div class="root">
    <div class="header">
        <div class="header1">
            <i class="fa-brands fa-cc-visa" style="font-size: 90px; color: springgreen"></i>
        </div>
    </div>
    <div class="content">
        <div class="content1">
            <b><h1>Đăng nhập</h1></b>
        </div>
        <div class="content2" style="color: aliceblue">
            <form action="/user" method="post">
                <p>Tên đăng nhâp :</p>
                <input type="text" name="userName" placeholder="UserName" id="username"
                       style="border-radius: 10px 10px"><br><br>
                <p>Mật khẩu :</p>
                <input type="password" name="password" placeholder="Password" id="password"
                       style="border-radius: 10px 10px"><br><br>
                <p style="margin-left: 180px ; color: red" >${message}</p>
                <button name="action" value="login">Đăng nhập</button>
            </form>

        </div>
        <div class="content3" style="text-align: center">
            <a href=""> Quyên mật khẩu ?</a><br>
            <hr style="color: springgreen">
            <b style="color: #7e8585"> Chưa có tài khoản<a href="/users/Register.jsp">ĐĂNG KÍ</a></b>
        </div>
    </div>
    <div class="footer">
        <h6> Hotline :0848123085 <i class="fa-solid fa-phone"></i></h6>
    </div>
</div>
</body>
</html>
