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
            background-color: #eee4e4;
        }

        .header {
            width: 100%;
            height: 5%;
        }

        .logo {
            margin-left: 40px;
            width: 20%;
            height: 10%;
            float: left;
            display: flex;
            margin-top: 5px;
        }

        .menu {
            width: 60%;
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
            background-color: #c4b4b4;
            width: 100%;
            height: 10%;
            border-radius: 10px 10px 0 0;
            text-align: center;
            color: white;
        }

        p.footer {
            vertical-align: middle;
        }


        .headers {
            float: right;
            margin-right: 25px;
            margin-top: 10px;
        }

        button {
            border-radius: 20px;
        }

        .register {
            height: 100%;
            width: 50%;
            margin-left: 25%;
            border-radius: 10px;
            box-shadow: 0 0 6px 5px #646e6e;
        }
    </style>
</head>
<body>
<form method="post" action="/user">
    <div class="all">
        <div class="header">
            <div class="logo">
                <i class="fa-brands fa-wordpress" style="font-size: 60px; color: #8030c9"></i>
                <h5 style="margin-top: 6px">wallet <br>manage</h5>
            </div>
            <div class="menu">
            </div>
            <div class="headers">
            </div>
        </div>
        <hr style="color: black; width: 70%; margin-left: 15%; margin-top: 35px">
        <div class="general">
            <div class="left"></div>
            <div class="content">
                <div class="register">


                    <h1 style="text-align: center">Đăng ký </h1><br>


                    <p style="margin-left: 17%">Tên đăng nhập:</p>
                    <p style="color: red;font-size: 10px;margin-left: 17%">${messageFailureUserName}</p>
                    <input type="text" name="userName"
                           style="border-radius: 10px;width: 70%; margin-left: 17%;padding-left: 10px"
                           value="${param.userName}">
                    <p style="margin-left: 17%; top: 20px">Mật khẩu :</p>
                    <p style="color: red; font-size: 10px;margin-left: 17%">Mật khẩu phải chứa ít nhất 1 chữ hoa và 1
                        số.</p>
                    <input type="password" name="password"
                           style="border-radius: 10px;width: 70%; margin-left: 17%; padding-left: 10px"
                           minlength="6" maxlength="8" required
                           pattern="^(?=.*[A-Z])(?=.*[0-9]).{6,8}$">
                    <p style="color: red;font-size: 10px;margin-left: 17%">${messageFailurePassword}</p>
                    <p style="margin-left: 17%; top: 20px">Xác nhận mật khẩu :</p>
                    <input type="password" name="confirmPassword"
                           style="border-radius: 10px;width: 70%; margin-left: 17%; padding-left: 10px">
                    <p></p>


                    <p style="margin-left: 17%; top: 20px">Email :</p>
                    <input type="text" name="email" placeholder="Email "
                           style="border-radius: 10px;width: 70%; margin-left: 17%; padding-left: 10px"
                           pattern="[^@\s]+@gmail\.com" title="Vui lòng nhập địa chỉ email có định dạng @gmail.com"
                           required value="${param.email}">
                    <p></p>


                    <input name="gender" type="hidden" value="Male">


                    <input type="hidden" name="birthdate" id="birthdate" type="hidden" value="" required>
                    <script>
                        // Lấy ngày tháng hiện tại
                        var currentDate = new Date();

                        // Định dạng ngày tháng hiện tại thành chuỗi yyyy-MM-dd
                        var formattedDate = currentDate.toISOString().slice(0, 10);

                        // Gán giá trị mặc định cho trường input
                        document.getElementById("birthdate").value = formattedDate;
                    </script>
                    <div style="display: flex;">
                        <button style="width: 100px; height: 30px;margin-left:17%; ">
                            login
                        </button>
                        <button style="width: 100px; height: 30px; margin-left:16%;" name="action" value="addUser">
                            Register
                        </button>
                    </div>

                </div>
            </div>
            <div class="right"></div>
        </div>
        <%--        <div class="footer">--%>
        <%--            <div style="padding:  15px 0 0 0">--%>
        <%--                <p style="text-align: center"> Copyright &copy; 2023 Financial Management Application</p>--%>
        <%--            </div>--%>

        <%--        </div>--%>
    </div>
</form>
</body>
</html>