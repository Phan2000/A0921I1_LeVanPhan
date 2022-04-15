<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: phan_
  Date: 14/04/2022
  Time: 23:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <h1>Employee Management</h1>
    <h2>
        <a href="/employees?action=create">Add New Employee</a>
    </h2>
</center>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Employee</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Date of birth</th>
            <th>Indentify card number</th>
            <th>Salary</th>
            <th>Phone number</th>
            <th>Email</th>
            <th>Address</th>
            <th>Position ID</th>
            <th>Qualification ID</th>
            <th>Part ID</th>
            <th>Actions</th>
        </tr>
        <c:forEach  items="${listEmployee}" var="employee">
            <tr>
                <td><c:out value="${employee.manhanvien}"/></td>
                <td><c:out value="${employee.hoten}"/></td>
                <td><c:out value="${employee.ngaysinh}"/></td>
                <td><c:out value="${employee.socmnd}"/></td>
                <td><c:out value="${employee.luong}"/></td>
                <td><c:out value="${employee.sodienthoai}"/></td>
                <td><c:out value="${employee.email}"/></td>
                <td><c:out value="${employee.diachi}"/></td>
                <td><c:out value="${employee.maViTri}"/></td>
                <td><c:out value="${employee.maTrinhDo}"/></td>
                <td><c:out value="${employee.maBoPhan}"/></td>
                <td>
                    <a href="/employees?action=edit&id=${employee.manhanvien}">Edit</a>
                    <a href="/employees?action=delete&id=${employee.manhanvien}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
