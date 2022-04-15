<%--
  Created by IntelliJ IDEA.
  User: phan_
  Date: 14/04/2022
  Time: 21:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home FRM</title>
    <script src="/lib/bootstrap-4.6.1-dist/jquery-3.0.0.min.js"></script>
    <link rel="stylesheet" href="/lib/bootstrap-4.6.1-dist/css/bootstrap.min.css">
    <script src="/lib/bootstrap-4.6.1-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="lib/style.css">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-2">
            <img id="img" src="img/FURAMA.png">
        </div>
        <div class="col-10" >
            <p>NGUYEN VAN ANH</p>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-8" id="body">
            <div class="row">
                <div class="col-sm-2">
                    <a href="/home.jsp">Home</a>
                     </div>

            <div class="col-sm-2">
                <a href='/employees?action=""'>Employee</a>
            </div>

                <div class="col-sm-2">
                    <a href="#">Customer</a>
                </div>

                    <div class="col-sm-2">
                        <a href="">Service</a>
                    </div>

                    <div class="col-sm-4">
                        <a href="">Contract</a>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <nav class="navbar navbar-light bg-light">
                <form class="form-inline">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </nav>
        </div>
    </div>
</div>
</body>
</html>
