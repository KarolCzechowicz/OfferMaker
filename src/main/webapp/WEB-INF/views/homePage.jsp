<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: karol
  Date: 15.01.19
  Time: 22:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <title>Oferter</title>
</head>
<body id="home">
<div>
    <table class="usr">
        <thead>
        <th class="addTd">User</th>
        </thead>
        <tbody>
        <td class="addTd">${login}</td>
        </tbody>
    </table>
    <table>
        <thead>
        <th colspan="4">Wybierz co chcesz zrobić</th>
        </thead>
        <tbody>
        <td><a href="/offer/add" class="homeButton">Stwórz ofertę</a></td>
        <td><a href="/car/add" class="homeButton">Dodaj samochód</a></td>
        <td><a href="/paramPage" class="homeButton">Edycja parametrów samochodów</a></td>
        <td><a href="/account" class="homeButton">Konto</a></td>
        </tbody>
    </table>
    <a href="/logout" class="logoutButton">Wyloguj</a>
</div>
</body>
</html>
