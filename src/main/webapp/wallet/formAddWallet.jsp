
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/9b0347940d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<form action="/wallet?username=${sessionScope['user'].getUserName()}&password=${sessionScope['user'].getPassword()}&id=${sessionScope['user'].getId()}  " method="get">
    <ul>
        <li><i class="fa-solid fa-poo"></i></li>
        <li><i class="fa-solid fa-poo"></i></li>
        <li><i class="fa-solid fa-poo"></i></li>
    </ul>

    <input type="text" name="icon"/>

    <input type="text" name="nameWallet"/>
    <input type="number" name="money" />
    <select name="currency">
        <option value="VND">VND</option>
        <option value="USD">USD</option>
    </select>
    <input type="text" name="description"/>
    <input type="hidden" name="id" value="${sessionScope['user'].getId()}"/>
    <input type="hidden" name="username" value="${sessionScope['user'].getUserName()}"/>
    <input type="hidden" name="password" value="${sessionScope['user'].getPassword()}"/>
    <button name="action" value="addWallet">xac nhan</button>
</form>
</body>
</html>