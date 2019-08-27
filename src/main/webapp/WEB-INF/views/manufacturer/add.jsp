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
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <title>Dodaj Producenta</title>
</head>
<body class="add">
<div>
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
                <td class="addTd">Nazwa producenta:</td>
                <td><form:input path="name"/>
                    <form:errors path="name"/></td>
            </tr>
            <tr>
                <td class="addTd">Model:</td>
                <td><form:select path="carModels" multiple="true">
                    <form:options items="${carModels}" itemValue="id" itemLabel="name"/>
                </form:select></td>
            </tr>
            </tbody>
        </table>
        <input type="submit" value="Dodaj"/><br>
        <table>
            <thead>
            <th class="addTd">Nazwa producent</th>
            <th class="addTd">Edycja</th>
            <th class="addTd">Usuwanie</th>
            </thead>
            <tbody>
            <c:forEach items="${manufacturers}" var="item">
                <tr>
                    <td class="addTd">${item.name}</td>
                    <td class="addTd"><a href="/manufacturer/edit/${item.id}" class="btn btn-info"
                                         role="button">Edytuj</a></td>
                    <td class="addTd"><a href="/manufacturer/delete/${item.id}" class="btn btn-info"
                                         role="button">Usuń</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </form:form>
    <a href="/paramPage">Wróć na stronę parametrów</a>

    <a href="/model/add">Dodaj model</a>

    <a href="/homePage">Wróć na stronę główną</a>
</div>
</body>
</html>
