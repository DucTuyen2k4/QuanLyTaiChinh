<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 11/15/2023
  Time: 10:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/9b0347940d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-color: #eee4e4;
        }

        .header {
            width: 100%;
            height: 5%;
        }

        .logo {
            margin-left: 40px;
            width: 20%;
            height: 10%;
            float: left;
            display: flex;
            margin-top: 5px;
        }

        .menu {
            width: 60%;
            height: 10%;
            float: left;
        }


        .general {
            height: 80%;
        }

        .left {
            float: left;
            width: 20%;
            height: 100%;
        }

        .content {
            float: left;
            width: 60%;
            height: 100%;
        }

        .right {
            float: left;
            width: 20%;
            height: 100%;
        }

        .footer {
            background-color: #c4b4b4;
            width: 100%;
            height: 10%;
            border-radius: 10px 10px 0 0;
            text-align: center;
            color: white;
        }

        p.footer {
            vertical-align: middle;
        }


        .headers {
            float: right;
            margin-right: 25px;
            margin-top: 10px;
        }

        button {
            border-radius: 20px;
        }

        .register {
            height: 100%;
            width: 50%;
            margin-left: 25%;
            border-radius: 10px;
            box-shadow: 0 0 6px 5px #646e6e;
        }
    </style>
</head>
<body>

<div class="all">
    <div class="header">
        <div class="logo">
            <i class="fa-brands fa-wordpress" style="font-size: 60px; color: #8030c9"></i>
            <h5 style="margin-top: 6px">wallet <br>manage</h5>
        </div>
        <div class="menu">
        </div>
        <div class="headers">
        </div>
    </div>
    <hr style="color: black; width: 70%; margin-left: 15%; margin-top: 35px">
    <div class="general">
        <div class="left"></div>
        <div class="content">
            <form action="expense" method="post">
                <div class="register">
                    <h1 style="text-align: center">Add Expense</h1><br>
                    <div class="dropdown-content">
                        <c:forEach var="list" items="${list}">
                            <a class="dropdown-item"
                               href="/wallet?action=ShowWallet&permission=${list.permission}&id=${list.idWallet}&username=${sessionScope['user'].getUserName()}&password=${sessionScope['user'].getPassword()}">
                                <span style="color: black; text-align: center">${list.nameWallet}${list.permission}</span>
                            </a>
                        </c:forEach>
                        <a class="dropdown-item"
                           href="/wallet/formAddWallet.jsp?username=${sessionScope['user'].getUserName()}&password=${sessionScope['user'].getPassword()}&id=${sessionScope['user'].getId()}"
                           style="text-align: center ; color: #1d1e1c">+</a>
                    </div>

                    <p style="margin-left: 17%">name:</p>
                    <input style="border-radius: 10px;width: 70%; margin-left: 17%; padding-left: 10px" name="name"
                           type="text"/>

                    <p style="margin-left: 17%; top: 20px">money :</p>
                    <input name="money" type="text"
                           style="border-radius: 10px;width: 70%; margin-left: 17%; padding-left: 10px">

                    <p style="margin-left: 17%; top: 20px">Note :</p>
                    <input name="note" type="text"
                           style="border-radius: 10px;width: 70%; margin-left: 17%; padding-left: 10px">

                    <input type="hidden" name="id" value="${sessionScope['user'].getId()}"/>
                    <input type="hidden" name="username" value="${sessionScope['user'].getUserName()}"/>
                    <input type="hidden" name="password" value="${sessionScope['user'].getPassword()}"/>
                    <input type="hidden" name="idCategory" value="${idCategory}"/>


<%--                        <label for="timeInput">Current Time:</label>--%>
                    <input type="hidden" id="timeInput" name="time" readonly>
                    <script>
                        // Get the current date and time
                        var currentDate = new Date();

                        // Format the date and time as a string
                        var formattedDateTime =
                            currentDate.getFullYear() + '-' +
                            padZero(currentDate.getMonth() + 1) + '-' +
                            padZero(currentDate.getDate()) + 'T' +
                            padZero(currentDate.getHours()) + ':' +
                            padZero(currentDate.getMinutes());

                        // Set the value of the hidden input field
                        document.getElementById('timeInput').value = formattedDateTime;

                        // Hide the hidden input field
                        document.getElementById('timeInput').style.display = 'none';

                        // Function to pad a single digit number with a leading zero
                        function padZero(number) {
                            return (number < 10) ? '0' + number : number;
                        }
                    </script>
                    <div style="display: flex;">
                        <button name="action" value="addExpense"
                                style="width: 100px; height: 30px;margin-left:36%;background-color: #0735ea;color: white ">
                            Add
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="right"></div>
</div>
</body>
</html>



