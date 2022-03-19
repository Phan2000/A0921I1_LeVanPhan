<%--
  Created by IntelliJ IDEA.
  User: phan_
  Date: 18/03/2022
  Time: 20:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
    <form action="/discount" method="post">
      <label>Product description: </label>
      <label>
        <input type="text" name="description">
      </label>
      <label>List Price: </label>
      <label>
        <input type="text" name="price">
      </label>
      <label>Discount percent: </label>
      <label>
        <input type="text" name="discount">
      </label>
      <button type="submit">Calculator discount</button>
    </form>
  </body>
</html>
