<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    body {
        background-image: url('https://images.pexels.com/photos/3943727/pexels-photo-3943727.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
        background-size: cover;
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 120vh;
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
    <title>Chỉnh sửa thông tin</title>
</head>
<body>
<div class="edit-product">
    <div>
        <form action="user?action=confirmUpdate" method="post" class="edit-form">

            <%--            <c:forEach var="lists" items="${list}">--%>
            <div class="form-group">
                <input type="hidden" name="id" value="${sessionScope['user'].getId()}">
            </div>
            <div class="form-group">

                <label for="fullname">Họ và tên:</label>
                <input type="text" id="fullname" name="fullName" value="${sessionScope['user'].getFullName()}">
            </div>
            <div class="form-group col-half">
                <label for="gender">Giới tính:</label>
                <select id="gender" name="gender">
                    <option value="${sessionScope['user'].getGender()}">${sessionScope['user'].getGender()}</option>
                    <option value="male">Nam</option>
                    <option value="female">Nữ</option>
                    <option value="other">Khác</option>
                </select>
            </div>
            <div class="form-group">
                <label for="birthdate">Ngày sinh:</label>
                <input type="date" id="birthdate" name="birthdate" value="${sessionScope['user'].getBirthdate()}" required>
            </div>
            <div class="form-group">
                <label for="phoneNumber">Số điện thoại:</label>
                <input type="tel" id="phoneNumber" name="phoneNumber" value="${sessionScope['user'].getPhoneNumber()}" required>
            </div>
            <div class="form-group">
                <label for="image">Chọn ảnh đại diện:</label>
                <input type="file" id="image" name="image" accept="image/*" value="${sessionScope['user'].getImage()}" required>
            </div>
            <form action="/user" method="post">
                <div class="button-container">
                    <input type="hidden" name="username" value="${sessionScope['user'].getUserName()}"/>
                    <input type="hidden" name="password" value="${sessionScope['user'].getPassword()}"/>
                    <button style="background-color: blue ;color: white" class="confirm-button" name="action" value="confirmUpdate">Xác Nhận</button>
                    <a class="button-container" href="user?action=changePassword&id=${sessionScope['user'].getId()}&username=${sessionScope['user'].getUserName()}&password=${sessionScope['user'].getPassword()}">Đổi Mật khẩu</a>
                </div>
            </form>
            <%--            </c:forEach>--%>
        </form>
    </div>
</div>
</body>
</html>