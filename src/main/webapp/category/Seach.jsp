<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Expense List</title>
</head>
<body>
<h2>Expense List</h2>
<table border="1">
  <thead>
  <tr>
    <th>ID</th>
    <th>Name</th>
    <th>Money</th>
    <th>Time</th>
    <th>Note</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="expense" items="${expenses}">
    <tr>
      <td>${expense.idExpense}</td>
      <td>${expense.nameExpense}</td>
      <td>${expense.money}</td>
      <td>${expense.time}</td>
      <td>${expense.note}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</body>
</html>
