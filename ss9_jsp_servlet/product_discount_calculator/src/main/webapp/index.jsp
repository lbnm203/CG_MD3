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
    <input type="text" name="productDescription"><br><br>

    <label>List Price: </label><br>
    <input type="text" name="listPrice"><br><br>

    <label>Discount Percent: </label><br>
    <input type="text" name="discountPercent"><br><br>

    <button type="submit">Calculate Discount</button>
    <p>${message}</p>
</form>

</body>
</html>