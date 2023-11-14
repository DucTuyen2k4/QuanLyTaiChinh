<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Media
  Date: 11/8/2023

  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/category?action=CategoryUpdate" method="post">
<c:forEach var="list" items="${listCategory}">
<input type="text" name="nameCategory" value="${list.nameCategory}" >
<input type="text" name="note" value="${list.note}" >
    <input type="hidden" name="idCategory" value="${list.idCategory}"/>
    <button type="submit">oci</button>
    <input type="hidden" name="username" value="${sessionScope['user'].getUserName()}"/>

    <input type="hidden" name="password" value="${sessionScope['user'].getPassword()}"/>
</c:forEach>
</form>
</body>
</html>