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
<body>
<form:form modelAttribute="car" method="post">
    <table>
        <thead>
        <tr>
            <th colspan="2">Dodaj samochód</th>
        </tr>
        </thead>
        <tbody>

        <form:errors path="*"/><br>

        <form:input path="id" type="hidden"/>
        <tr>
            <td>Nazwa marki:</td>
            <td><form:select path="manufacturer">
                <form:options items="${manufacturers}" itemValue="id" itemLabel="name"/>
            </form:select></td>
        </tr>
        <tr>
            <td>Model:</td>
            <td><form:select path="carModel">
                <form:options items="${carModels}" itemValue="id" itemLabel="name"/>
            </form:select></td>
        </tr>
        <tr>
            <td>Skrzynia biegów:</td>
            <td><form:select path="transmission">
                <form:options items="${transmissions}" itemValue="id" itemLabel="type"/>
            </form:select></td>
        </tr>
        <tr>
            <td>Typ paliwa:</td>
            <td><form:select path="fuel">
                <form:options items="${fuels}" itemValue="id" itemLabel="type"/>
            </form:select></td>
        </tr>
        <tr>
            <td>Spalanie w mieście:</td>
            <td><form:input path="fuelCity"/>
                <form:errors path="fuelCity"/></td>
        </tr>
        <tr>
            <td>Spalanie w trasie:</td>
            <td><form:input path="fuelHighway"/>
                <form:errors path="fuelHighway"/></td>
        </tr>
        <tr>
            <td>Silnik:</td>
            <td><form:input path="engine"/>
                <form:errors path="engine"/></td>
        </tr>
        <tr>
            <td>Moc silnika:</td>
            <td><form:input path="horsePower"/>
                <form:errors path="horsePower"/></td>
        </tr>
        <tr>
            <td>Typ napędu:</td>
            <td><form:select path="driveType">
                <form:options items="${driveTypes}" itemValue="id" itemLabel="type"/>
            </form:select></td>
        </tr>
        <tr>
            <td>Ilość miejsc:</td>
            <td><form:select path="seat">
                <form:options items="${seats}" itemValue="id" itemLabel="quantity"/>
            </form:select></td>
        </tr>
        <tr>
            <td>Opis:</td>
            <td><form:textarea path="description"/>
                <form:errors path="description"/></td>
        </tr>
        <tr>
            <td>Klimatyzacja:</td>
            <td><form:checkbox path="airCondition"/>
                <form:errors path="airCondition"/></td>
        </tr>
        <tr>
            <td>Czujniki parkowania:</td>
            <td><form:checkbox path="parkAssist"/>
                <form:errors path="parkAssist"/></td>
        </tr>
        <tr>
            <td>Kamera cofania:</td>
            <td><form:checkbox path="reverseCamera"/>
                <form:errors path="reverseCamera"/></td>
        </tr>
        <tr>
            <td>Isofix:</td>
            <td><form:checkbox path="isofix"/>
                <form:errors path="isofix"/></td>
        </tr>
        <tr>
            <td>Poduszki powietrzne:</td>
            <td><form:checkbox path="airBags"/>
                <form:errors path="airBags"/></td>
        </tr>
        <tr>
            <td>Nawigacja:</td>
            <td><form:checkbox path="navigation"/>
                <form:errors path="navigation"/></td>
        </tr>
        <tr>
            <td>Elektryczne szyby:</td>
            <td><form:checkbox path="electricWindows"/>
                <form:errors path="electricWindows"/></td>
        </tr>
        </tbody>
    </table>
    <input type="submit" value="wyślij"/><br><br>
    <table>
        <thead>
        <tr>
            <th colspan="20">Wszystkie samochody</th>
        </tr>
        <tr>
            <th>Nazwa marki:</th>
            <th>Model:</th>
            <th>Skrzynia biegów:</th>
            <th>Typ paliwa:</th>
            <th>Spalanie w mieście:</th>
            <th>Spalanie w trasie:</th>
            <th>Silnik:</th>
            <th>Moc silnika:</th>
            <th>Typ napędu:</th>
            <th>Ilość miejsc:</th>
            <th>Opis:</th>
            <th>Klimatyzacja:</th>
            <th>Czujniki parkowania:</th>
            <th>Kamera cofania:</th>
            <th>Isofix:</th>
            <th>Poduszki powietrzne:</th>
            <th>Nawigacja:</th>
            <th>CElektryczne szyby:</th>
            <th>Edycja</th>
            <th>Usuwanie</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${cars}" var="item">
            <tr>
                <td>${item.name}</td>
                <td>${item.carModel}</td>
                <td>${item.transmission}</td>
                <td>${item.fuel}</td>
                <td>${item.fuelCity}</td>
                <td>${item.fuelHighway}</td>
                <td>${item.engine}</td>
                <td>${item.horsePower}</td>
                <td>${item.driveType}</td>
                <td>${item.seat}</td>
                <td>${item.description}</td>
                <td>${item.airCondition}</td>
                <td>${item.parkAssist}</td>
                <td>${item.reverseCamera}</td>
                <td>${item.isofix}</td>
                <td>${item.airBags}</td>
                <td>${item.navigation}</td>
                <td>${item.electricWindows}</td>
                <td><a href="/car/edit/${item.id}" class="btn btn-info" role="button">Edytuj</a></td>
                <td><a href="/car/delete/${item.id}" class="btn btn-info" role="button">Usuń</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</form:form>
<a href="/paramPage">Przejdź na stronę parametrów</a>

<a href="/homePage">Wróć na stronę główną</a>
</body>
</html>
