<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: karol
  Date: 08.01.19
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="/css/style.css" rel="stylesheet">
    <title>Dodaj Rodzaj Skrzyni Biegów</title>
</head>
<body>
    <form:form modelAttribute="transmission" method="post">
        <table>
            <thead>
            <tr>
                <th colspan="2">Dodaj rodzaj skrzyni biegów</th>
            </tr>
            </thead>
            <tbody>

            <form:errors path="*"/><br>

            <form:input path="id" type="hidden"/>
            <tr>
                <td>Typ skrzyni biegów:</td>
                <td><form:input path="type"/>
                    <form:errors path="type"/></td>
            </tr>
            </tbody>
        </table>
        <input type="submit" value="wyślij"/><br>
        <table>
            <thead>
            <th>Typ skrzyni biegów</th>
            <th>Edycja</th>
            <th>Usuwanie</th>
            </thead>
            <tbody>
            <c:forEach items="${transmissions}" var="item">
                <tr>
                    <td>${item.type}</td>
                    <td><a href="/transmission/edit/${item.id}" class="btn btn-info" role="button">Edytuj</a></td>
                    <td><a href="/transmission/delete/${item.id}" class="btn btn-info" role="button">Usuń</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </form:form>
    <a href="/paramPage">Wróć na stronę parametrów</a>

    <a href="/homePage">Wróć na stronę główną</a>
</body>
</html>
