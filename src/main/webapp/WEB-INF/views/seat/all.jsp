<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: karol
  Date: 08.01.19
  Time: 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<html>
<head>
    <link href="/css/style.css" rel="stylesheet">
    <title>Success!</title>
</head>
<body>
<table>
    <thead>
    <th>Ilość miejsc</th>
    <th>Edycja</th>
    <th>Usuwanie</th>
    </thead>
    <tbody>
    <c:forEach items="${seats}" var="item">
        <tr>
            <td>${item.quantity}</td>
            <td><a href="/seat/edit/${item.id}" class="btn btn-info" role="button">Edytuj</a></td>
            <td><a href="/seat/delete/${item.id}" class="btn btn-info" role="button">Usuń</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<a href="/paramPage">Wróć na stronę parametrów</a>

<a href="/homePage">Wróć na stronę główną</a>
</body>
</html>
