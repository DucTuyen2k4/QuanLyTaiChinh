<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 21/10/2023
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/user" method="post">
    <c:forEach var="list" items="${list}">
        <input type="hidden" name="id" value="${list.id}"/>
        Ảnh : <input type="text" name="image" value="${list.image}"/>
        Tên hiển thị : <input type="text" name="fullName" value="${list.fullName}"/>
        SĐT : <input type="text" name="phoneNumber" value="${list.phoneNumber}"/>
        Email : <input type="text" name="email" value="${list.email}"/>
        <button name="action" value="confirmUpdate">Xác nhận</button>
    </c:forEach>
</form>

</body>
</html>
