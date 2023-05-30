<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>CALCULATOR</title>
</head>
<body>
<h1><%= "Simple Calculator" %>
</h1>
<br/>
<form action="/CalculatorServlet" method="post">
    <fieldset>
        <legend>Calculator</legend>
        <div>
            <label for="first">
                First Operand:
            </label>
            <input type="text" name="FirstOperand" id="first" style="margin-left: 18px">
        </div>
        <div>
            <label for="operator">
                Operator:
            </label>
            <select name="operator" id="operator" style="margin-left: 50px">
                <option value="Addition">Addition</option>
                <option value="Subtraction">Subtraction</option>
                <option value="Division">Division</option>
                <option value="Multiplication">Multiplication</option>
            </select>
        </div>
        <div>
            <label for="second">
                Second Operand:
            </label>
            <input type="text" name="SecondOperand" id="second">
        </div>
        <div>
            <button type="submit">Calculate</button>
        </div>
    </fieldset>
</form>
<h2>Result: ${result}</h2>
</body>
</html>