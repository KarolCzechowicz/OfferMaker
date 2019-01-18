<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: karol
  Date: 08.01.19
  Time: 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="/css/style.css" rel="stylesheet">
    <title>Dodaj Samochód</title>

</head>
<body class="add">
<div>
    <form:form modelAttribute="car" method="post">
        <table>
            <thead>
            <tr>
                <th colspan="2" class="addTd">Dodaj samochód</th>
            </tr>
            </thead>
            <tbody>
            <form:errors path="*"/>
            <tr>
                <td class="addTd">Nazwa marki:</td>
                <td><form:select path="manufacturer">
                    <form:options items="${manufacturers}" itemValue="id" itemLabel="name"/>
                </form:select></td>
            </tr>
            <tr>
                <td class="addTd">Model:</td>
                <td><form:select path="carModel">
                    <form:options items="${carModels}" itemValue="id" itemLabel="name"/>
                </form:select></td>
            </tr>
            <tr>
                <td class="addTd">Skrzynia biegów:</td>
                <td><form:select path="transmission">
                    <form:options items="${transmissions}" itemValue="id" itemLabel="type"/>
                </form:select></td>
            </tr>
            <tr>
                <td class="addTd">Typ paliwa:</td>
                <td><form:select path="fuel">
                    <form:options items="${fuels}" itemValue="id" itemLabel="type"/>
                </form:select></td>
            </tr>
            <tr>
                <td class="addTd">Spalanie w mieście:</td>
                <td><form:input path="fuelCity"/>
                    <form:errors path="fuelCity"/></td>
            </tr>
            <tr>
                <td class="addTd">Spalanie w trasie:</td>
                <td><form:input path="fuelHighway"/>
                    <form:errors path="fuelHighway"/></td>
            </tr>
            <tr>
                <td class="addTd">Silnik:</td>
                <td><form:input path="engine"/>
                    <form:errors path="engine"/></td>
            </tr>
            <tr>
                <td class="addTd">Moc silnika:</td>
                <td><form:input path="horsePower"/>
                    <form:errors path="horsePower"/></td>
            </tr>
            <tr>
                <td class="addTd">Typ napędu:</td>
                <td><form:select path="driveType">
                    <form:options items="${driveTypes}" itemValue="id" itemLabel="type"/>
                </form:select></td>
            </tr>
            <tr>
                <td class="addTd">Ilość miejsc:</td>
                <td><form:select path="seat">
                    <form:options items="${seats}" itemValue="id" itemLabel="quantity"/>
                </form:select></td>
            </tr>
            <tr>
                <td class="addTd">Opis:</td>
                <td><form:textarea path="description"/>
                    <form:errors path="description"/></td>
            </tr>
            <tr>
                <td class="addTd">Klimatyzacja:</td>
                <td><form:checkbox path="airCondition"/>
                    <form:errors path="airCondition"/></td>
            </tr>
            <tr>
                <td class="addTd">Czujniki parkowania:</td>
                <td><form:checkbox path="parkAssist"/>
                    <form:errors path="parkAssist"/></td>
            </tr>
            <tr>
                <td class="addTd">Kamera cofania:</td>
                <td><form:checkbox path="reverseCamera"/>
                    <form:errors path="reverseCamera"/></td>
            </tr>
            <tr>
                <td class="addTd">Isofix:</td>
                <td><form:checkbox path="isofix"/>
                    <form:errors path="isofix"/></td>
            </tr>
            <tr>
                <td class="addTd">Poduszki powietrzne:</td>
                <td><form:checkbox path="airBags"/>
                    <form:errors path="airBags"/></td>
            </tr>
            <tr>
                <td class="addTd">Nawigacja:</td>
                <td><form:checkbox path="navigation"/>
                    <form:errors path="navigation"/></td>
            </tr>
            <tr>
                <td class="addTd">Elektryczne szyby:</td>
                <td><form:checkbox path="electricWindows"/>
                    <form:errors path="electricWindows"/></td>
            </tr>
            <tr>
                <td class="addTd">Zdjęcie:</td>
                <td><input type="file" id="img"/></td>
            </tr>
                <form:input path="imageLink" id="link" value="" type="hidden"/>
            </tbody>
        </table>
        <input type="submit" value="Dodaj"/><br><br>
        <table>
            <thead>
            <tr>
                <th colspan="20" class="addTd">Wszystkie samochody</th>
            </tr>
            <tr>
                <th class="allTd">Nazwa marki:</th>
                <th class="allTd">Model:</th>
                <th class="allTd">Nadwozie:</th>
                <th class="allTd">Zdjęcie:</th>
                <th class="allTd">Skrzynia biegów:</th>
                <th class="allTd">Typ paliwa:</th>
                <th class="allTd">Edycja</th>
                <th class="allTd">Usuwanie</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${cars}" var="item">
                    <td class="allTd">${item.manufacturer.name}</td>
                    <td class="allTd">${item.carModel.name}</td>
                    <td class="allTd">${item.carModel.body}</td>
                    <td class="allTd"><img src="/images/${item.imageLink}" alt="zdjęcie" width="85" height="65"></td>
                    <td class="allTd">${item.transmission.type}</td>
                    <td class="allTd">${item.fuel.type}</td>
                    <td class="allTd"><a href="/car/edit/${item.id}" class="btn btn-info" role="button">Edytuj</a></td>
                    <td class="allTd"><a href="/car/delete/${item.id}" class="btn btn-info" role="button">Usuń</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </form:form>

    <a href="/homePage">Wróć na stronę główną</a>

    <a href="/car/all">Pokaż wszystkie</a>

    <a href="/paramPage">Przejdź na stronę parametrów</a>

</div>
<script src="/js/imageName.js"></script>
</body>
</html>
