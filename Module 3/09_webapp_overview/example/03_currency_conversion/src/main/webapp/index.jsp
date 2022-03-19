<%--
  Created by IntelliJ IDEA.
  User: phan_
  Date: 16/03/2022
  Time: 21:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>convert_currency</title>
  </head>
  <body>
  <div>
    <h2>
      Currency Converter
    </h2>
    <form action="/convert" method="post">
      <p>Rate:</p>
      <input type="text" name="rate">
      <p>USD:</p>
      <input type="text" name="usd">
      <button type="submit">Converter</button>
    </form>
  </div>
  </body>
</html>
