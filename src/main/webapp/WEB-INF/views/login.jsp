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
<body>
<form:form modelAttribute="user" method="post">
    <table>
        <thead>
        <tr>
            <th colspan="2">Zaloguj</th>
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
            <td><form:input path="password"/>
                <form:errors path="password"/></td>
        </tr>
        </tbody>
    </table>
    <input type="submit" value="wyślij"/><br>
</form:form>
</body>
</html>