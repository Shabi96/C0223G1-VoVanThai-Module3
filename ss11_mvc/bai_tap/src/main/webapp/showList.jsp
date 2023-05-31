<%--
  Created by IntelliJ IDEA.
  User: 84912
  Date: 5/31/2023
  Time: 1:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="row" style="text-align: center">
    <h1>DANH SÁCH SẢN PHẨM</h1>
</div>
<div class="row">
    <div class="col-2"></div>
    <div class="col-8">
        <a href="/product?action=showCreateForm">Thêm mới</a>
        <form>
            <table border="1">
                <tr>
                    <th>STT</th>
                    <th>TÊN SẢN PHẨM</th>
                    <th>GIÁ SẢN PHẨM</th>
                    <th>MÔ TẢ</th>
                    <th>HÃNG SẢN XUẤT</th>
                    <th>UPDATE</th>
                    <th>DELETE</th>
                </tr>
                <c:forEach var="p" items="${productList}" varStatus="loop">
                    <tr>
                        <td>
                            <c:out value="${loop.count}">
                            </c:out>
                        </td>
                        <td>
                            <c:out value="${p.getName()}"></c:out>
                        </td>
                        <td>
                            <c:out value="${p.getPrice()}"></c:out>
                        </td>
                        <td>
                            <c:out value="${p.getDescribe()}"></c:out>
                        </td>
                        <td>
                            <c:out value="${p.getProducer()}"></c:out>
                        </td>
                        <td>
                            <a href="/product?action=update&id=${p.getId()}">Edit</a>
                        </td>
                        <td>
                            <a href="/product?action=delete&id=${p.getId()}">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </form>
    </div>
    <div class="col-2"></div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
