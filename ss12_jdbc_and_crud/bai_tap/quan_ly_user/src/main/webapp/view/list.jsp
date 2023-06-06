<%--
  Created by IntelliJ IDEA.
  User: 84912
  Date: 6/1/2023
  Time: 11:30 AM
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
    <title>List User</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="row">
    <div class="col-3"></div>
    <div class="col-6" style="text-align: center">
        <h2>USER MANAGEMENT</h2>
        <form action="/user" method="get">
            <label for="search">
                Tìm kiếm theo quốc gia:
            </label>
            <input type="hidden" name="action" value="search">
            <input type="text" name="name" id="search">
            <button type="submit">TÌM</button>
        </form>
        <form>
            <a href="/user?action=create" role="button" class="btn btn-outline-danger">Thêm mới User</a>
            <table border="1" class="table table-active table-striped table-bordered" id="tableStudents" style="width: 100%">
                <tr>
                    <th>STT</th>
                    <th>TÊN</th>
                    <th>EMAIL</th>
                    <th>QUỐC GIA</th>
                    <th>SỬA</th>
                    <th>XÓA</th>
                </tr>
                <c:forEach var="user" items="${userList}" varStatus="loop">
                    <tr>
                        <td>
                            <c:out value="${loop.count}"/>
                        </td>
                        <td>
                            <c:out value="${user.getName()}"/>
                        </td>
                        <td>
                            <c:out value="${user.getEmail()}"/>
                        </td>
                        <td>
                            <c:out value="${user.getCountry()}"/>
                        </td>
                        <td>
                            <a href="/user?action=edit&id=${user.getId()}">Sửa</a>
                        </td>
                        <td>
                            <button type="button" class="btn btn-primary btn-lg"
                                    data-bs-toggle="modal"
                                    data-bs-target="#modelId"
                                    onclick="remove('${user.getId()}', '${user.getName()}')">
                                Xóa
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </form>
    </div>
    <div class="col-3"></div>
</div>
<!-- Modal -->
<div class="modal fade" id="modelId" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modelTitleId"></h4>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <h3>Bạn có chắc chắn xóa học viên có tên:
                    <span style="color:red" id="nameDelete"></span>
                </h3>
            </div>
            <div class="modal-footer">
                <form action="/user?action=delete" method="post">
                    <input type="hidden" name="idDelete" id="idDelete">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous">
</script>

<script>
    $(document).ready(function () {
        $('#tableUsers').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 2
        });
    });
    function remove(id, name) {
        document.getElementById("nameDelete").innerText = name;
        document.getElementById("idDelete").value = id;
    }

</script>
</body>
</html>
