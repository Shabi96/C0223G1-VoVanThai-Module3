<%--
  Created by IntelliJ IDEA.
  User: 84912
  Date: 6/1/2023
  Time: 11:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/user?action=edit" method="post">
    <label>
        ID:
    </label>
    <input type="text" name="id" value="${user.getId()}" readonly><br>
    <label>
        Nhập tên mới:
    </label>
    <input type="text" name="name" value="${user.getName()}"><br>
    <label>
        Nhập email mới:
    </label>
    <input type="text" name="email" value="${user.getEmail()}"><br>

    <label>
        Nhập quốc gia mới:
    </label>
    <input type="text" name="country" value="${user.getCountry()}"><br>
    <button type="submit">Sửa</button>
</form>
</body>
</html>
