<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: karol
  Date: 08.01.19
  Time: 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="/css/style.css" rel="stylesheet">
    <title>Success!</title>
</head>
<body class="add">
<div>
    <table>
        <thead>
        <th class="addTd">Samochód:</th>
        <th class="addTd">Od:</th>
        <th class="addTd">Do:</th>
        <th class="addTd">Cena:</th>
        <th class="addTd">Dodatkowe informacje:</th>
        <th class="addTd">Zdjęcie:</th>
        <th class="addTd">Edycja</th>
        <th class="addTd">Usuwanie</th>
        </thead>
        <tbody>
        <c:forEach items="${offers}" var="item">
            <tr>
                <td class="addTd">${item.car.manufacturer.name}</td>
                <td class="addTd">${item.dateFrom}</td>
                <td class="addTd">${item.dateTo}</td>
                <td class="addTd">${item.price}</td>
                <td class="addTd">${item.info}</td>
                <td class="addTd"><img src="/images/${item.car.imageLink}" alt="zdjęcie" width="100" height="100"></td>
                <td class="addTd"><a href="/offer/edit/${item.id}" class="btn btn-info" role="button">Edytuj</a></td>
                <td class="addTd"><a href="/offer/delete/${item.id}" class="btn btn-info" role="button">Usuń</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="/homePage">Wróć na stronę główną</a>

    <a href="/offer/add">Dodaj kolejną ofertę</a>

</div>
</body>
</html>
