<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<head>
    <title>Đổi mật khẩu</title>
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

        .container {
            margin-top: 20px;
            width: 500px;
            height: 500px;
            background-color: #f0f0f0;
            margin: 0 auto;
            padding: 20px;
        }


        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .btn-submit {

            display: block;
            width: 35%;
            padding: 10px;
            font-size: 16px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin: 0 auto; /* Thêm dòng này để căn giữa */
        }
        a{
            text-decoration: none;
            color: #1d1e1c;
            font-size: 18px;
        }
        h2{
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <div>
        <a href="/user?action=Home&username=${sessionScope['user'].getUserName()}&password=${sessionScope['user'].getPassword()}" style="color: #0a0101 ; text-decoration: none; ">Quay lại</a>
    </div>
    <h2>Đổi mật khẩu</h2>
    <form action="/user" method="post">

        <div class="form-group">
            <input type="hidden" name="id" value="${id}" />
            <label for="current-password" style="width: 480px">Mật khẩu hiện tại:</label>
            <c:if test="${not empty message}">
                <p style="color: red">${message}</p>
            </c:if>
            <input type="password" id="current-password" style="width: 480px" name="oldPassword" required>
        </div>
        <div class="form-group">
            <label for="new-password">Mật khẩu mới(6-8 kí tự):</label>
            <input type="password" id="new-password" style="width: 480px" name="newPassword" minlength="6" maxlength="8" required>
        </div>
        <div class="form-group">
            <label for="confirm-password" >Xác nhận mật khẩu mới:</label>
            <c:if test="${not empty messages}">
                <p style="color: red">${messages}</p>
            </c:if>
            <input type="password" id="confirm-password" style="width: 480px" name="confirmPassword" minlength="6" maxlength="8" required>
        </div>

        <input type="hidden" name="username" value="${sessionScope['user'].getUserName()}"/>
        <input type="hidden" name="password" value="${sessionScope['user'].getPassword()}"/>
        <button style="background-color: blue ;color: white" type="submit" name="action" value="confirmPassword" class="btn-submit" >Đổi mật khẩu</button>
    </form>
</div>
</body>
</html>