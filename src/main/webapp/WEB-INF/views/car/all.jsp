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
<body class="add">
<div>
    <table>
        <thead>
        <th class="addTd">Nazwa marki:</th>
        <th class="addTd">Model:</th>
        <th class="addTd">Zdjęcie:</th>
        <th class="addTd">Edycja</th>
        <th class="addTd">Usuwanie</th>
        </thead>
        <tbody>
        <c:forEach items="${cars}" var="item">
            <tr>
                <td class="addTd">${item.manufacturer.name}</td>
                <td class="addTd">${item.carModel.name}</td>
                <td class="addTd"><img src="/images/${item.imageLink}" alt="zdjęcie" width="100" height="100"></td>
                <td class="addTd"><a href="/car/edit/${item.id}" class="btn btn-info" role="button">Edytuj</a></td>
                <td class="addTd"><a href="/car/delete/${item.id}" class="btn btn-info" role="button">Usuń</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="/homePage">Wróć na stronę główną</a>

    <a href="/car/add">Dodaj kolejny</a>

</div>
</body>
</html>
