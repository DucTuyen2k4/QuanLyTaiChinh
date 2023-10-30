<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ứng dụng Quản lý Tài chính</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/9b0347940d.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url("/users/notepad-3316267_1280.jpg");
        }

        .dropdown-content a {
            color: #333;
            text-decoration: none;
            display: block;
            padding: 5px 0;
        }


        .container {
            display: flex;
            max-width: 1200px;
            margin: 0 auto;
        }

        .sidebar {

            background-color: #f2f2f2;
            width: 100%;
            height: 560px;
            margin-left: 150px;
        }

        .footer {
            background-color: #1d1e1c;
            color: #fff;
            padding: 20px;
            text-align: center;
            margin-top: 180px;
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

        .header {
            width: 100%;
            height: 80px;
            color: red;

        }

        .header {
            width: 100%;
            height: 80px;
            border: 3px;
            background-color: #1f1f1f;
        }


        .footer {
            border: 1px solid #318a18;
            text-align: center;
            height: 80px;
            color: black;
            background-color: white;
            /*padding: 20px 0 20px;*/
        }

        .logo {
            margin-left: 10px; /* Điều chỉnh giá trị margin-left theo ý muốn */
        }


    </style>
</head>
<body>
<div class="header">
    <div class="header p-3 m-0 border-0 bd-example m-0 border-0">
        <nav class="navbar navbar-dark bg-dark fixed-top">
            <div class="container-fluid">
                <i class="fa-brands fa-cc-visa" style="font-size: 70px; color: springgreen"></i>
                <H1 style="margin-top: 10px">Quản Lý Tài Chính </H1>

                <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas"

                        data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasDarkNavbar"
                     aria-labelledby="offcanvasDarkNavbarLabel" style="width: 300px">
                    <div class="offcanvas-header">
                        <h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel">Dark offcanvas</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas"
                                aria-label="Close"></button>
                    </div>
                    <div class="offcanvas-body">
                        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page"
                                   href="/user?action=update&id=${sessionScope['user'].getId()}"> Câp nhật thông
                                    tin </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#"
                                   onclick="showDialog('confirmation-dialog-delete')">Xóa tài khoản</a></li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#"
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
<head-link style="background-color: #007bff;width: 100%;height: 40px">
    <div style="background-color: #007bff;width: 100%;height: 40px;padding: 10px">
        <tr>
            <th>
                <select style="margin-left: 80px" name="a" >
                    <option> <a href="/WalletServlet?action=showWallet&idWallet=1"></a></option>
                    <option> <a href="/WalletServlet?action=showWallet&idWallet=1"></a></option>
                    <option> <a href="/WalletServlet?action=showWallet&idWallet=1"></a></option>
                    <option> <a href="/WalletServlet?action=showWallet&idWallet=1"></a></option>

                </select>
            </th>
            <th>ggg</th>
            <th>aaa</th>
            <th>yyu</th>
        </tr>
    </div>
</head-link>

<%--<div class="container">--%>
<%--    <div class="sidebar">--%>
<%--        <h2 style="margin-left: 30%"> Chi tiêu </h2>--%>
<%--&lt;%&ndash;        <div class="expense-button-container">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <a class="expense-button expense-button-plane" href="/user/updateProfiles.jsp">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <i class="fas fa-plane"></i>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </a>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <a class="expense-button expense-button-hotel" href="/user/updateProfiles.jsp">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <i class="fas fa-hotel"></i>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </a>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <a class="expense-button expense-button-camera" href="/user/updateProfiles.jsp">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <i class="fas fa-camera"></i>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </a>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </div>&ndash;%&gt;--%>
<%--    </div>--%>
<%--</div>--%>
<%--<div class="footer">--%>
<%--    <p>Bản quyền &copy; 2023 Ứng dụng Quản lý Tài chính</p>--%>
<%--</div>--%>

<div class="confirmation-dialog" id="confirmation-dialog-delete">
    <div class="confirmation-dialog-content">
        <h2 style="font-size: 20px">Xác nhận xóa tài khoản</h2>
        <p>Bạn có chắc chắn muốn xóa tài khoản?</p>
        <button onclick="confirmAction('delete')">Đồng ý</button>
        <button onclick="hideDialog('confirmation-dialog-delete')">Hủy</button>
    </div>
</div>

<div class="confirmation-dialog" id="confirmation-dialog-logout">
    <div class="confirmation-dialog-content">
        <h2 style="font-size: 20px">Xác nhận đăng xuất</h2>
        <p>Bạn có chắc chắn muốn đăng xuất?</p>
        <button onclick="confirmAction('logout')">Đồng ý</button>
        <button onclick="hideDialog('confirmation-dialog-logout')">Hủy</button>
    </div>
</div>

<script>
    function showDialog(dialogId) {
        const dialog = document.getElementById(dialogId);
        dialog.style.display = 'block';
    }

    function hideDialog(dialogId) {
        const dialog = document.getElementById(dialogId);
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