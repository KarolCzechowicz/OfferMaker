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
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <title>Success!</title>
</head>
<body class="off">
<div>
    <table>
        <thead>
        <th class="addTd">Samochód:</th>
        <th class="addTd">Zdjęcie:</th>
        <th class="addTd">Od:</th>
        <th class="addTd">Do:</th>
        <th class="addTd">Cena:</th>
        <th class="addTd">Kotakt do klienta:</th>
        <th class="addTd">Utworzona przez:</th>
        <th class="addTd">Utworzono:</th>
        <th class="addTd" id="updated1">Edytowano:</th>
        <th class="addTd">Widok pliku:</th>
        <th class="addTd">Edycja</th>
        <th class="addTd">Usuwanie</th>
        </thead>
        <tbody>
        <c:forEach items="${offers}" var="item">
            <tr>
                <td class="addTd">${item.car.manufacturer.name} ${item.car.carModel.name}</td>
                <td class="addTd"><img src="/images/${item.car.imageLink}" alt="zdjęcie" width="80" height="60"></td>
                <td class="addTd">${item.dateFrom}</td>
                <td class="addTd">${item.dateTo}</td>
                <td class="addTd">${item.price}</td>
                <td class="addTd">${item.customerEmail}</td>
                <td class="addTd">${item.userLogin}</td>
                <td class="addTd">${item.created}</td>
                <td class="addTd" id="updated2">${item.updated}</td>
                <td class="addTd"><a href="/offer/view/${item.id}" class="btn btn-info" role="button">Widok</a></td>
                <td class="addTd"><a href="/offer/edit/${item.id}" class="btn btn-info" role="button">Edytuj</a></td>
                <td class="addTd"><a href="/offer/delete/${item.id}" class="btn btn-info" role="button">Usuń</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="/homePage">Wróć na stronę główną</a>

    <a href="/offer/add">Dodaj kolejną ofertę</a>

</div>
<script src="/js/offer.js" type="text/javascript"></script>
</body>
</html>
