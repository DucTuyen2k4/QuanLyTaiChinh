<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/9b0347940d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            /*background-image: url("/users/hình-nền-ấn-tượng.jpg");*/
            background-color: #eee4e4;
        }

        .header {
            width: 100%;
            height: 5%;
        }

        .logo {
            margin-left: 40px;
            width: 20%;
            height: 10%;
            float: left;
            display: flex;
            margin-top: 5px;
        }

        .menu {
            width: 60%;
            height: 10%;
            float: left;
        }

        .menu1 {
            margin-left: 5%;
            display: flex;
            margin-top: 20px;


        }

        .general {
            height: 80%;
        }

        .left {
            float: left;
            width: 20%;
            height: 100%;
        }

        .content {
            float: left;
            width: 60%;
            height: 100%;
            box-shadow: 0 0 6px 5px #646e6e;
        }

        .right {
            float: left;
            width: 20%;
            height: 100%;
        }

        .footer {
            background-color: #c4b4b4;
            width: 100%;
            height: 10%;
            border-radius: 10px 10px 0 0;
            text-align: center;
            color: white;
        }

        p.footer {
            vertical-align: middle;
        }


        .headers {
            float: right;
            margin-right: 25px;

        }

        button {
            border-radius: 20px;
        }


        li.dropdown {
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            min-width: 80px;
            z-index: 1;
            border-radius: 10px;

        }

        .dropdown-content a {
            color: #dccfcf;
            background-color: #7a7474;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: center;
        }

        .dropdown-content a:hover {
            background-color: #9d9292;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown-content {
            overflow: auto;
            width: 150px;
            height: 200px;
        }

        ::-webkit-scrollbar {
            width: 0;
        }

        .icon {
            width: 11%;
            height: 60px;
            float: left;
        }

        .money {
            float: left;
            background-color: white;
            width: 89%;
            height: 8%;
            display: flex;
            border-radius: 10px;
        }

        .function {
            float: left;
        }

        .describe {

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
    </style>
</head>
<body>
<div class="all">
    <div class="header">
        <div class="logo">
            <i class="fa-brands fa-wordpress" style="font-size: 60px; color: #8030c9"></i>
            <h5 style="margin-top: 6px">wallet <br>manage</h5>
        </div>
        <div class="menu">
            <div class="menu1">
                <div>
                    <a href="/user?action=Home&username=${sessionScope['user'].getUserName()}&password=${sessionScope['user'].getPassword()}"
                       style="color: #0a0101 ; text-decoration: none; ">Home</a>
                </div>
                <div class="w" style="margin-left: 20px">
                    <ul>
                        <li class="dropdown">
                            <a href="#" class="dropbtn" style="color: #0a0101 ; text-decoration: none">Wallet </a>
                            <div class="dropdown-content">
                                <c:forEach var="list" items="${list}">
                                    <a class="dropdown-item"
                                       href="/wallet?action=ShowWallet&permission=${list.permission}&id=${list.idWallet}&username=${sessionScope['user'].getUserName()}&password=${sessionScope['user'].getPassword()}">
                                        <span style="color: black; text-align: center">${list.nameWallet}${list.permission}</span>
                                    </a>
                                </c:forEach>
                                <a class="dropdown-item"
                                   href="/wallet/formAddWallet.jsp?username=${sessionScope['user'].getUserName()}&password=${sessionScope['user'].getPassword()}&id=${sessionScope['user'].getId()}"
                                   style="text-align: center ; color: #1d1e1c">+</a>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="Category" style="margin-left: 20px">
                    <ul>
                        <li class="dropdown">
                            <a href="#" class="dropbtn" style="color: #0a0101 ; text-decoration: none">Category </a>
                            <div class="dropdown-content">
                                <c:forEach var="list" items="${showNameCategory}">
                                    <a class="dropdown-item"
                                       href="/category?action=showCategory&idCategory=${list.idCategory}&username=${sessionScope['user'].getUserName()}&password=${sessionScope['user'].getPassword()}">
                                        <span style="color: black; text-align: center">${list.nameCategory}</span>
                                    </a>
                                </c:forEach>
                                <a class="dropdown-item"
                                   href="/category/formAddCategory.jsp?username=${sessionScope['user'].getUserName()}&password=${sessionScope['user'].getPassword()}&id=${sessionScope['user'].getId()}"
                                   style="text-align: center ; color: #1d1e1c">+</a>
                            </div>
                        </li>
                    </ul>
                </div>
                <div>
                    <a href="" style="margin-left: 40px; color: #0a0101; text-decoration: none">History</a>
                </div>
                <div>
                    <a href="" style="margin-left: 40px; color: #0a0101 ; text-decoration: none">Bank</a>
                </div>
                <div>
                    <a href="" style="margin-left: 40px; color: #0a0101 ; text-decoration: none">Spending</a>
                </div>
            </div>
        </div>
        <div class="headers">
            <nav class="navbar">
                <div class="container-fluid">
                    <button class="navbar-toggler" data-bs-toggle="offcanvas"
                            data-bs-target="#offcanvasDarkNavbar"
                            style="border: none; border-radius: 50%">

                        <img src="https://antimatter.vn/wp-content/uploads/2022/10/hinh-anh-gai-xinh-de-thuong.jpg"
                             alt="Settings" style="width: 80px; height: 80px; border-radius: 50%;">
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
                                       href="/user?action=update&id=${sessionScope['user'].getId()}&username=${sessionScope['user'].getUserName()}&password=${sessionScope['user'].getPassword()}">
                                        Câp nhật thông tin </a>
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
    <hr style="color: black; width: 70%; margin-left: 15%; margin-top: 35px">
    <div class="general">
        <div class="left"></div>
        <div class="content">
            <div class="category">
                <div>
                    <c:if test="${not empty lists}">
                        <c:forEach items="${lists}" var="infor">
                            <p>STT: ${infor.idExpense}</p>
                            <p>Money: ${infor.money}</p>
                            <p>Time: ${infor.time}</p>
                            <p>Note: ${infor.note}</p>
                        </c:forEach>
                    </c:if>
                </div>
                <c:if test="${not empty category}">
                    <c:forEach var="list" items="${category}">
                        <form method="post" action="/category">
                            <div class="form-group">
                                <label>Tên Danh Mục :</label><br>
                                <input name="nameCategory" value="${list.nameCategory}">
                            </div>
                            <div class="form-group">
                                <label>Ghi chú :</label><br>
                                <input name="note" value="${list.note}">
                                <input type="hidden" name="username" value="${sessionScope['user'].getUserName()}"/>
                                <input type="hidden" name="idCategory" value="${list.idCategory}"/>
                                <input type="hidden" name="password" value="${sessionScope['user'].getPassword()}"/>
                            </div>
                            <button type="submit" name="action" value="CategoryUpdate">Cập Nhật</button>
                        </form>
                        <a href="/category?action=delete&idCategory=${list.idCategory}&username=${sessionScope['user'].getUserName()}&password=${sessionScope['user'].getPassword()}">
                            <button>delete</button>
                        </a>
                        <a href="/category?action=search&idCategory=${list.idCategory}">
                            <button>search</button>
                        </a>

                        <div style=" margin-left: 20%; width: 50%;height: 30px ; background-color:red " class="conter">
                            <form action="expense" method="post">
                                <a class="dropdown-item"
                                   href="/expense?action=add&username=${sessionScope['user'].getUserName()}&password=${sessionScope['user'].getPassword()}&id=${sessionScope['user'].getId()}&idCategory=${list.idCategory}"
                                   style="text-align: center ; color: #1d1e1c">+</a>
                            </form>
                        </div>
                    </c:forEach>
                    <c:forEach items="${expense}" var="expense">
                        <p>${expense.time}</p>
                        <p>${expense.nameExpense}</p>
                        <p>${expense.note}</p>
                        <p>${expense.money}</p>
                    </c:forEach>
                </c:if>
            </div>

        </div>
        <div class="right"></div>
    </div>
    <div class="footer">
        <div style="padding:  15px 0 0 0">
            <p style="text-align: center"> Copyright &copy; 2023 Financial Management Application</p>
        </div>
    </div>
</div>


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
    let id${wallet.getIdWallet()};
    let WalletDiv = document.getElementById(wallet)
    if (id === null || id === undefined) {
        walletDiv.style.display = 'block';
    } else {
        walletDiv.style.display = 'none';
    }
</script>
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
                window.location.href = "users/LoginRegistrationInterface.jsp";
                break;
            default:
                break;
        }
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
<%--<script>--%>
<%--    console.log(--%>
<%--        new Intl.NumberFormat('VND', { style: 'currency', currency: 'VND' }).format(--%>
<%--            ${totalMoney}--%>
<%--        ),--%>
<%--    );--%>
<%--</script>--%>
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
        window.location.href = "/wallet?action=delete&idWallet=${wallet.getIdWallet()}&username=${sessionScope['user'].getUserName()}&password=${sessionScope['user'].getPassword()}";
    });
    cancelDelete.addEventListener('click', function () {
        confirmationDelete.style.display = 'none';
    });
</script>
</body>
</html>