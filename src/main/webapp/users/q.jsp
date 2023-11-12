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
        margin-top: 3%;
        width: 73%; /* Chiếm 70% chiều rộng */
        float: left;
        height: 90%;
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
        margin-left: 230px;
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

    .square-100x100 {
        position: absolute;
        width: 700px;
        height: 445px;

        top: 120px; /* Lùi xuống dưới 30px từ phía trên */
        left: 50%; /* Đặt vị trí theo giữa chiều ngang */
        transform: translateX(-50%); /* Dịch chuyển lùi 50% chiều rộng để căn giữa */
    }
</style>
<body>
<header>
    <div class="square"></div>
    <div class="red-square">
        <img src="https://i.pinimg.com/564x/81/93/33/819333bd2b8d3284385017549dafc84e.jpg" alt="Logo" width="155"
             height="90">
    </div>
    <div class="circle" style="right: 100px">
        <div class="settings-button" style="margin-top: -30px ">
            <div class="header p-3 m-0 border-0 bd-example m-0 border-0" style="">
                <nav class="navbar" style="background-color: #819759">
                    <div class="container-fluid">
                        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas"
                                data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar"
                                aria-label="Toggle navigation" style="border: none;">
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
    </div>

    </div>
    <div class="rectangles">
        <a style="color: #1d1e1c; font-size: 20px;  margin-left: 90px; width: 100%;">Hi.${sessionScope['user'].getFullName()}</a>
    </div>
    <div class="rectangles-bottom">
        <ul>
            <li>
                <a href="listHones.jsp">Trang chủ</a>
            </li>
            <div class="dropdown">
                <li><a href="#">Ví</a>
                    <ul class="dropdown-menu dropdown-menu-dark">
                        <c:forEach var="list" items="${list}">
                                <a class="dropdown-item"
                                   href="/wallet?action=ShowWallet&permission=${list.permission}&id=${list.idWallet}&username=${sessionScope['user'].getUserName()}&password=${sessionScope['user'].getPassword()}">
                                <span style="color: black; text-align: center">${list.nameWallet}${list.permission}</span>
                            </a>
                        </c:forEach>
                        <a class="dropdown-item"
                               href="/wallet/formAddWallet.jsp?username=${sessionScope['user'].getUserName()}&password=${sessionScope['user'].getPassword()}&id=${sessionScope['user'].getId()}"
                               style="text-align: center ; color: #1d1e1c">+</a>
                    </ul>
                </li>
            </div>
<%--            dsadsadsadasdasdasdasdas--%>

            <a class="dropdown-item"
               href="/wallet/formAddWallet.jsp?username=${sessionScope['user'].getUserName()}&password=${sessionScope['user'].getPassword()}&id=${sessionScope['user'].getId()}"
               style="text-align: center ; color: #1d1e1c">+</a>
            <div class="dropdown">
                <li><a href="#">Danh mục</a>
                    <ul class="dropdown-menu dropdown-menu-dark">
                        <li><a class="dropdown-item" style=" padding: 10px;" href="#"><span style="color: black;">Khoản thu</span></a>
                        </li>
                        <li><a class="dropdown-item" style=" padding: 10px;" href="#"> <span style="color: black;">Khoản chi</span>
                            <ul class="dropdown-menu dropdown-menu-dark">

                                <c:forEach var="listCategory" items="${listCategory}">
                                    <li>
                                        <a href="category?action=showCategorys&idCategory=${listCategory.idCategory}&username=${sessionScope['user'].getUserName()}&password=${sessionScope['user'].getPassword()}"><span>${listCategory.nameCategory}</span></a>
                                    </li>
                                </c:forEach>
                                <a style="text-align: center ; color: #1d1e1c"
                                   href="/category/formAddCategory.jsp?username=${sessionScope['user'].getUserName()}&password=${sessionScope['user'].getPassword()}&id=${sessionScope['user'].getId()}">+</a>
                            </ul>
                        </a>
                        </li>
                        <li><a class="dropdown-item" style=" padding: 10px;" href="#"> <span
                                style="color: black;">Mục chi tiêu</span></a>
                        </li>

                    </ul>
            </div>
            <div class="dropdown">
                <li><a href="#">Lịch sử</a>
                </li>
            </div>
            <div class="dropdown">
                <li><a href="#">Ngân hàng</a>
                </li>
            </div>
        </ul>
    </div>

</header>
<nav></nav>
<main>
    <div class="left-pane">
    </div>
    <div class="middle-pane">
        <div class="square-100x100">
            <c:if test="${not empty wallet.getIdWallet()}">
                <a hidden="hidden"><p>${wallet.getIdWallet()}</p></a>
                <p>Icon : ${wallet.getIcon()}</p><br>
                <p>Tên Ví : ${wallet.getNameWallet()}</p><br>
                <p>Số Tiền : ${wallet.getMoney()} ${wallet.getCurrency()}</p><br>
                <p>Miêu Tả :${wallet.getDescription()}</p><br>
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
                    <a href="#" id="Delete-link"><button>delete wallet</button></a>
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
                    <a href="/category?action=delete&idCategory=${list.idCategory}&username=${sessionScope['user'].getUserName()}&password=${sessionScope['user'].getPassword()}"><button>delete</button></a>
                </c:forEach>
            </c:if>
        </div>
    </div>
    <div class="right-pane">

    </div>
</main>

<form>
    <p style="text-align: center"> Copyright &copy; 2023 Financial Management Application</p>
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
                window.location.href = "a.jsp";
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
