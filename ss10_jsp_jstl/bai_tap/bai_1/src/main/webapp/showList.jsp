<%--
  Created by IntelliJ IDEA.
  User: 84912
  Date: 5/30/2023
  Time: 11:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2 style="text-align: center">DANH SÁCH KHÁCH HÀNG</h2>
<form>
    <table border="1" style="text-align: center; margin-left: 420px">
        <tr>
            <th>STT</th>
            <th>Tên</th>
            <th>Ngày sinh</th>
            <th>Địa chỉ</th>
            <th>Ảnh</th>
        </tr>
        <c:forEach var="c" items="${list}" varStatus="loop">
            <tr>
                <td>
                    <c:out value="${loop.count}"/>
                </td>
                <td>
                    <c:out value="${c.name}"/>
                </td>
                <td>
                    <c:out value="${c.dayOfBirth}"/>
                </td>
                <td>
                    <c:out value="${c.address}"/>
                </td>
                <td>
                    <img src="<c:out value="${c.image}"/>" style="width: 50px; height: 70px">
                </td>
            </tr>
        </c:forEach>
    </table>
</form>

</body>
</html>
