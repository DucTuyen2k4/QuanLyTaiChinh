<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ứng dụng Quản lý Tài chính</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url("/users/notepad-3316267_1280.jpg");
        }


        .header {
            background-color: #bcf38c;
            color: #fff;
            padding: 2px;
            text-align: center;
            position: relative;
            height:100px ;
        }

        .settings {
            position: absolute;
            top: 30px;
            right: 10px;

        }

        .dropdown {
            position: relative;
            display: inline-block;
            width: 150px; /* Thay đổi độ rộng */
            height: 40px; /* Thay đổi chiều cao */
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
            padding: 10px;
        }

        .dropdown-content a {
            color: #333;
            text-decoration: none;
            display: block;
            padding: 5px 0;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .container {
            display: flex;
            max-width: 1200px;
            margin: 0 auto;
        }

        .sidebar {
            flex: 0 0 250px;
            background-color: #f2f2f2;
            width: 100%;
            height: 1000px;
        }

        .content {
            flex: 1;
            padding: 20px;
        }

        .footer {
            background-color: #1d1e1c;
            color: #fff;
            padding: 20px;
            text-align: center;
        }

        .drop-ttn {
            width: 100px;
            height: 40px;
            font-size: 17px;
            background-image: url('ProjectManagement-300x300.png');
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

        .expense-button-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
        }

        .expense-button {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            color: #fff;
            font-size: 24px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-right: 10px;
            margin-bottom: 10px;
        }


        .expense-button:hover {
            opacity: 0.8;
        }

        .expense-button-plane {
            background-color: #3498db;
        }

        .expense-button-hotel {
            background-color: #e67e22;
        }


        .expense-button-camera {
            background-color: #27ae60;
        }


    </style>
</head>
<body>
<div class="header">
    <h1>Ứng dụng Quản lý Tài chính</h1>


    <div class="settings">
        <div class="dropdown">
            <button class="drop-ttn" ><i class="fa  fa-cog" ></i> Settings</button>
            <div class="dropdown-content">
<%--                <c:forEach items="${list}" var="lists">--%>
                    <div>
                        <a href="/user?action=update&id=${sessionScope['user'].getId()}">Cập nhật thông tin</a>
                        <hr width="100%" size="1px" align="center" color="0px 8px 16px 0px rgba(0, 0, 0, 0.2)"/>
                        <a href="/user?action=delete&id=${sessionScope['user'].getId()}">Xóa tài khoản</a>
                        <hr width="100%" size="1px" align="center" color="0px 8px 16px 0px rgba(0, 0, 0, 0.2)"/>
                    </div>
<%--                </c:forEach>--%>
                <div method="get">
                    <a href="#" id="logout-link">Đăng xuất</a>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="sidebar">
        <h2> Chi tiêu </h2>
        <div class="expense-button-container">

            <a class="expense-button expense-button-plane" href="/user/updateProfiles.jsp">
                <i class="fas fa-plane"></i>

            </a>

            <a class="expense-button expense-button-hotel" href="/user/updateProfiles.jsp">
                <i class="fas fa-hotel"></i>
            </a>

            <a class="expense-button expense-button-camera" href="/user/updateProfiles.jsp">
                <i class="fas fa-camera"></i>
            </a>

        </div>


    </div>

    <div class="content">
        hhh

    </div>
</div>

<div class="footer">
    <p>Bản quyền &copy; 2023 Ứng dụng Quản lý Tài chính</p>
</div>
<div class="confirmation-dialog" id="confirmation-dialog">
    <div class="confirmation-dialog-content">
        <h2>Xác nhận đăng xuất</h2>
        <p>Bạn có chắc chắn muốn đăng xuất?</p>
        <button id="confirm-logout-btn">Đồng ý</button>
        <button id="cancel-logout-btn">Hủy</button>
    </div>
</div>

<script>
    const logoutLink = document.getElementById('logout-link');
    const confirmationDialog = document.getElementById('confirmation-dialog');
    const confirmLogoutBtn = document.getElementById('confirm-logout-btn');
    const cancelLogoutBtn = document.getElementById('cancel-logout-btn');

    logoutLink.addEventListener('click', function (event) {
        event.preventDefault();
        confirmationDialog.style.display = 'block';
    });

    confirmLogoutBtn.addEventListener('click', function () {
        console.log("Đăng xuất thành công");
        confirmationDialog.style.display = 'none';
        window.location.href = "/users/list.jsp";
    });
    cancelLogoutBtn.addEventListener('click', function () {
        confirmationDialog.style.display = 'none';
    });

</script>
</body>
</html>