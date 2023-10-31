<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 10/30/2023
  Time: 10:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>davao</p>

    <form action="/wallet?action=updateWallet&idWallet=${wallet.getIdWallet()}&username=${sessionScope['user'].getUserName()}&password=${sessionScope['user'].getPassword()}&id=${sessionScope['user'].getId()}  " method="post">

        <input type="text" name="icon" value="${wallet.getIcon()}"/>
    <input type="text" name="nameWallet" value="${wallet.getNameWallet()}"/>
    <input type="text" name="money" value="${wallet.getMoney()}"/>
    <select name="currency">
        <c:choose>
            <c:when test="">
                <option value="VND" selected>VND</option>
                <option value="USD">USD</option>
            </c:when>
            <c:when test="">
                <option value="VND">VND</option>
                <option value="USD" selected>USD</option>
            </c:when>
            <c:otherwise>
                <option value="VND">VND</option>
                <option value="USD">USD</option>
            </c:otherwise>
        </c:choose>
    </select>
    <input type="text" name="description" value="${wallet.getDescription()}"/>
        <input type="submit" value="update">
        <input type="hidden" name="id" value="${sessionScope['user'].getId()}"/>
        <input type="hidden" name="username" value="${sessionScope['user'].getUserName()}"/>
        <input type="hidden" name="password" value="${sessionScope['user'].getPassword()}"/>
        <input type="submit" value="add" >
    </form>

</body>
</html>
