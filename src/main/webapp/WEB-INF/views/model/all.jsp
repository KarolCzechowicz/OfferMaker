<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: karol
  Date: 08.01.19
  Time: 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="/home/karol/Pulpit/Spring01hibernate/src/main/webapp/css/style.css"/>
<html>
<head>
    <link href="/css/style.css" rel="stylesheet">
    <title>Success!</title>
</head>
<body class="add">
<div>
    <table>
        <thead>
        <th class="addTd">Nazwa modelu</th>
        <th class="addTd">Typ nadwozia</th>
        <th class="addTd">Edycja</th>
        <th class="addTd">Usuwanie</th>
        </thead>
        <tbody>
        <c:forEach items="${carModels}" var="item">
            <tr>
                <td class="addTd">${item.name}</td>
                <td class="addTd">${item.body}</td>
                <td class="addTd"><a href="/model/edit/${item.id}" class="btn btn-info" role="button">Edytuj</a></td>
                <td class="addTd"><a href="/model/delete/${item.id}" class="btn btn-info" role="button">Usuń</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="/paramPage">Wróć na stronę parametrów</a>

    <a href="/manufacturer/all">Przypisz model do producenta</a>

    <a href="/homePage">Wróć na stronę główną</a>
</div>
</body>
</html>
