<%--
  Created by IntelliJ IDEA.
  User: Safyrus
  Date: 04/01/2022
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign in</title>
</head>
<body>
    <h1> Sign in </h1>
    <form action="/sign-in"  method="post">
        <label for="username" >Username:</label><br>
        <input type="text" id="username" name="username" required><br>
        <label for="password" >Password:</label><br>
        <input type="password" id="password" name="password" required><br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
