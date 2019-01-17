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
        <tr>
            <th colspan="22" class="addTd">Wszystkie samochody</th>
        </tr>
        <tr>
            <th class="allTd">Nazwa marki:</th>
            <th class="allTd">Model:</th>
            <th class="allTd">Nadwozie:</th>
            <th class="allTd">Zdjęcie:</th>
            <th class="allTd">Skrzynia biegów:</th>
            <th class="allTd">Typ paliwa:</th>
            <th class="allTd">Spalanie w mieście:</th>
            <th class="allTd">Spalanie w trasie:</th>
            <th class="allTd">Silnik:</th>
            <th class="allTd">Moc silnika:</th>
            <th class="allTd">Typ napędu:</th>
            <th class="allTd">Ilość miejsc:</th>
            <th class="allTd">Opis:</th>
            <th class="allTd">Klimatyzacja:</th>
            <th class="allTd">Czujniki parkowania:</th>
            <th class="allTd">Kamera cofania:</th>
            <th class="allTd">Isofix:</th>
            <th class="allTd">Poduszki powietrzne:</th>
            <th class="allTd">Nawigacja:</th>
            <th class="allTd">CElektryczne szyby:</th>
            <th class="allTd">Edycja</th>
            <th class="allTd">Usuwanie</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${cars}" var="item">
            <tr class="allTd">
                <td class="allTd">${item.manufacturer.name}</td>
                <td class="allTd">${item.carModel.name}</td>
                <td class="allTd">${item.carModel.body}</td>
                <td class="allTd"><img src="/images/${item.imageLink}" alt="zdjęcie" width="85" height=65></td>
                <td class="allTd">${item.transmission.type}</td>
                <td class="allTd">${item.fuel.type}</td>
                <td class="allTd">${item.fuelCity}</td>
                <td class="allTd">${item.fuelHighway}</td>
                <td class="allTd">${item.engine}</td>
                <td class="allTd">${item.horsePower}</td>
                <td class="allTd">${item.driveType.type}</td>
                <td class="allTd">${item.seat.quantity}</td>
                <td class="allTd">${item.description}</td>
                <td class="allTd">${item.airCondition}</td>
                <td class="allTd">${item.parkAssist}</td>
                <td class="allTd">${item.reverseCamera}</td>
                <td class="allTd">${item.isofix}</td>
                <td class="allTd">${item.airBags}</td>
                <td class="allTd">${item.navigation}</td>
                <td class="allTd">${item.electricWindows}</td>
                <td class="allTd"><a href="/car/edit/${item.id}" class="btn btn-info" role="button">Edytuj</a></td>
                <td class="allTd"><a href="/car/delete/${item.id}" class="btn btn-info" role="button">Usuń</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="/homePage">Wróć na stronę główną</a>

    <a href="/car/add">Dodaj kolejny</a>

</div>
</body>
</html>
