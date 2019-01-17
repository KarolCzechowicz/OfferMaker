<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: karol
  Date: 16.01.19
  Time: 12:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="/css/style.css" rel="stylesheet">
    <title>Rejestracja użytkownika</title>
</head>
<body class="login">
<div>
    <form:form modelAttribute="user" method="post">
        <table>
            <thead>
            <tr>
                <th colspan="2">Zarejestruj się</th>
            </tr>
            </thead>
            <tbody>

            <form:errors path="*"/><br>

            <form:input path="id" type="hidden"/>
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
                <td>Email:</td>
                <td><form:input path="email"/>
                    <form:errors path="email"/></td>
            </tr>
            <tr>
                <td id="msg2" colspan="2"></td>
            </tr>
            </tbody>
        </table>
        <input type="submit" value="Zarejestruj" class="submit"/><br>
    </form:form>
</div>
<script src="/js/register.js"></script>
</body>
</html>
