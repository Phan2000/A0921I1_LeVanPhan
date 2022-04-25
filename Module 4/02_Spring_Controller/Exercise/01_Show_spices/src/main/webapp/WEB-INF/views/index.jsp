<%--
  Created by IntelliJ IDEA.
  User: phan_
  Date: 22/04/2022
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Convert Currency</title>
</head>
<body>
<form action="/calculator" method="post">
    <h1>Calculator</h1>
    <input type="text" name="num_1">
    <input type="text" name="num_2">
    <select name="select">
        <option value="+">Add</option>
        <option value="-">Sub</option>
        <option value="*">Mul</option>
        <option value=":">Div</option>
    </select>
    <input type="text" value="${result}">
    <input type="submit" value="Cal">
</form>
</body>
</html>
