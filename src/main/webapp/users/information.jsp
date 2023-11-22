<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <form action="/expense" method="post">
        <label for="information">Tu ngay:</label>
        <input type="date" id="information" name="information">
        <label for="information1">Tu ngay:</label>
        <input type="date" id="information1" name="information1">
        <input type="hidden" name="idCategory" value="${id}">
       <input type="hidden" name="username" value="${sessionScope['user'].getUserName()}"/>
        <input type="hidden" name="password" value="${sessionScope['user'].getPassword()}"/>
        <button type="submit" name="action" value="information">search</button>
    </form>
</div>
</body>
</html>
