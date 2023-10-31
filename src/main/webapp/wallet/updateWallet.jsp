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
<c:forEach var="item" items="${listWalletUpdate}">
    <form action="/wallet?action=updateWallet&id=${item.getIdWallet()}" method="post">
    <input type="text" name="icon" value="${item.getIcon()}"/>
    <input type="text" name="nameWallet" value="${item.getNameWallet()}"/>
    <input type="text" name="money" value="${item.getMoney()}"/>
    <select name="currency">
        <c:choose>
            <c:when test="${item.getCurrency() == 'VND'}">
                <option value="VND" selected>VND</option>
                <option value="USD">USD</option>
            </c:when>
            <c:when test="${item.getCurrency() == 'USD'}">
                <option value="VND">VND</option>
                <option value="USD" selected>USD</option>
            </c:when>
            <c:otherwise>
                <option value="VND">VND</option>
                <option value="USD">USD</option>
            </c:otherwise>
        </c:choose>
    </select>
    <input type="text" name="description" value="${item.getDescription()}"/>
        <input type="submit" value="update">
    </form>
</c:forEach>


</body>
</html>
