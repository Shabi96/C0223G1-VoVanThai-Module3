<%--
  Created by IntelliJ IDEA.
  User: 84912
  Date: 5/29/2023
  Time: 1:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<form method="post" action="/CalculatorServlet" style="border: 3px solid blue; text-align: center;">
    <div><h2>Ứng dụng Product Discount Calculator</h2></div>
    <div>
        <label for="Product Description">
            Product Description:
        </label>
        <input type="text" name="Product Description" id="Product Description">
    </div>
    <div>
        <label for="List Price">
            List Price:
        </label>
        <input type="text" name="List Price" id="List Price" style="margin-left: 78px; margin-top: 10px">
    </div>
    <div>
        <label for="Discount Percent">
            Discount Percent:
        </label>
        <input type="text" name="Discount Percent" id="Discount Percent" style="margin-left: 22px; margin-top: 10px">
    </div>
    <input type="submit" name="Discount Amount" style="margin-top: 10px">
</form>
<div>
    <h5>
        Discount Amount: ${result}
    </h5>
</div>
<div>
    <h5>
        Discount Price: ${total}
    </h5>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
