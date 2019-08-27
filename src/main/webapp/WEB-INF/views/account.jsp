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
    <link rel="stylesheet" type="text/css" href="/css/style.css">
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
            <td class="addTd">${login}</td>
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
                <td>Podaj hasło:</td>
                <td><form:password path="password"/>
                    <form:errors path="password"/></td>
            </tr>
            <tr>
                <td id="msg3" colspan="2"></td>
            </tr>
            </tbody>
        </table>
        <input type="submit" value="Zatwierdź"/><br>
    </form:form>
    <a href="/homePage">Wróć na stronę główną</a>
</div>
<script src="/js/account.js"></script>
</body>
</html>
