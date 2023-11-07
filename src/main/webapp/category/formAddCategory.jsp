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