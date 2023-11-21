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
<form method="post" action="/expense">
    <c:forEach var="expense" items="${expense}">
        <p>davao</p>

        <input name="nameExpense" value="${expense.nameExpense}">
        <input  name="money" value="${expense.money}">
        <input type="datetime-local" id="timeInput" name="time" value="${expense.time}" required>
        <input name="note" value="${expense.note}">
        <c:forEach items="${category}" var="list">
            <input type="hidden" name="idCategory" value="${list.idCategory}"/>
        </c:forEach>
        <input name="idExpense" value="${expense.idExpense}" type="hidden">
        <input type="hidden" name="username" value="${sessionScope['user'].getUserName()}"/>
        <input type="hidden" name="password" value="${sessionScope['user'].getPassword()}"/>
        <button name="action" value="updateExpense">update</button>
    </c:forEach>

</form>
</body>
</html>
