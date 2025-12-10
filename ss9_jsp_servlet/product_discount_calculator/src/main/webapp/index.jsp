<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h2>Product Discount Calculator</h2>

<form action="display-discount" method="post">
    <label>Product Description:</label><br>
    <input type="text" name="productDescription" required><br><br>

    <label>List Price: </label><br>
    <input type="number" step="0.01" name="listPrice" required><br><br>

    <label>Discount Percent: </label><br>
    <input type="number" step="0.01" name="discountPercent" required><br><br>

    <button type="submit">Calculate Discount</button>
</form>

</body>
</html>