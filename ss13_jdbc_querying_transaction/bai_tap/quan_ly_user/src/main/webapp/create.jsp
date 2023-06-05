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
    <title>CREATE</title>
</head>
<body>
<form action="/user?action=create" method="post">
    <label>
        Nhập tên:
    </label>
    <input type="text" name="name"><br>
    <label>
        Nhập Email:
    </label>
    <input type="text" name="email"><br>
    <label>
        Nhập Quốc gia:
    </label>
    <input type="text" name="country"><br>
    <button type="submit">Thêm</button>
</form>
</body>
</html>
