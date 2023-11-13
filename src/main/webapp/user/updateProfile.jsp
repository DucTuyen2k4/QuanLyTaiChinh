<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">--%>
<%--<style>--%>
<%--    body {--%>
<%--        background-image: url('https://images.pexels.com/photos/3943727/pexels-photo-3943727.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');--%>
<%--        background-size: cover;--%>
<%--        font-family: Arial, sans-serif;--%>
<%--        margin: 0;--%>
<%--        padding: 0;--%>
<%--        display: flex;--%>
<%--        justify-content: center;--%>
<%--        align-items: center;--%>
<%--        height: 120vh;--%>
<%--    }--%>

<%--    .edit-product {--%>

<%--        width: 500px;--%>
<%--        height: 650px;--%>
<%--        padding: 20px;--%>
<%--        background-color: #F8F8F8;--%>
<%--    }--%>

<%--    .edit-form {--%>
<%--        display: grid;--%>
<%--        grid-row-gap: 10px;--%>
<%--    }--%>

<%--    .form-group {--%>
<%--        display: flex;--%>
<%--        flex-direction: column;--%>
<%--    }--%>
<%--    .form-group input {--%>

<%--        padding: 9px;--%>
<%--        /*font-size: 16px;*/--%>
<%--        /*border: 1px solid #ccc;*/--%>

<%--    }--%>

<%--    label {--%>
<%--        margin-bottom: 5px;--%>
<%--        color: #333;--%>
<%--        font-weight: bold;--%>
<%--    }--%>

<%--    textarea {--%>
<%--        height: 100px;--%>
<%--    }--%>

<%--    .back-button {--%>
<%--        margin-bottom: 20px;--%>
<%--    }--%>

<%--    .back-button a {--%>
<%--        display: inline-flex;--%>
<%--        align-items: center;--%>
<%--        color: #333;--%>
<%--        text-decoration: none;--%>
<%--        transition: color 0.3s ease;--%>
<%--    }--%>

<%--    .back-button a:hover {--%>
<%--        color: #000;--%>
<%--    }--%>

<%--    .back-button i {--%>
<%--        margin-right: 5px;--%>
<%--    }--%>

<%--    .form-groupp {--%>
<%--        width: 100px;--%>
<%--        height: 60px;--%>

<%--    }--%>

<%--    .button-container {--%>
<%--        display: flex;--%>
<%--        justify-content: center;--%>
<%--        margin-top: 20px;--%>
<%--    }--%>

<%--    .confirm-button {--%>
<%--        padding: 10px 20px;--%>
<%--        font-size: 16px;--%>
<%--        background-color: #4CAF50;--%>
<%--        color: white;--%>
<%--        border: none;--%>
<%--        cursor: pointer;--%>
<%--        transition: background-color 0.3s ease;--%>
<%--    }--%>

<%--    .confirm-button:hover {--%>
<%--        background-color: #45a049;--%>
<%--    }--%>
<%--</style>--%>
<%--<head>--%>
<%--    <title>Chỉnh sửa thông tin</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="edit-product">--%>
<%--    <div>--%>
<%--        <form action="user?action=confirmUpdate" method="post" class="edit-form">--%>
<%--            <div class="back-button">--%>
<%--                <a href="user/listHome.jsp"><i class="fas fa-arrow-left"></i>Quay lại trang chủ</a>--%>
<%--            </div>--%>
<%--            &lt;%&ndash;            <c:forEach var="lists" items="${list}">&ndash;%&gt;--%>
<%--            <div class="form-group">--%>
<%--                <input type="hidden" name="id" value="${sessionScope['user'].getId()}">--%>
<%--            </div>--%>
<%--            <div class="form-group">--%>

<%--                <label for="fullname">Họ và tên:</label>--%>
<%--                <input type="text" id="fullname" name="fullName" value="${sessionScope['user'].getFullName()}">--%>
<%--            </div>--%>
<%--            <div class="form-group col-half">--%>
<%--                <label for="gender">Giới tính:</label>--%>
<%--                <select id="gender" name="gender">--%>

