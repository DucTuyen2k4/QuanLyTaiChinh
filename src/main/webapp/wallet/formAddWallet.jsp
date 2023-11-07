<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm mới ví</title>

    <!-- Bao gồm Bootstrap 5 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/9b0347940d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://kit.fontawesome.com/9b0347940d.js" crossorigin="anonymous">
    <style>
        .container {
            max-width: 600px;
            margin: 0 auto;
            margin-top: 20px;
        }

        .setting {
            background-color: #d7c6c6;
            padding: 20px;
            border-radius: 5px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .btn-primary {
            background-color: #007bff;
            color: #fff;
        }
    </style>
</head>
<body>
<div class="container">
    <form action="/wallet" method="get">
        <div class="dropdown">
            <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                Dropdown button
            </button>
            <ul class="dropdown-menu">
                <li><i class="fas fa-poo"></i></li>
                <li><i class="fas fa-poo"></i></li>
                <li><i class="fas fa-poo"></i></li>
            </ul>
        </div>
        <div class="setting">
            <h2>Thêm mới một ví</h2>
            <div class="form-group">
                <label >Icon</label>
                <input type="text" name="icon" class="form-control">
            </div>
            <div class="form-group">
                <label >Name</label>
                <input type="text" name="nameWallet" class="form-control">
            </div>
            <div class="form-group">
                <label >Money</label>
                <input type="number" name="money" class="form-control">
            </div>
            <div class="form-group">
                <label >Currency</label>
                <select name="currency" class="form-control">
                    <option value="VND">VND</option>
                    <option value="USD">USD</option>
                </select>
            </div>
            <div class="form-group">
                <label >Description</label>
                <input type="text" name="description" class="form-control">
            </div>

            <input type="hidden" name="id" value="${sessionScope['user'].getId()}"/>
            <input type="hidden" name="username" value="${sessionScope['user'].getUserName()}"/>
            <input type="hidden" name="password" value="${sessionScope['user'].getPassword()}"/>
            <button name="action" value="addWallet" class="btn btn-primary">Xác nhận</button>
        </div>
    </form>
</div>
</body>
</html>