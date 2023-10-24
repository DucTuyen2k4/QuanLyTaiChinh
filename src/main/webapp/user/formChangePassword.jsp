<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<head>
    <title>Đổi mật khẩu</title>
    <style>
        body {
            font-family: Arial, sans-serif;

            background-image: url("https://www.vietnamfineart.com.vn/wp-content/uploads/2023/03/f99a5cc9ebcceba1dd49af0d509732dc.jpg") ;

        }

        .container {
            max-width: 400px;
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
    <div class="back-button">
        <a href="user/listHome.jsp"><i class="fas fa-arrow-left"></i>  Quay lại trang chủ</a>
    </div>
    <h2>Đổi mật khẩu</h2>


    <form action="/user" method="post">

        <div class="form-group">
            <input type="hidden" name="id" value="${id}" />
            <label for="current-password">Mật khẩu hiện tại:</label>
            <p style="color: red">${message}</p>
            <input type="password" id="current-password" name="oldPassword" required>
        </div>
        <div class="form-group">
            <label for="new-password">Mật khẩu mới(6-8 kí tự):</label>
            <input type="password" id="new-password" name="newPassword" minlength="6" maxlength="8" required>
        </div>
        <div class="form-group">
            <label for="confirm-password">Xác nhận mật khẩu mới:</label>
            <p style="color: red">${messages}</p>
            <input type="password" id="confirm-password" name="confirmPassword" minlength="6" maxlength="8" required>
        </div>
        <button type="submit" name="action" value="confirmPassword" class="btn-submit">Đổi mật khẩu</button>
    </form>
</div>
</body>
</html>