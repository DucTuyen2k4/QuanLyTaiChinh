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
            width: 80px;
            height: 80px;
            float: left;
        }

        .nameWallet {
            float: left;
        }
        .money{
            float: left;
            background-color: white;
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
                    <a href="" style="color: #0a0101 ; text-decoration: none; ">Home</a>
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

                                <a href="#"> a</a>
                                <a href="#"> b</a>
                                <a href="#"> b</a>
                                <a href="#"> b</a>
                                <a href="#"> b</a>
                                <a href="#"> b</a>
                                <a href="#"> b</a>
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
                                        Câp nhật
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
    <hr style="color: black; width: 70%; margin-left: 15%; margin-top: 35px">
    <div class="general">
        <div class="left"></div>
        <div class="content">
            <div>
                <c:if test="${not empty wallet.getIdWallet()}">
                    <a hidden="hidden"><p>${wallet.getIdWallet()}</p></a>
                    <div class="icon">
                        <i class="${wallet.getIcon()}" style="font-size: 90px"></i>
                    </div>
                    <div class="nameWallet">
                        <p>${wallet.getNameWallet()}</p>
                    </div>
                    <div class="money">
                        <p>${wallet.getMoney()} ${wallet.getCurrency()}</p><br>
                    </div>
                    <div>
                        <p>Miêu Tả :${wallet.getDescription()}</p>
                    </div>
                    <c:if test="${not empty send}">
                        <form action="/wallet?action=showWalletUpdate&idWallet=${wallet.getIdWallet()}&username=${sessionScope['user'].getUserName()}&password=${sessionScope['user'].getPassword()}"
                              method="post">
                            <input value="Cap nhat" type="submit">
                        </form>
                        <form action="/wallet?action=showFormBanking&idWallet=${wallet.getIdWallet()}&username=${sessionScope['user'].getUserName()}&password=${sessionScope['user'].getPassword()}&money=${wallet.getMoney()}&nameWallet=${wallet.getNameWallet()}"
                              method="post">
                            <input value="chuyển tiền" type="submit">
                        </form>
                        <form action="/wallet?action=showShare&idWallet=${wallet.getIdWallet()}&username=${sessionScope['user'].getUserName()}&password=${sessionScope['user'].getPassword()}&id=${sessionScope['user'].getId()}"
                              method="post">
                            <input type="submit" value="share">
                        </form>
                        <a href="#" id="Delete-link">
                            <button>delete wallet</button>
                        </a>
                    </c:if>
                </c:if>
                <c:if test="${not empty category}">
                    <c:forEach var="list" items="${category}">
                        <form method="post" action="/category?action=showCategoryUpdate&idCategory=${list.idCategory}">
                            <div class="form-group">
                                <label>Tên Danh Mục :</label><br>
                                <input name="categoryName" value="${list.nameCategory}">
                            </div>
                            <div class="form-group">
                                <label>Ghi chú :</label><br>
                                <input name="categoryNote" value="${list.note}">
                                <input type="hidden" name="username" value="${sessionScope['user'].getUserName()}"/>
                                <input type="hidden" name="password" value="${sessionScope['user'].getPassword()}"/>
                            </div>
                            <button type="submit">Cập Nhật</button>
                        </form>
                        <br><br><br><br><br>
                        <a href="/category?action=delete&idCategory=${list.idCategory}&username=${sessionScope['user'].getUserName()}&password=${sessionScope['user'].getPassword()}">
                            <button>delete</button>
                        </a>
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
</body>
</html>