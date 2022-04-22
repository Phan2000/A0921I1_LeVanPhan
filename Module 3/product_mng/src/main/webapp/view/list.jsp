<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: phan_
  Date: 18/04/2022
  Time: 19:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Show Product</title>
    <script src="/lib/bootstrap-4.6.1-dist/jquery-3.0.0.min.js"></script>
    <link rel="stylesheet" href="/lib/bootstrap-4.6.1-dist/css/bootstrap.min.css">
    <script src="/lib/bootstrap-4.6.1-dist/js/bootstrap.min.js"></script>
</head>
<body>
</center>
<div align="center">
    <caption><a href="/products?action=create">Add New Product</a></caption>
    <caption><h2>List of Products</h2></caption>
    <table class="table" border="1" cellpadding="5" style="width: 70%">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Discount</th>
            <th>Stock</th>
        </tr>
        <c:forEach var="product" items="${listProduct}">
            <tr>
                <td><c:out value="${product.id}"/></td>
                <td><c:out value="${product.name}"/></td>
                <td><c:out value="${product.price}"/></td>
                <td><c:out value="${product.discount}"/></td>
                <td><c:out value="${product.stock}"/></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
