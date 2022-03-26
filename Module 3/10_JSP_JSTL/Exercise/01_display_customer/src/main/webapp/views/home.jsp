<%--
  Created by IntelliJ IDEA.
  User: phan_
  Date: 21/03/2022
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
</head>
<style>
    table {
        width: 70%;
        margin: 0 auto;
        border-collapse: collapse;
    }

    th, td {
        padding: 8px;
        text-align: center;
        border-bottom: solid 1px;
    }

    img {
        width: 100px;
        height: 100px;
    }
    h1 {
        text-align: center;
        font-family: 'DejaVu Sans', Arial, Helvetica, sans-serif;
    }
    h2 {
        text-align: center;
        font-family: 'DejaVu Sans', Arial, Helvetica, sans-serif;
    }
</style>
<body>
<h2>
    Customer List
</h2>
<table>
    <tr>
        <th>Name</th>
        <th>Date</th>
        <th>Address</th>
        <th>Images</th>
    </tr>
    <c:forEach items="${listCustomer}" var="customer">
        <tr>
            <td>${customer.name}</td>
            <td>${customer.birthday}</td>
            <td>${customer.address}</td>
            <td>${customer.images}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

