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
            height: 90%;
            width: 50%;
            margin-left: 25%;
            border-radius: 1px;
            box-shadow: 0 0 1px 1px rgba(197, 190, 190, 0.69);
            background: rgba(255, 255, 255, 0.8); /* Sử dụng rgba để thiết lập màu nền với độ mờ */
        }
    </style>
</head>
<body>
<form method="post" action="/user">
    <div class="all">
        <div class="header">


            <%--                           <span style="display: inline-block;margin-top: 20px;">--%>
            <%--                   <i class="fa-brands fa-wordpress" style="font-size: 30px; color: #8030c9;"></i>--%>
            <%--                   <h5 style="margin-top: 6px; display: inline-block;font-size: 30px;font-weight: bold;">Quản lý tài chính</h5>--%>
            <%--                </span>--%>


        </div>

        <div class="general">
            <div class="left"></div>
            <div class="content">
                <div class="register">


                    <h4 style="text-align: center;padding-top: 30px;margin-top: 20px;border-top-color: #f0f0f0 ">Chỉnh
                        sửa
                        tài khoản</h4>


                    <%--                    <p style="margin-left: 17%;margin-top: 30px" >Tên đăng nhập:</p>--%>
                    <label for="fullname">Họ và tên ::</label>
                    <input type="text" id="fullname" name="fullName"
                           style="border-radius: 10px;width: 70%; margin-left: 17%;padding-left: 10px;height: 35px;margin-top: 30px"
                           value="${sessionScope['user'].getFullName()}">
                    <label for="birthdate">Ngày sinh:</label>
                    <input type="date" id="birthdate" name="birthdate" placeholder="Ngày sinh :"
                           style="border-radius: 10px;width: 70%; margin-left: 17%; padding-left: 10px;height: 35px;margin-top: 35px"
                           minlength="6" maxlength="8" required
                           pattern="^(?=.*[A-Z])(?=.*[0-9]).{6,8}$"
                           value="${sessionScope['user'].getBirthdate()}">
                    <p style="color: red;font-size: 10px;margin-left: 17%;margin-top: 35px">${messageFailurePassword}</p>
                    <label for="phoneNumber">Số điện thoại:</label>
                    <input type="tel"
                           style="border-radius: 10px;width: 70%; margin-left: 17%; padding-left: 10px;height: 35px;margin-top: 35px"
                           id="phoneNumber" name="phoneNumber" value="${sessionScope['user'].getPhoneNumber()}"
                           required>
                    <label for="image">Chọn ảnh đại diện:</label>
                    <input type="file" id="image" name="image" accept="image/*" value="${sessionScope['user'].getImage()}" required>


                    <label for="gender" style="margin-left: 78px">Giới tính:</label>
                    <select id="gender" name="gender">
                        <option value="${sessionScope['user'].getGender()}">${sessionScope['user'].getGender()}</option>
                        <option value="male">Nam</option>
                        <option value="female">Nữ</option>
                        <option value="other">Khác</option>
                    </select>


                    <input type="hidden" name="id" value="${sessionScope['user'].getId()}">
                    <input type="hidden" name="username" value="${sessionScope['user'].getUserName()}"/>
                    <input type="hidden" name="password" value="${sessionScope['user'].getPassword()}"/>
                    <button class="confirm-button" name="action" value="confirmUpdate">Xác Nhận</button>
                    <a class="button-container" href="user?action=changePassword&id=${sessionScope['user'].getId()}&username=${sessionScope['user'].getUserName()}&password=${sessionScope['user'].getPassword()}">Đổi Mật khẩu</a>


                <%--                        <button style="width: 69.5%; height: 30px; margin-left:17%;margin-top: 20px;background-color: #8030c9;color: #ffffff"--%>
                    <%--                                name="action" value="addUser">--%>
                    <%--                            Register--%>
                    <%--                        </button>--%>
                    <%--                    </div>--%>
                    <%--                    <p style="width: 250px; height: 30px;margin-left:17%;margin-top: 20px ;margin-left: 110px;  ">--%>
                    <%--                        Bạn đã có tài khoản ? <a href="/users/Login.jsp" style="text-decoration: none;color: #000000">Đăng nhập</a></p>--%>

                </div>
            </div>
            <div class="right"></div>
        </div>
    </div>
</form>

</body>
</html>
