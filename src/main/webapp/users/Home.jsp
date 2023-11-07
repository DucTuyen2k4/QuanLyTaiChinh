<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ứng dụng Quản lý Tài chính</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/9b0347940d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<style>
    body {
        margin: 0;
        padding: 0;
    }

    header {
        background-color: #ffffff; /*màu xanh dương*/
        width: 100%;
        height: 10%;
        position: relative;
    }

    /*thanh chức năng*/
    nav {
        background-color: #b8bbb5; /*màu đen*/
        width: 100%;
        height: 0;
    }

    /*giao diện*/
    main {
        background-color: #4CAF50; /* Màu xanh lá */
        width: 100%;
        height: calc(85% - 5px); /* Đặt chiều cao là 80% - 5px */
    }

    /* giao diện ở trái */
    .left-pane {
        width: 14%; /* Chiếm 25% chiều rộng */
        float: left;
        height: 100%;
        background-color: #818181; /* Màu hồng */
    }

    .middle-pane {
        width: 73%; /* Chiếm 70% chiều rộng */
        float: left;
        height: 100%;
        display: flex;
        justify-content: space-between;
        background-color: #f5f6f3;
    }

    /* giao diện ở phải */
    .right-pane {
        width: 13%; /* Chiếm 25% chiều rộng */
        float: left;
        height: 100%;
        background-color: #767677; /* Màu xanh */
    }

    form {
        width: 100%;
        height: 10px;
    }

    .square {
        position: absolute;
        width: 230px;
        height: 0;
        border-top: 90px solid #819759; /* Màu sắc và chiều cao của tam giác đứng */
        border-right: 50px solid transparent; /* Độ dài cạnh tam giác */
        border-left: 0px solid transparent; /* Độ dài cạnh tam giác */
        z-index: 1; /* Đặt z-index để đảm bảo nằm phía trên các phần tử khác */
    }

    .rectangles {
        position: relative;
        top: 0;
        left: 157px; /* Width of the square and triangle combined */
        width: 88%; /* Remaining width */
        height: 40px; /* Half of the header height */
        background-color: #fcf7f8;
        z-index: 0; /* Đặt z-index để đảm bảo nằm phía dưới .square */
        display: flex; /* Hiển thị chữ giữa theo chiều ngang */
        align-items: center; /* Căn giữa theo chiều dọc */
    }

    .rectangles-bottom {
        position: absolute;
        top: 40px; /* Half of the header height */
        left: 129px; /* Width of the square */
        width: 90%; /* Remaining width */
        height: 40px; /* Half of the header height */
        background-color: #62bb0a;
        display: flex;
        justify-content: center; /* Căn giữa theo chiều ngang */
        align-items: center; /* Căn giữa theo chiều dọc */
    }

    .rectangles-bottom > ul {
        display: flex;
        list-style: none;
        padding-top: 15px; /* Điều chỉnh khoảng cách từ trên xuống */
    }

    .rectangles-bottom > ul li {
        margin-right: 130px;
    }

    .rectangles-bottom > ul li a {
        display: block;
        line-height: 40px;
        color: white;
        text-decoration: none;
        font-weight: normal; /* Đặt font-weight ban đầu */
        transition: font-weight 0.2s;
    }

    .rectangles-bottom > ul li a:hover {
        font-weight: bold; /* Đặt font-weight khi di chuột qua thẻ */
    }

    .rectangles-bottom > ul li a:active {
        font-weight: bold; /* Đặt font-weight khi thẻ được kích hoạt (nhấn vào) */
    }

    .rectangles-bottom > ul li:hover > a {
        background: #f7faf7;
        opacity: 0.7;
        color: #0bc905;
    }

    .rectangles-bottom > ul li ul {
        display: none;
        min-width: 230px;
        position: absolute;
    }

    .rectangles-bottom > ul li > ul li {
        width: 100%;
        border: none;
        border-bottom: 1px solid #ffffff;
        background: #a5e7a8;
        text-align: left;
    }

    .rectangles-bottom > ul li > ul li:first-child a {
        border-bottom-left-radius: 0px;
        border-top-left-radius: 0px;
    }

    .rectangles-bottom > ul li > ul li:last-child {
        border-bottom-left-radius: 1px;
        border-bottom-right-radius: 1px;
    }

    .rectangles-bottom > ul li > ul li:last-child a {
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;
    }

    .rectangles-bottom > ul li:hover > ul {
        display: block;
    }

    .rectangles-bottom > ul li > ul li > ul {
        margin-left: 352px;
        margin-top: -50px;
    }

    a {
        color: #1d1e1c;
        text-decoration: none;
    }

    ul, li {
        color: #1d1e1c;
        list-style: none;
    }

    .circle {
        width: 80px;
        height: 80px;
        border-radius: 50%;

        background-size: 100%;
        background-repeat: no-repeat;
        position: absolute;
        top: 1px;
        right: 50px;
        z-index: 2;
    }

    .confirmation-dialog {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        z-index: 9999;
    }

    .confirmation-dialog-content {
        background-color: #fff;
        width: 300px;
        padding: 20px;
        text-align: center;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }

    .confirmation-dialog-content h2 {
        margin-top: 0;
    }

    .confirmation-dialog-ccloudflareontent p {
        margin-bottom: 20px;
    }

    .confirmation-dialog-content button {
        margin-right: 10px;
    }

    button.navbar-toggler:focus {
        outline: none;
    }

    .red-square {
        position: absolute;
        width: 155px;
        height: 90px;
        left: 10px; /* Adjust the left position to align it within the square */
        z-index: 2; /* Ensure it's above other elements */

    }

    .rectangles-right {
        position: absolute;
        top: 9px;
        right: 40px; /* Khoảng cách từ bên phải */
    }

    .btn-login, .btn-register {
        background-color: #454546; /* Màu nền */
        color: #fff; /* Màu chữ */
        padding: 6px 10px; /* Kích thước nút */
        text-decoration: none; /* Loại bỏ gạch chân cho liên kết */
        border-radius: 5px; /* Bo tròn góc */
    }

    .btn-register {
        background-color: #4f5050; /* Màu nền cho nút đăng kí */
    }
