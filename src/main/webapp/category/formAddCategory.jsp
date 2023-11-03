<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 03/11/2023
  Time: 09:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/category" method="post">
    <p style="color: red">${message}</p>
    Tên danh mục :  <input name="nameCategory" type="text" required/><br><br>
    Ghi chú : <input type="text" name="note" required/><br><br>
    <button name="action" value="confirmCategory" >Xác nhận</button>

    <input type="hidden" name="id" value="${sessionScope['user'].getId()}"/>
    <input type="hidden" name="username" value="${sessionScope['user'].getUserName()}"/>
    <input type="hidden" name="password" value="${sessionScope['user'].getPassword()}"/>
</form>
</body>
</html>
