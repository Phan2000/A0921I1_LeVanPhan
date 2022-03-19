<%--
  Created by IntelliJ IDEA.
  User: phan_
  Date: 16/03/2022
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <style type="text/css">
      .login {
        height:180px; width:270px;
        margin:0;
        padding:10px;
        border:1px #CCC solid;
      }
      .login input {
        padding:5px; margin:5px;
        border-radius: 10px;
        border: solid 2px;
      }
      .login h2 {
        padding:3px; margin:3px
      }

      .login button {
        padding:5px; margin:5px ;
        width:57px; height: 29px;
        background-color: #CCCCCC;
        border-radius: 5px;
      }

    </style>
  </head>
  <body>
  <form method="get" action="/login">
    <div class="login">
      <h2>Login</h2>
      <input type="text" name="username" size="30"  placeholder="username" />
      <input type="password" name="password" size="30" placeholder="password" />
      <button type="submit" value="Sign in"/>Sign In
    </div>
  </form>
  </body>
</html>
