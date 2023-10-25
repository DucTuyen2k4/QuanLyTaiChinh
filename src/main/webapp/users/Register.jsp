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
            height: 120vh;
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
            width: 95%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            width: 98%;
            background: #3498db;
            color: white;
            padding: 10px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        .login{
            font-size: 84%;
            background: #3498db;
            color: white;
            padding: 10px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            width: 150px;
            text-decoration: none; /* Loại bỏ gạch chân */
            display: flex;
            justify-content: center; /* Đặt văn bản ở giữa theo chiều ngang */
            align-items: center; /* Đặt văn bản ở giữa theo chiều dọc */
        }


        input[type="submit"]:hover {

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
    <form method="post" action="/user?action=addUser">
        <label for="image">Ảnh :</label>
        <input type="text" name="image" id="image" required pattern=".*\.(jpg|png|gif)" title="Chỉ được nhập đường dẫn ảnh với đuôi .jpg, .png, hoặc .gif">
        <label for="userName">Tên đăng nhập:</label>
        <p style="color: red;font-size: 10px;">${messageFailureUserName}</p>
        <input type="text" name="userName" id="userName" required>
        <label for="password">Mật khẩu (6-8 ký tự):</label>
        <input type="password" id="password" name="password" minlength="6" maxlength="8" required>

        <label for="confirmPassword">Xác nhận mật khẩu:</label>
        <p style="color: red;font-size: 10px;">${messageFailurePassword}</p>
        <input type="password" name="confirmPassword" id="confirmPassword" minlength="6" maxlength="8" required>
        <label for="fullName">Họ và tên:</label>
        <input type="text" name="fullName" id="fullName" required>
        <label for="phoneNumber">Số điện thoại (10 số):</label>
        <p style="color: red;font-size: 10px;">${messageFailurePhoneNumber}</p>
        <input type="text" name="phoneNumber" id="phoneNumber" required pattern="[0-9]{10}" title="${messageFailurePhoneNumber}">
        <label >email:</label>
        <input type="text" name="email" pattern="[^@\s]+@gmail\.com" title="Vui lòng nhập địa chỉ email có định dạng @gmail.com" required>

        <label for="gender" >Giới tính: </label>
        <select name="gender" id="gender" style="width: 400px">
            <option value="Male">Nam</option>
            <option value="Female">Nữ</option>
            <option value="Other">Khác</option>
        </select>

        <label for="birthdate">Ngày tháng năm sinh:</label>
        <p style="color: red;font-size: 10px;">${messageFailureBirthdate}</p>
        <input type="date" name="birthdate" id="birthdate" required>

        <div  style="display: flex; justify-content: space-between;margin-top: 40px">
            <input type="submit" value="Đăng ký" style=" width: 165px">
            <a href="/users/list.jsp" class="login">Đăng nhập</a>
        </div>

    </form>
</div>
</body>
</html>
