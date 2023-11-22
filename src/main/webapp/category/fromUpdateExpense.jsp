<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 11/21/2023
  Time: 2:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/expense?action=updateExpense">
    <c:forEach var="expense" items="${expense}">
        <p>davao</p>

        <input name="nameExpense" value="${expense.nameExpense}">
        <input  name="money1" value="${expense.money}" type="hidden">
        <input  name="money2" value="${expense.money}">
        <input type="date" id="timeInput" name="time" value="${expense.time}" required>
        <input name="note" value="${expense.note}">
        <input name="wallet_id" value="${expense.wallet_id}" type="hidden" >

        <c:forEach items="${category}" var="list">
            <input  name="idCategory" value="${list.idCategory}" type="hidden"/>
        </c:forEach>
        <input name="idExpense" value="${expense.idExpense}" type="hidden" >
        <input type="hidden" name="username" value="${sessionScope['user'].getUserName()}"/>
        <input type="hidden" name="password" value="${sessionScope['user'].getPassword()}"/>

<%--        <c:forEach items="${wallet}" var="out">--%>
<%--            <button id="myButton${out.idWallet}" value="${out.idWallet}"--%>
<%--                    onclick="setInputValue(event, ${out.idWallet})">${out.nameWallet}</button>--%>
<%--        </c:forEach>--%>
        <button type="submit">update</button>
    </c:forEach>

</form>
</body>
</html>
