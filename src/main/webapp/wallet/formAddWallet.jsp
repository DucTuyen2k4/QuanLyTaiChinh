<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 29/10/2023
  Time: 19:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/wallet?username=${sessionScope['user'].getUserName()}&password=${sessionScope['user'].getPassword()}&id=${sessionScope['user'].getId()}  " method="get">
    <input type="text" name="icon"/>
    <input type="text" name="nameWallet"/>
    <input type="text" name="money"/>
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
