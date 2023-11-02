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
    <script src="https://kit.fontawesome.com/442033bc4b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {

            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url("/users/notepad-3316267_1280.jpg");
        }
        .custom-table {
            width: 100%; /* Đặt chiều rộng của bảng là 100% của phần tử chứa nó */
            border-collapse: collapse; /* Để bỏ khoảng cách giữa các ô */
            border: 2px solid #000; /* Đặt viền cho bảng */
            white-space: nowrap; /* Ngăn văn bản tự động xuống dòng */
            overflow-x: auto; /* Tạo thanh trượt ngang khi bảng tràn ra khỏi màn hình */
        }

        /* Định nghĩa kiểu dáng cho ô th (header) trong bảng */
        .custom-table th {
            background-color: #f2f2f2; /* Màu nền cho ô th */
            text-align: center; /* Căn giữa nội dung trong ô th */
            padding: 10px; /* Khoảng cách giữa nội dung và viền của ô th */
            overflow-wrap: break-word; /* Tự động xuống dòng khi không vừa */
            white-space: normal;
            width: 20%;
        }

        /* Định nghĩa kiểu dáng cho ô td (dữ liệu) trong bảng */
        .custom-table td {
            text-align: center; /* Căn giữa nội dung trong ô td */
            padding: 10px; /* Khoảng cách giữa nội dung và viền của ô td */
            overflow-wrap: break-word; /* Tự động xuống dòng khi không vừa */
            white-space: normal;
            width: 20%;
        }
        .custom-table tr{
            text-align: center; /* Căn giữa nội dung trong ô td */
            padding: 10px; /* Khoảng cách giữa nội dung và viền của ô td */
            white-space: normal; /* Bình thường - không giữ nguyên khoảng trắng */
            word-wrap: break-word;
        }

        .dropdown-content a {
            color: #333;
            text-decoration: none;
            display: block;
            padding: 5px 0;
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


        .header {
            width: 100%;
            height: 80px;
            color: red;


        }



        .head-link {
            color: #e67e22;
            height: 30px;
            width: 100%;
        }

        .container-fluid {
            float: right;
        }

        .container-fluid {
            float: right;
        }

        .container1 {
            width: 100%;
            height: 100%;
        }

    </style>
</head>
<body>
<div class="header">
    <div class="header p-3 m-0 border-0 bd-example m-0 border-0">
        <nav class="navbar navbar-dark bg-dark fixed-top">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas"
                        data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="head-link">
                    <ul>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                               aria-expanded="false">
                                Wallet
                            </a>
                            <ul class="dropdown-menu dropdown-menu-dark">
                                <c:forEach var="list" items="${list}">
                                    <li><a class="dropdown-item"
                                           href="/wallet?action=ShowWallet&id=${list.idWallet}&username=${sessionScope['user'].getUserName()}&password=${sessionScope['user'].getPassword()}"> ${list.nameWallet}</a>
                                    </li>
                                </c:forEach>
                                <li><a class="dropdown-item"
                                       href="/wallet/formAddWallet.jsp?username=${sessionScope['user'].getUserName()}&password=${sessionScope['user'].getPassword()}&id=${sessionScope['user'].getId()}"
                                       style="text-align: center">+</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>

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
                                   href="/user?action=update&id=${sessionScope['user'].getId()}"> Update profile</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#"
                                   onclick="showDialog('confirmation-dialog-delete')">Delete the account</a></li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#"
                                   onclick="showDialog('confirmation-dialog-logout')">Log out</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
    </div>
</div>
</div>

<div class="container">
    <div id="wallet" class="container1" style="display: none">
        <table  class="custom-table"  bgcolor="red">
            <tr>
                <th>ID</th>
                <th>${wallet.getIdWallet()}</th>
            </tr>

            <tr>
                <td>ICON</td>
                <td>${wallet.getIcon()}</td>
            </tr>

            <tr>
                <td>NAMEWALLET</td>
                <td>${wallet.getNameWallet()}</td>
            </tr>

            <tr>
                <td>MONEY</td>
                <td>${wallet.getMoney()}</td>
            </tr>

            <tr>
                <td>CURRENCY</td>
                <td>${wallet.getCurrency()}</td>
            </tr>

            <tr>
                <td>DESCRIPTION</td>
                <td>${wallet.getDescription()}</td>
            </tr>

        </table>
        <form action="/wallet?action=showWalletUpdate&idWallet=${wallet.getIdWallet()}&username=${sessionScope['user'].getUserName()}&password=${sessionScope['user'].getPassword()}"
              method="post">
            <input value="update" type="submit">
        </form>
        <a href="#"  id="Delete-link"><button>delete wallet</button></a>
    </div>
</div>


<div class="confirmation-dialog" id="confirmation-dialog-delete">
    <div class="confirmation-dialog-content">
        <h2 style="font-size: 20px">Confirm account deletion</h2>
        <p>Are you sure you want to delete your account?</p>
        <button onclick="confirmAction('delete')">Yes</button>
        <button onclick="hideDialog('confirmation-dialog-delete')">Cancel</button>
    </div>
</div>
<div class="confirmation-dialog" id="confirmation-dialog-logout">
    <div class="confirmation-dialog-content">
        <h2 style="font-size: 20px">Confirm logout</h2>
        <p>Are you sure you want to sign out?</p>
        <button onclick="confirmAction('logout')">Yes</button>
        <button onclick="hideDialog('confirmation-dialog-logout')">Cancel</button>
    </div>
</div>

<script>
    function showDialog(dialogId) {
        const dialog = document.getElementById(dialogId);
        dialog.style.display ='block';
    }

    function hideDialog(dialogId) {
        const dialog = document.getElementById(dialogId);
        dialog.style.display = 'none';
    }

    function confirmAction(action) {
        console.log(action + " success");
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
<script>
    let id = ${wallet.getIdWallet()};
    let walletDiv = document.getElementById('wallet');
    if (id === null || id === undefined) {
        walletDiv.style.display = 'none';
    } else {
        walletDiv.style.display = 'block';
    }
</script>
<div class="confirmation-dialog" id="confirmation-deleteW">
    <div class="confirmation-dialog-content">
        <h2>Confirm deletion</h2>
        <p>Do you want to delete ?</p>
        <button id="confirm-De">Yes</button>
        <button id="cancel-De">Cancel</button>
    </div>
</div>
<script>
    const DeleteLink = document.getElementById('Delete-link');
    const confirmationDelete = document.getElementById('confirmation-deleteW');
    const confirmDelete = document.getElementById('confirm-De');
    const cancelDelete = document.getElementById('cancel-De');

    DeleteLink.addEventListener('click', function (event) {
        event.preventDefault();
        confirmationDelete.style.display = 'block';
    });
    confirmDelete.addEventListener('click', function () {
        confirmationDelete.style.display = 'none';
        window.location.href = "/wallet?action=delete&idWallet=${wallet.getIdWallet()}";
    });
    cancelDelete.addEventListener('click', function () {
        confirmationDelete.style.display = 'none';
    });
</script>
</body>
</html>