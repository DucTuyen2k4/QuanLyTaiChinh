<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 16/11/2023
  Time: 09:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/wallet" method="post">

    Money :  <input name="money" type="text" /><br><br>
    Wallet :  <input name="wallet" type="text" /><br><br>

    <button name="action" value="addMoney">Confirm</button>
    <input type="hidden" name="username" value="${sessionScope['user'].getUserName()}"/>
    <input type="hidden" name="password" value="${sessionScope['user'].getPassword()}"/>
</form>

</body>
</html>
