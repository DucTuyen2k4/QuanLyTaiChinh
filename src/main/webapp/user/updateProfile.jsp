<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
    body {
        font-family: Arial, sans-serif;
        background-image: url("https://i.pinimg.com/564x/7e/29/23/7e292374c4294a92b077983559036e1f.jpg");
        background-size: cover;
        background-repeat: no-repeat;
        background-attachment: fixed;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .edit-product {

        width: 500px;
        height: 650px;
        padding: 20px;
        background-color: #F8F8F8;
    }

    .edit-form {
        display: grid;
        grid-row-gap: 10px;
    }

    .form-group {
        display: flex;
        flex-direction: column;
    }
    .form-group input {

        padding: 9px;
        /*font-size: 16px;*/
        /*border: 1px solid #ccc;*/

    }

    label {
        margin-bottom: 5px;
        color: #333;
        font-weight: bold;
    }

    textarea {
        height: 100px;
    }

    .back-button {
        margin-bottom: 20px;
    }

    .back-button a {
        display: inline-flex;
        align-items: center;
        color: #333;
        text-decoration: none;
        transition: color 0.3s ease;
    }

    .back-button a:hover {
        color: #000;
    }

    .back-button i {
        margin-right: 5px;
    }

    .form-groupp {
        width: 100px;
        height: 60px;

    }

    .button-container {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }

    .confirm-button {
        padding: 10px 20px;
        font-size: 16px;
        background-color: #4CAF50;
        color: white;
        border: none;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .confirm-button:hover {
        background-color: #45a049;
    }
</style>
<head>
    <title>User Management Application</title>
</head>
<body>
<div class="edit-product">


    <div>
        <form action="/user?action=confirmUpdate" method="post" class="edit-form">
            <div class="back-button">
                <a href="/user/listHome.jsp"><i class="fas fa-arrow-left"></i>Quay lại trang chủ</a>
            </div>
            <h1 style="width: 70% ;height: 70% ;margin-left: 100px">Cập nhật thông tin </h1>
            <%--            <c:forEach var="lists" items="${list}">--%>
            <div class="form-group">
                <input type="hidden" name="id" value="${sessionScope['user'].getId()}">
            </div>
            <div class="form-group">

                <label for="fullname">Họ và tên:</label>
                <input type="text" id="fullname" name="fullName" value="${sessionScope['user'].getFullName()}">
            </div>
            <div class="form-group col-half">
                <label for="gender" >Giới tính:</label>
                <select style=" padding: 9px;" id="gender" name="gender" >
<%--                    <option value="${sessionScope['user'].getGender()}">${sessionScope['user'].getGender()}</option>--%>
<%--                    <option value="Male">Nam</option>--%>
<%--                    <option value="Female">Nữ</option>--%>
<%--                    <option value="Other">Khác</option>--%>
    <c:choose>
        <c:when test="${sessionScope['user'].getGender() eq 'Male'}">
            <option value="Male" selected>Nam</option>
            <option value="Female">Nữ</option>
            <option value="Other">Khác</option>
        </c:when>
        <c:when test="${sessionScope['user'].getGender() eq 'Female'}">
            <option value="Male">Nam</option>
            <option value="Female" selected>Nữ</option>
            <option value="Other">Khác</option>
        </c:when>
        <c:otherwise>
            <option value="Male">Nam</option>
            <option value="Female">Nữ</option>
            <option value="Other" selected>Khác</option>
        </c:otherwise>
    </c:choose>
                </select>
            </div>
            <div class="form-group">
                <label for="birthdate">Ngày sinh:</label>
                <input type="date" id="birthdate" name="birthdate" value="${sessionScope['user'].getBirthdate()}"
                       required>
            </div>
            <div class="form-group">
                <label for="phoneNumber">Số điện thoại:</label>
                <input type="tel" id="phoneNumber" name="phoneNumber" value="${sessionScope['user'].getPhoneNumber()}"
                       required>
            </div>
            <div class="form-group">
                <label for="image">Chọn ảnh đại diện:</label>
                <input type="text" id="image" name="image" accept="image/*" value="${sessionScope['user'].getImage()}"
                       required>
            </div>
            <form action="/user" method="post">
                <div class="button-container">
                    <button class="confirm-button" name="action" value="confirmUpdate">Xác Nhận</button>
                </div>
            </form>
            <a class="button-container" href="/user?action=changePassword&id=${sessionScope['user'].getId()}">Đổi Mật
                khẩu</a>
            <%--            </c:forEach>--%>
        </form>
    </div>
</div>
</body>
</html>