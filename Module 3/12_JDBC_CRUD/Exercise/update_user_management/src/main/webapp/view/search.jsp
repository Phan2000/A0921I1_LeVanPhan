<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: phan_
  Date: 01/04/2022
  Time: 19:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search result</title>
</head>
<body>
<c:forEach var="user" items="${listUser}">
    <table>
        <tr>User ID  : <c:out value="${user.id}"/></tr>
        <tr>User Name: <c:out value="${user.name}"/></tr>
        <tr>User Mail:<c:out value="${user.email}"/></tr>
        <tr>Country  :<c:out value="${user.country}"/></tr>
    </table>
</c:forEach>
</body>
</html>
