<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>Result:</h1>

    <c:if test="${not empty error}">
        <h3>Error: ${error}</h3>
    </c:if>

    <c:if test="${empty error}">
        <p>${aValue} ${operator} ${bValue} = ${result}</p>
    </c:if>

</body>
</html>
