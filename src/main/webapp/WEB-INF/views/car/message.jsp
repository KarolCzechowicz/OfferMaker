<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: karol
  Date: 09.01.19
  Time: 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <title>Error Messages</title>
</head>
<body class="add">
<div>
    <h1>Lista błędów</h1>

    <c:forEach items="${violations}" var="item">

        Pole: ${item.getPropertyPath()}, komunikat: ${item.getMessage()}<br>

    </c:forEach>
</div>
</body>
</html>
