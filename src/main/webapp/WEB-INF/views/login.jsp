<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: karol
  Date: 15.01.19
  Time: 23:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="/css/style.css" rel="stylesheet">
    <title>Strona logowania</title>
</head>
<body class="login">
<div>
    <form:form modelAttribute="user" method="post">
        <table>
            <thead>
            <tr>
                <th colspan="2">Zaloguj</th>
            </tr>
            </thead>
            <tbody>

            <form:errors path="*"/><br>
            <tr>
                <td>Login:</td>
                <td><form:input path="login"/>
                    <form:errors path="login"/></td>
            </tr>
            <tr>
                <td>Hasło:</td>
                <td><form:password path="password"/>
                    <form:errors path="password"/></td>
            </tr>
            <tr>
                <td id="msg" colspan="2"></td>
            </tr>
            </tbody>
        </table>
        <input type="submit" value="Zaloguj" class="submit"/><br>
    </form:form>

    <a href="/register">Rejestracja Użytkownika</a>
</div>
<script src="/js/login.js"></script>
</body>
</html>