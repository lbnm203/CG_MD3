<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Calculator Page</title>
</head>
<body>
    <h1>Simple Calculator</h1>

    <form action="calculator-servlet" method="POST">
        <p>
            First operand:
            <input type="text" name="first-value" />
        </p>

        <p>
            Operator:
            <select name="operator">
                <option value="add">Addition</option>
                <option value="sub">Subtraction</option>
                <option value="mul">Multiplication</option>
                <option value="div">Division</option>
            </select>
        </p>

        <p>
            Second operand:
            <input type="text" name="second-value" />
        </p>

        <input type="submit" value="Calculate" />
    </form>
</body>
</html>