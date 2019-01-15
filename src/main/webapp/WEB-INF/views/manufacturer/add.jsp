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
    <title>Dodaj Producenta</title>
</head>
<body>
<form:form modelAttribute="manufacturer" method="post">
    <table>
        <thead>
        <tr>
            <th colspan="2">Dodaj producenta</th>
        </tr>
        </thead>
        <tbody>

        <form:errors path="*"/><br>

        <form:input path="id" type="hidden"/>
        <tr>
            <td>Nazwa producenta:</td>
            <td><form:input path="name"/>
                <form:errors path="name"/></td>
        </tr>
        <tr>
            <td>Model:</td>
            <td><form:select path="carModels" multiple="true">
                <form:options items="${carModels}" itemValue="id" itemLabel="name"/>
            </form:select></td>
        </tr>
        </tbody>
    </table>
    <input type="submit" value="wyślij"/><br>
    <table>
        <thead>
        <th>Nazwa producent</th>
        <th>Edycja</th>
        <th>Usuwanie</th>
        </thead>
        <tbody>
        <c:forEach items="${manufacturers}" var="item">
            <tr>
                <td>${item.name}</td>
                <td><a href="/manufacturer/edit/${item.id}" class="btn btn-info" role="button">Edytuj</a></td>
                <td><a href="/manufacturer/delete/${item.id}" class="btn btn-info" role="button">Usuń</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</form:form>
<a href="/paramPage">Wróć na stronę parametrów</a>

<a href="/homePage">Wróć na stronę główną</a>
</body>
</html>
