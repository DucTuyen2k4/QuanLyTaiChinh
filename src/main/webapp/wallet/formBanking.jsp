
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/wallet" method="post">
    <input type="hidden" name="idWallet" value="${wallet.getIdWallet()}"/>
    <p style="color: red">${message}</p>
    Tên tài khoản : <input name="nameWallet" value="${wallet.getNameWallet()}"/><br><br>
    Số dư hiện tại : <input name="money" value="${wallet.getMoney()}"/><br><br>
    Tên ví nhận :  <input name="name" value="" type="text"/><br><br>
    <p style="color: red">${messages}</p>
    Số tiền cần chuyển : <input name="moneyBanking" value="" type="text" id="inputField" />

    <input type="hidden" name="id" value="${sessionScope['user'].getId()}"/>
    <input type="hidden" name="username" value="${sessionScope['user'].getUserName()}"/>
    <input type="hidden" name="password" value="${sessionScope['user'].getPassword()}"/>
    <button style="background-color: blue ;color: white" name="action" value="confirmBanking" onclick="onclick()">chuyển tiền</button>
</form>

<script>
    function onclick(){
        var input = document.getElementById("inputField").value;
        if (input<0){
           alert("vui long khong nhap so am") ;
        }
    }
</script>

</body>
</html>
