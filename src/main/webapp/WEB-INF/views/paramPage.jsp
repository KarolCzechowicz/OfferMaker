<%--
  Created by IntelliJ IDEA.
  User: karol
  Date: 15.01.19
  Time: 23:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="/css/style.css" rel="stylesheet">
    <title>Dodaj parametr samochodu</title>
</head>
<body class="add">
<div>
<table>
    <thead>
    <tr>
        <th colspan="1">Dodaj wybrane parametry do konfiguracji samochodu</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td><a href="/manufacturer/add" class="paramButton">Dodaj markę</a></td>
    </tr>
    <tr>
        <td><a href="/model/add" class="paramButton">Dodaj model</a></td>
    </tr>
    <tr>
        <td><a href="/transmission/add" class="paramButton">Dodaj typ skrzyni biegów</a></td>
    </tr>
    <tr>
        <td><a href="/fuel/add" class="paramButton">Dodaj typ paliwa</a></td>
    </tr>
    <tr>
        <td><a href="/driveType/add" class="paramButton">Dodaj typ napędu</a></td>
    </tr>
    <tr>
        <td><a href="/seat/add" class="paramButton">Dodaj liczbę miejsc</a></td>
    </tr>
    </tbody>
</table><br>
<a href="/homePage" class="returnButton">Wróć na stronę główną</a>
</div>
</body>
</html>
