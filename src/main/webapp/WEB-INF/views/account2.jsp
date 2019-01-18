<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: karol
  Date: 17.01.19
  Time: 18:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="/css/style.css" rel="stylesheet">
    <title>Ustawienia konta</title>
</head>
<body class="acc">
<div>
    <form:form modelAttribute="user" method="post">
        <table class="usr">
            <thead>
            <th class="addTd">User</th>
            </thead>
            <tbody>
            <tr>
                <td class="addTd">${login}</td>
            </tr>
            </tbody>
        </table>
        <table>
            <thead>
            <tr>
                <th colspan="2">Edytuj konto</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Podaj nowe hasło:</td>
                <td><form:password path="password"/>
                    <form:errors path="password"/></td>
            </tr>
            <tr>
                <td>Podaj nowy email:</td>
                <td><form:input path="email"/>
                    <form:errors path="email"/></td>
            </tr>
            <tr>
                <td class="addTd" colspan="2"><a href="/user/delete/${id}" class="btn btn-info" role="button" style="color: firebrick">Usuń konto</a></td>
            </tr>
            <tr>
                <td id="msg4" colspan="2"></td>
            </tr>
            </tbody>
        </table>
        <input type="submit" value="Zatwierdź"/><br>
    </form:form>
    <a href="/homePage">Wróć na stronę główną</a>
</div>
</body>
</html>
