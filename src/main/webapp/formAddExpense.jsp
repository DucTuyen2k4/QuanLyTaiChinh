<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Expense Details</title>
</head>
<body>
<form action="/category" method="post">
    <input name="name" type="text" />
    <input name="money" type="text" />
    <input name="note" type="text" />

    <button name="action" value="addExpense">xac nhan</button>

    <input type="hidden" name="id" value="${sessionScope['user'].getId()}"/>
    <input type="hidden" name="username" value="${sessionScope['user'].getUserName()}"/>
    <input type="hidden" name="password" value="${sessionScope['user'].getPassword()}"/>
</form>
</body>
</html>
