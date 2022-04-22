<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: phan_
  Date: 15/04/2022
  Time: 18:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sach benh an</title>
<%--    <script src="/lib/bootstrap-4.6.1-dist/jquery-3.0.0.min.js"></script>--%>
<%--    <link rel="stylesheet" href="/lib/bootstrap-4.6.1-dist/css/bootstrap.min.css">--%>
<%--    <script src="/lib/bootstrap-4.6.1-dist/js/bootstrap.min.js"></script>--%>
</head>
<body>
</center>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>Danh Sach Benh An</h2></caption>
        <tr>
            <th>Ma benh an</th>
            <th>Ma benh nhan</th>
            <th>Ten benh nhan</th>
            <th>Ngay nhap vien</th>
            <th>Ngay xuat vien</th>
            <th>Ly do nhap vien</th>
            <th>Tac vu</th>
        </tr>
        <c:forEach var="benh_an" items="${benhAnList}">
            <tr>
                <td><c:out value="${benh_an.maBenhAn}"/></td>
                <td><c:out value="${benh_an.maBenhNhan}"/></td>
                <td><c:out value="${benh_an.tenBenhNhan}"/></td>
                <td><c:out value="${benh_an.ngayNhapVien}"/></td>
                <td><c:out value="${benh_an.ngayRaVien}"/></td>
                <td><c:out value="${benh_an.lyDoNhapVien}"/></td>
                <td>
                    <a href="/homes?action=edit&id=${benh_an.maBenhAn}">Edit</a>
                    <a href="/homes?action=delete&id=${benh_an.maBenhAn}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
