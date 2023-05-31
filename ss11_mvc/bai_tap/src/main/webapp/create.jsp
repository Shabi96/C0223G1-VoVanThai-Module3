<%--
  Created by IntelliJ IDEA.
  User: 84912
  Date: 5/31/2023
  Time: 1:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/product?action=create" method="post">
    <div>
        <label for="idProduct">
            Nhập id:
        </label>
        <input type="text" name="idProduct" id="idProduct">
    </div>
    <div>
        <label for="nameProduct">
            Nhập tên:
        </label>
        <input type="text" name="nameProduct" id="nameProduct">
    </div>
    <div>
        <label for="price">
            Nhập giá:
        </label>
        <input type="text" name="price" id="price">
    </div>
    <div>
        <label for="describe">
            Nhập mô tả:
        </label>
        <input type="text" name="describe" id="describe">
    </div>
    <div>
        <label for="producer">
            Nhập hãng sản xuất:
        </label>
        <input type="text" name="producer" id="producer">
    </div>
    <div>
        <button type="submit">Thêm</button>
    </div>
</form>
</body>
</html>
