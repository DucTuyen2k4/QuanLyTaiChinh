<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 10/30/2023
  Time: 1:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<body>
<c:forEach items="${listWallet}" var="item">
<form method="post" action="/WalletServlet?action=showDisUpdate&idWallet=${item.idWallet}">
  <p>icon<input type="text" name="icon" value="${item.icon}"></p>
  <p>nameWallet<input type="text"  name="nameWallet" value="${item.nameWallet}"></p>
  <p>money<input type="text" name="money" value="${item.money}"></p>
  <p>currency<input type="text" name="currency" value="${item.currency}"></p>
  <p>description<input type="text" name="description" value="${item.description} "></p>
  <input type="submit" value="disUpdate">
 </form>
  <form  action="/WalletServlet?action=transferMoney&idWallet=${item.idWallet}" method="get">
    <input type="submit" value="Transfer Money">
  </form>
  </c:forEach>
</body>
</html>
