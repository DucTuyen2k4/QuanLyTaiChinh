<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Tài Chính</title>
    <style>
        body {
            background-image: url('https://i.pinimg.com/564x/3f/cd/32/3fcd32e9ad073b475e70d855d459f51c.jpg');
            background-size: cover;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        h1 {
            margin-bottom: 20px;
            color: #333;
        }

        form {
            text-align: left;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
        }

        input[type="text"],
        input[type="password"],
        select,
        input[type="date"] {
            width: 96%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            width: 96%;
            background: #3498db;
            color: white;
            padding: 10px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        input[type="submit"]:hover {
            background: #2980b9;
        }

        span.error {
            color: red;
            font-size: 12px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Đăng ký</h1>
    <form method="post" action="Login?action=addUser">
        <label for="userName">Tên đăng nhập:</label>
        <input type="text" name="userName" id="userName" required>

        <label for="password">Mật khẩu (6-8 ký tự):</label>
        <input type="password" id="password" name="password" minlength="6" maxlength="8" required>

        <label for="confirmPassword">Xác nhận mật khẩu:</label>
        <input type="password" name="confirmPassword" id="confirmPassword" required>

        <label for="fullName">Họ và tên:</label>
        <input type="text" name="fullName" id="fullName" required>

        <label for="phoneNumber">Số điện thoại:</label>
        <input type="text" name="phoneNumber" id="phoneNumber" required>

        <label for="gender">Giới tính:</label>
        <select name="gender" id="gender">
            <option value="Male">Nam</option>
            <option value="Female">Nữ</option>
            <option value="Other">Khác</option>
        </select>

        <label for="birthdate">Ngày tháng năm sinh:</label>
        <input type="date" name="birthdate" id="birthdate">

        <input type="submit" value="Submit">
    </form>
</div>
</body>
</html>
