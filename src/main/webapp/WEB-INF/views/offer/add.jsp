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
    <title>Dodaj Ofertę</title>
</head>
<body class="add">
<div>
    <form:form modelAttribute="offer" method="post">
        <table>
            <thead>
            <tr>
                <th colspan="2" class="addTd">Dodaj ofertę</th>
            </tr>
            </thead>
            <tbody>

            <form:errors path="*"/><br>

            <form:input path="id" type="hidden"/>
            <tr>
                <td class="addTd">Wybrany samochód:</td>
                <td><form:select path="car">
                    <form:options items="${cars}" itemValue="id" itemLabel="manufacturer.name"/>
                </form:select></td>
            </tr>
            <tr>
                <td class="addTd">Od:</td>
                <td><form:input type="date" path="dateFrom"/></td>
            </tr>
            <tr>
                <td class="addTd">Do:</td>
                <td><form:input type="date" path="dateTo"/></td>
            </tr>
            <tr>
                <td class="addTd">Cena:</td>
                <td><form:input path="price"/>
                    <form:errors path="price"/></td>
            </tr>
            <tr>
                <td class="addTd">Dodatkowe Informacje:</td>
                <td><form:textarea path="info"/>
                    <form:errors path="info"/></td>
            </tr>
            </tbody>
        </table>
        <input type="submit" value="Dodaj"/><br><br>
    </form:form>

    <a href="/homePage">Wróć na stronę główną</a>

    <a href="/offer/all">Wszystkie oferty</a>

</div>
</body>
</html>