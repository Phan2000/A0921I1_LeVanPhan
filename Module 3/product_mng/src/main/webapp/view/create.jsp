<%--
  Created by IntelliJ IDEA.
  User: phan_
  Date: 18/04/2022
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create</title>
    <script src="/lib/bootstrap-4.6.1-dist/jquery-3.0.0.min.js"></script>
    <link rel="stylesheet" href="/lib/bootstrap-4.6.1-dist/css/bootstrap.min.css">
    <script src="/lib/bootstrap-4.6.1-dist/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div class="card">
        <div class="card-header">
            <div class="row">
                <div class="col-md-6">
                    <h3>Add Product</h3>
                </div>
                <div class="col-md-6">
                    <a href="products?action=products">List Product</a>
                </div>
            </div>
        </div>
        <div class="card-body">
            <form action="/products?action=create" method="post">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <strong>Product Name</strong>
                            <input type="text" name="name_product" class="form-control" placeholder="Enter Product Name">
                        </div>
                        <div class="form-group">
                            <strong>Price</strong>
                            <input type="text" name="price" class="form-control" placeholder="Enter Price">
                        </div>
                        <div class="form-group">
                            <strong>Discount</strong>
                            <select name="discount" class="form-select">
                                <option selected>Discount select</option>
                                <option value="5">5</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="20">20</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <strong>Stock</strong>
                            <input type="text" name="stock" class="form-control" placeholder="Enter Stock">
                        </div>
                    </div>
                </div>
                <input type="submit" value="Save" class="btn btn-success mt-2">
            </form>
        </div>
    </div>
</div>
</body>
</html>
