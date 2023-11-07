<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Wallet</title>

    <!-- Bao gồm các tệp CSS và JavaScript của Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        body {
            background-color: #f2f2f2;
        }

        .container {
            margin-top: 20px;
            max-width: 500px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            padding: 20px;
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
    <c:forEach var="wallet" items="${listWalletUpdate}">
        <form action="/wallet?action=updateWallet&idWallet=${wallet.getIdWallet()}" method="post">
            <div class="form-group">
                <label >Icon</label>
                <input name="icon" type="text" class="form-control" value="${wallet.getIcon()}">
            </div>
            <div class="form-group">
                <label >Name Wallet</label>
                <input name="nameWallet" type="text" class="form-control" value="${wallet.getNameWallet()}">
            </div>
            <div class="form-group">
                <label >Money</label>
                <input name="money" type="text" class="form-control" value="${wallet.getMoney()}">
            </div>
            <div class="form-group">
                <label >Currency</label>
                <select name="currency" class="form-control">
                    <option value="VND" ${wallet.getCurrency() == 'VND' ? 'selected' : ''}>VND</option>
                    <option value="USD" ${wallet.getCurrency() == 'USD' ? 'selected' : ''}>USD</option>
                </select>
            </div>
            <div class="form-group">
                <label >Description</label>
                <input name="description" type="text" class="form-control" value="${wallet.getDescription()}">
            </div>

            <!-- Thêm các trường ẩn khác ở đây -->
            <input type="hidden" name="username" value="${sessionScope['user'].getUserName()}"/>
            <input type="hidden" name="password" value="${sessionScope['user'].getPassword()}"/>
            <button type="submit" class="btn btn-primary">Update</button>
        </form>
    </c:forEach>
</div>
</body>
</html>