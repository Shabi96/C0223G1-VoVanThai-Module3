<%--
  Created by IntelliJ IDEA.
  User: 84912
  Date: 5/31/2023
  Time: 1:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EDIT</title>
</head>
<body>
<form action="/product?action=update" method="post">
    <div>
        <label for="idProduct">
            Nhập id:
        </label>
        <input type="text" name="idProduct" id="idProduct" value="${product.getId()}" readonly>
    </div>
    <div>
        <label for="nameProduct">
            Nhập tên:
        </label>
        <input type="text" name="nameProduct" id="nameProduct" value="${product.getName()}">
    </div>
    <div>
        <label for="price">
            Nhập giá:
        </label>
        <input type="text" name="price" id="price" value="${product.getPrice()}">
    </div>
    <div>
        <label for="describe">
            Nhập mô tả:
        </label>
        <input type="text" name="describe" id="describe" value="${product.getDescribe()}">
    </div>
    <div>
        <label for="producer">
            Nhập hãng sản xuất:
        </label>
        <input type="text" name="producer" id="producer" value="${product.getProducer()}">
    </div>
    <div>
        <button type="submit">Sửa</button>
    </div>
</form>
</body>
</html>
