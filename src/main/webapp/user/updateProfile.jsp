<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
    .edit-product {
        max-width: 800px;
        margin: 0 auto;
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
        <form action="user?action=confirmUpdate" method="post" class="edit-form">
            <div class="back-button">
                <a href="/user/listHome.jsp"><i class="fas fa-arrow-left"></i>Quay lại trang chủ</a>
            </div>
            <c:forEach var="list" items="${list}">
                <div class="form-group">
                    <input type="hidden" name="id" value="${list.id}">
                </div>
                <div class="form-group">
                    <label for="fullname">Họ và tên:</label>
                    <input type="text" id="fullname" name="fullName" value="${list.fullName}">
                </div>
                <div class="form-group col-half">
                    <label for="gender">Giới tính:</label>
                    <select id="gender" name="gender">
                        <option value="${list.gender}">${list.gender}</option>
                        <option value="male">Nam</option>
                        <option value="female">Nữ</option>
                        <option value="other">Khác</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="birthdate">Ngày sinh:</label>
                    <input type="date" id="birthdate" name="birthdate" value="${list.birthdate}">
                </div>
                <div class="form-group">
                    <label for="phoneNumber">Số điện thoại:</label>
                    <input type="tel" id="phoneNumber" name="phoneNumber" value="${list.phoneNumber}">
                </div>
                <div class="form-group">
                    <label for="image">Chọn ảnh đại diện:</label>
                    <input type="file" id="image" name="image" accept="image/*" value="${list.image}">
                </div>
                <form action="/user" method="post">
                    <div class="button-container">
                        <button class="confirm-button" name="action" value="confirmUpdate">Xác Nhận</button>
                    </div>
                </form>
                <a class="button-container" href="user?action=changePassword&id=${list.id}">Đổi Mật khẩu</a>
            </c:forEach>
        </form>
    </div>
</div>
</body>
</html>