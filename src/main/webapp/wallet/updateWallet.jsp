<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Wallet</title>

    <!-- Bao gồm các tệp CSS và JavaScript của Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/9b0347940d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

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