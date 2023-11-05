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
        background-color: #343434; /*màu xanh dương*/
        width: 100%;
        height: 10%;


    }

    header .left-pane {
        float: left;
        width: 17%;
        height: 100%;

    }

    header .middle-pane {
        float: left;
        width: 65%;
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
        width: 18%;
        height: 100%;
        background-color: #819759;
        display: flex; /* Sử dụng flexbox */
        justify-content: right; /* Canh giữa theo chiều ngang */
        align-items: center; /* Canh giữa the theo chiều dọc */

    }

    /*thanh chức năng*/
    nav {
        background-color: #b8bbb5; /*màu đen*/
        width: 100%;
        height: 0;

    }

    /*giao diện*/
    main {
        background-color: #4CAF50; /*màu xanh lá*/
        width: 100%;
        height: 73%;

    }

    /* giao diện ở trái */
    .left-pane {
        width: 15%; /* Chiếm 25% chiều rộng */
        float: left;
        height: 100%;
        background-color: #ffffff; /* Màu hồng */

    }

    .middle-pane {
        width: 70%; /* Chiếm 70% chiều rộng */
        float: left;
        height: 100%;
        display: flex;
        justify-content: space-between;
    }


    /* giao diện ở phải */
    .right-pane {
        width: 15%; /* Chiếm 25% chiều rộng */
        float: left;
        height: 100%;
        background-color: #f8f9fc; /* Màu xanh */

    }


    form {

        width: 100%;
        height: 1%;

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


    .settings-button {
        position: absolute;

    }

    button {
        border-right: 2px solid #1d1e1c;
    }


    /* Add hover effect and show dropdown on hover */
    .nav-button + .dropdown-menu {
        display: none;
        position: absolute;
        background-color: #f8f9fc; /* Background color for the dropdown */
        padding: 10px; /* Add padding for spacing */
    }

    .nav-button + .dropdown-menu button {
        display: block;
        margin-bottom: 5px; /* Adjust margin as needed for spacing between items */
    }

    .nav-button + .dropdown-menu button:hover {
        background-color: #ddd; /* Background color on hover */
    }

    .nav-button:hover + .dropdown-menu {
        display: block;
    }

    button {
        border-radius: 30%;
    }


    /* Show the dropdown buttons when the dropdown label is clicked */
    .dropdown-label:hover + .dropdown-menu .nav-button-dropdown {
        display: block;
    }


    .middle-pane ul {
        display: flex;
    }

    .middle-pane > ul li {
        list-style: none; /* Remove the default bullet point */
    }

    .middle-pane > ul li a {
        display: block;
        padding: 0 15px; /* Decrease the padding to make smaller list items */
        line-height: 40px;
        color: white;
        text-decoration: none; /* Remove the underline from anchor text */
    }

    .middle-pane ul li:first-child {
        border-left: none; /* Remove the left border for the first item */
    }

    .middle-pane > ul li:first-child a {
        border-bottom-left-radius: 5px;
        border-top-left-radius: 5px;
    }

    .middle-pane ul li:hover > a {
        background: #f7faf7; /* Adjust background color on hover */
        opacity: 0.7;
        color: #0bc905;
    }

    .middle-pane li ul {
        display: none;
        min-width: 230px;
        position: absolute;
    }

    .middle-pane li > ul li {
        width: 100%;
        border: none;
        border-bottom: 1px solid #ffffff;
        background: #a5e7a8;
        text-align: left;

    }

    .middle-pane li > ul li:first-child a {
        border-bottom-left-radius: 0px;
        border-top-left-radius: 0px;
    }

    .middle-pane li > ul li:last-child {
        border-bottom-left-radius: 1px;
        border-bottom-right-radius: 1px;
    }

    .middle-pane li > ul li:last-child a {
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;
    }

    .middle-pane li:hover > ul {
        display: block;
    }

    .middle-pane > ul li > ul li > ul {
        margin-left: 352px;
        margin-top: -50px;
    }

    a {
        color: #1d1e1c;
        font-size: 22px;
        text-decoration: none;
    }

    ul, li {
        color: #1d1e1c;
        list-style: none;
    }

</style>
<body>
<header>
    <div class="left-pane">
        <img src="https://i.pinimg.com/564x/81/93/33/819333bd2b8d3284385017549dafc84e.jpg" alt="Your Image"
             style="width: 100%; height: 100%;">
    </div>
    <div class="middle-pane">
        <li>
            <a href="#">Home</a>
        </li>
        <div class="dropdown">
            <li><a href="#" title="Giải trí">Wallet</a>
                <ul class="dropdown-menu dropdown-menu-dark">
                    <c:forEach var="list" items="${list}">
                        <li><a class="dropdown-item"
                               href="/wallet?action=ShowWallet&id=${list.idWallet}&username=${sessionScope['user'].getUserName()}&password=${sessionScope['user'].getPassword()}">
                            <span style="color: black;">${list.nameWallet}</span>
                        </a>
                        </li>
                    </c:forEach>
                    <li><a class="dropdown-item"
                           href="/wallet/formAddWallet.jsp?username=${sessionScope['user'].getUserName()}&password=${sessionScope['user'].getPassword()}&id=${sessionScope['user'].getId()}"
                           style="text-align: center ; color: #1d1e1c">+</a></li>
                </ul>
            </li>
        </div>
        <div class="dropdown">
            <li><a href="#">Categories</a>
                <ul class="dropdown-menu dropdown-menu-dark">
                    <li><a class="dropdown-item" style=" padding: 10px;" href="#"><span style="color: black;">Ăn uống</span></a>

                    </li>
                    <li><a class="dropdown-item" style=" padding: 10px;" href="#"> <span style="color: black;">Du lịch</span></a></li>

                    <li><a class="dropdown-item" style=" padding: 10px;" href="#">  <span style="color: black;">Xăng xe</span></a>
                    </li>

                </ul>
            </li>
        </div>
        <div class="dropdown">
            <li><a href="#">History</a>
                <ul class="dropdown-menu dropdown-menu-dark">
                    <li><a href="#">ggg</a></li>
                    <li><a href="#">ggg</a></li>

                </ul>
            </li>
        </div>
        <div class="dropdown">
            <li><a href="#">Bank</a>
                <ul class="dropdown-menu dropdown-menu-dark">
                    <li><a href="#" >Phim</a></li>
                    <li><a href="#" >Nhạc</a></li>
                </ul>
            </li>
        </div>
    </div>


    <div class="right-pane">
        <div class="settings-button" style="margin-top: -40px">
            <div class="header p-3 m-0 border-0 bd-example m-0 border-0" style="">
                <nav class="navbar" style="background-color: #819759">
                    <div class="container-fluid">
                        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas"
                                data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar"
                                aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon">jjj</span>
                        </button>
                        <div class="offcanvas offcanvas-end text-bg-dark" id="offcanvasDarkNavbar"
                             aria-labelledby="offcanvasDarkNavbarLabel" style="width: 300px">
                            <div class="offcanvas-header">
                                <h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel">Settings</h5>
                                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas"
                                        aria-label="Close"></button>
                            </div>
                            <div class="offcanvas-body">
                                <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">

                                    <li class="nav-item">
                                        <a style="color: #ffffff" class="nav-link active" aria-current="page"
                                           href="/user?action=update&id=${sessionScope['user'].getId()}"> Câp nhật
                                            thông
                                            tin </a>
                                    </li>
                                    <li class="nav-item">
                                        <a style="color: #ffffff" class="nav-link active" aria-current="page" href="#"
                                           onclick="showDialog('confirmation-dialog-delete')">Xóa tài khoản</a></li>
                                    <li class="nav-item">
                                        <a style="color: #ffffff" class="nav-link active" aria-current="page" href="#"
                                           onclick="showDialog('confirmation-dialog-logout')">Đăng xuất</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>
<%--thanh chức năng--%>
<nav>

</nav>

<%--giao diện--%>
<main>
    <div class="left-pane"></div>
    <div class="middle-pane"></div>
    <div class="right-pane"></div>
</main>

<form>
    <p>Copyright &copy; 2023 Financial Management Application</p>
</form>
<div class="confirmation-dialog" id="confirmation-dialog-delete">
    <div class="confirmation-dialog-content">
        <h2 style="font-size: 20px">Confirm account deletion</h2>
        <p>Are you sure you want to delete your account?</p>
        <button onclick="confirmAction('delete')">Agree</button>
        <button onclick="hideDialog('confirmation-dialog-delete')">Cancel</button>
    </div>
</div>

<div class="confirmation-dialog" id="confirmation-dialog-logout">
    <div class="confirmation-dialog-content">
        <h2 style="font-size: 20px">Confirm logout</h2>
        <p>Are you sure you want to sign out?</p>
        <button onclick="confirmAction('logout')">Agree</button>
        <button onclick="hideDialog('confirmation-dialog-logout')">Cancel</button>
    </div>
</div>

<script>
    function showDialog(dialogId) {
        const dialog = document.getElementById(dialogId);
        dialog.style.display = 'block';
    }

    function hideDialog(dialogId) {
        const elementById = document.getElementById(dialogId);
        const dialog = elementById;
        dialog.style.display = 'none';
    }

    function confirmAction(action) {
        console.log(action + " thành công");
        hideDialog('confirmation-dialog-' + action);
        switch (action) {
            case 'delete':
                window.location.href = "/user?action=delete&id=${sessionScope['user'].getId()}";

                break;
            case 'logout':
                window.location.href = "/users/list.jsp";
                break;
            default:
                break;
        }
    }
</script>
</body>
</html>
