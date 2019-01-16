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

            <form:errors path="*"/><br>

            <form:input path="id" type="hidden"/>
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
            </tbody>
        </table>
        <input type="submit" value="Dodaj"/><br><br>
        <table>
            <thead>
            <tr>
                <th colspan="20" class="addTd">Wszystkie samochody</th>
            </tr>
            <tr>
                <th class="addTd">Nazwa marki:</th>
                <th class="addTd">Model:</th>
                <th class="addTd">Skrzynia biegów:</th>
                <th class="addTd">Typ paliwa:</th>
                <th class="addTd">Spalanie w mieście:</th>
                <th class="addTd">Spalanie w trasie:</th>
                <th class="addTd">Silnik:</th>
                <th class="addTd">Moc silnika:</th>
                <th class="addTd">Typ napędu:</th>
                <th class="addTd">Ilość miejsc:</th>
                <th class="addTd">Opis:</th>
                <th class="addTd">Klimatyzacja:</th>
                <th class="addTd">Czujniki parkowania:</th>
                <th class="addTd">Kamera cofania:</th>
                <th class="addTd">Isofix:</th>
                <th class="addTd">Poduszki powietrzne:</th>
                <th class="addTd">Nawigacja:</th>
                <th class="addTd">CElektryczne szyby:</th>
                <th class="addTd">Edycja</th>
                <th class="addTd">Usuwanie</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${cars}" var="item">
                <tr class="addTd">
                    <td class="addTd">${item.manufacturer.name}</td>
                    <td class="addTd">${item.carModel.name}</td>
                    <td class="addTd">${item.transmission.type}</td>
                    <td class="addTd">${item.fuel.type}</td>
                    <td class="addTd">${item.fuelCity}</td>
                    <td class="addTd">${item.fuelHighway}</td>
                    <td class="addTd">${item.engine}</td>
                    <td class="addTd">${item.horsePower}</td>
                    <td class="addTd">${item.driveType}</td>
                    <td class="addTd">${item.seat}</td>
                    <td class="addTd">${item.description}</td>
                    <td class="addTd">${item.airCondition}</td>
                    <td class="addTd">${item.parkAssist}</td>
                    <td class="addTd">${item.reverseCamera}</td>
                    <td class="addTd">${item.isofix}</td>
                    <td class="addTd">${item.airBags}</td>
                    <td class="addTd">${item.navigation}</td>
                    <td class="addTd">${item.electricWindows}</td>
                    <td class="addTd"><a href="/car/edit/${item.id}" class="btn btn-info" role="button">Edytuj</a></td>
                    <td class="addTd"><a href="/car/delete/${item.id}" class="btn btn-info" role="button">Usuń</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </form:form>

    <a href="/homePage">Wróć na stronę główną</a>

    <a href="/paramPage">Przejdź na stronę parametrów</a>

</div>
</body>
</html>
