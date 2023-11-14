<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/9b0347940d.js" crossorigin="anonymous"></script>

</head>
<body>
<div>
    <div>
        <form method="post" action="/wallet">

            Nhập emai cần cấp quyền
            <br>
            <input type="text" name="email"/><br>
            Lựa chọn quyền
            <select name="permission">
                <option value="owner"> anew</option>
                <option value="viewer">viewer</option>
            </select>

            <button style="background-color: blue ;color: white" name="action" value="share">share</button>
            <input type="text" name="idWallet" value="${id}"/>
            <input type="hidden" name="username" value="${sessionScope['user'].getUserName()}"/>
            <input type="hidden" name="password" value="${sessionScope['user'].getPassword()}"/>
        </form>

    </div>
</div>

</body>
</html>