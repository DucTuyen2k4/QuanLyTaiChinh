<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 10/30/2023
  Time: 1:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach items="${listWallet}" var="item">
    <c:choose>
        <c:when test="${item.type == 'Type1'}">
            <!-- Hiển thị ví loại 1 -->
            <form method="post" action="/WalletServlet?action=showDisUpdate&idWallet=${item.idWallet}">
                <!-- Các trường ví loại 1 -->
                <input type="submit" value="disUpdate">
            </form>
            <form action="/WalletServlet?action=transferMoney&idWallet=${item.idWallet}" method="get">
                <input type="submit" value="Transfer Money">
            </form>
        </c:when>
        <c:when test="${item.type == 'Type2'}">
            <!-- Hiển thị ví loại 2 -->
            <form method="post" action="/WalletServlet?action=showDisUpdate&idWallet=${item.idWallet}">
                <!-- Các trường ví loại 2 -->
                <input type="submit" value="disUpdate">
            </form>
            <form action="/WalletServlet?action=transferMoney&idWallet=${item.idWallet}" method="get">
                <input type="submit" value="Transfer Money">
            </form>
        </c:when>
    </c:choose>
</c:forEach>
</body>
</html>