</style>
<body>
<header>
    <div class="square"></div>
    <div class="red-square">
        <img src="https://i.pinimg.com/564x/81/93/33/819333bd2b8d3284385017549dafc84e.jpg" alt="Logo" width="155"
             height="90">
    </div>
    <div class="rectangles">
        <div class="rectangles-right">
            <a href="list.jsp" class="btn-login">Đăng nhập</a>
            <a href="Register.jsp" class="btn-register">Đăng kí</a>
        </div>
    </div>
    <div class="rectangles-bottom">
        <ul>
            <li>
                <a href="#">Home</a>
            </li>
            <div class="dropdown">
                <li><a href="#">Wallet</a>

                </li>
            </div>
            <div class="dropdown">
                <li><a href="#">Categories</a>
                </li>
            </div>
            <div class="dropdown">
                <li><a href="#">History</a>
                </li>
            </div>
            <div class="dropdown">
                <li><a href="#">Bank</a>
                </li>
            </div>
        </ul>
    </div>
</header>
<nav></nav>
<main>
    <div class="left-pane">
        <a>jj</a>
        <img src="https://cdn-www.bluestacks.com/bs-images/long-chien-truyen-ky-news-vi-1.jpeg" alt="Tên của hình ảnh"
             style="max-width: 100%;height: 46%;">

        <img src="https://gamek.mediacdn.vn/133514250583805952/2022/3/2/photo-1-16461981526061189012229.jpg"
             alt="Tên của hình ảnh" style="max-width: 100%; height: 50%;">
    </div>
    </div>
    <div class="middle-pane"></div>
    <div class="right-pane"></div>
</main>
<form>
    <p style="text-align: center"> Copyright &copy; 2023 Financial Management Application</p>
</form>
</body>
</html>
