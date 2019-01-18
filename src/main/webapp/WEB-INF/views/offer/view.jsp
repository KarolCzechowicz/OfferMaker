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
<body class="vie">
<div>
    <table>
        <thead>
        <th class="addTd">Samochód:</th>
        <th class="addTd">Zdjęcie:</th>
        <th class="addTd">Od:</th>
        <th class="addTd">Do:</th>
        <th class="addTd">Cena:</th>
        </thead>
        <tbody>
            <tr>
                <td class="addTd">${offer.car.manufacturer.name} ${offer.car.carModel.name}</td>
                <td class="addTd"><img src="/images/${offer.car.imageLink}" alt="zdjęcie" width="80" height="60"></td>
                <td class="addTd">${offer.dateFrom}</td>
                <td class="addTd">${offer.dateTo}</td>
                <td class="addTd">${offer.price}</td>
            </tr>
        </tbody>
    </table>

    <a href="/offer/all">Powrót</a>

    <a>Zapisz PDF</a>

    <a>Wyślij</a>

</div>
</body>
</html>