<%--                    <option value="male">Nam</option>--%>
<%--                    <option value="female">Nữ</option>--%>
<%--                    <option value="other">Khác</option>--%>
<%--                </select>--%>
<%--            </div>--%>
<%--            <div class="form-group">--%>
<%--                <label for="birthdate">Ngày sinh:</label>--%>
<%--                <input type="date" id="birthdate" name="birthdate" value="${sessionScope['user'].getBirthdate()}" required>--%>
<%--            </div>--%>
<%--            <div class="form-group">--%>
<%--                <label for="phoneNumber">Số điện thoại:</label>--%>
<%--                <input type="tel" id="phoneNumber" name="phoneNumber" value="${sessionScope['user'].getPhoneNumber()}" required>--%>
<%--            </div>--%>
<%--            <div class="form-group">--%>
<%--                <label for="image">Chọn ảnh đại diện:</label>--%>
<%--                <input type="file" id="image" name="image" accept="image/*" value="${sessionScope['user'].getImage()}" required>--%>
<%--            </div>--%>
<%--            <form action="/user" method="post">--%>
<%--                <div class="button-container">--%>
<%--                    <button class="confirm-button" name="action" value="confirmUpdate">Xác Nhận</button>--%>
<%--                </div>--%>
<%--            </form>--%>
<%--            <a class="button-container" href="user?action=changePassword&id=${sessionScope['user'].getId()}">Đổi Mật khẩu</a>--%>
<%--            &lt;%&ndash;            </c:forEach>&ndash;%&gt;--%>
<%--        </form>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>
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
        height: 900px;
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
    .button-container {
        display: flex; /* Sử dụng flexbox để đặt chúng cùng một dòng */
        justify-content: space-between; /* Căn chỉnh chúng về hai phía */
    }

    .btn-signup,
    .btn-login {
        padding: 10px 20px; /* Điều chỉnh khoảng cách và kích thước nút */
    }


</style>
<body>
<header>
    <div class="left-pane"></div>
    <div class="middle-pane" >
        <div style="margin-left: 150px">Budget</div></div>
    <div class="right-pane">
        <form>
            <%--      <div class="function-text">--%>
            <%--        <input type="submit" value="Register" class="register-button">--%>

            <%--        <button  class="no-border login-button" style="width: 90px; height: 35px;">--%>
            <%--          <a href="/users/list.jsp" style="color: #ffffff; text-decoration: none;">Login</a></button>--%>
            <%--      </div>--%>
        </form>
    </div>
</header>


<%--thanh chức năng--%>
<nav>
</nav>

<%--giao diện--%>
<main>
    <form method="post" action="user?action=confirmUpdate&id=${sessionScope['user'].getId()}">
        <div class="middle-pane">
            <H1 style="text-align: center">Thông tin người dùng </H1>
            <div class="centered-text">
                <h5 style="float: left">Ảnh :</h5>
                <input class="no-border " type="text" name="image" id="image" required pattern=".*\.(jpg|png|gif)" value="${sessionScope['user'].getImage()}" title="Chỉ được nhập đường dẫn ảnh với đuôi .jpg, .png, hoặc .gif">
                <h5 style="float: left" for="fullName">Họ và tên:</h5>
                <input class="no-border " type="text" name="fullName" id="fullName" value="${sessionScope['user'].getFullName()}" required>
                <h5 style="float: left" for="phoneNumber">Số điện thoại (10 số):</h5>
                <p style="color: red;font-size: 10px;">${messageFailurePhoneNumber}</p>
                <input class="no-border " type="text" name="phoneNumber" id="phoneNumber" required pattern="[0-9]{10}" value="${sessionScope['user'].getPhoneNumber()}" title="${messageFailurePhoneNumber}">
                <h5 style="float: left" for="gender" >Giới tính </h5>

                <select name="gender" class="no-border "  id="gender" style="width: 265px">
                    <option value="${sessionScope['user'].getGender()}">${sessionScope['user'].getGender()}</option>
                    <option value="Male">Nam</option>
                    <option value="Female">Nữ</option>
                    <option value="Other">Khác</option>
                </select>
                <h5 style="float: left" for="birthdate">Ngày sinh:</h5>
                <p style="color: red;font-size: 10px;">${messageFailureBirthdate}</p>
                <input class="no-border " type="date" name="birthdate" id="birthdate" value="${sessionScope['user'].getBirthdate()}" required>

            </div>
            <div class="function-text">
                <input type="submit" style="margin-top: 40px" value="Register" class="register-button">


            </div>
            <%--        <hr style="background-color: #4CAF50">--%>


        </div>
    </form>
</main>
<%--<form>--%>
<%--</form>--%>
</body>
</html>