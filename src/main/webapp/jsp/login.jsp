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
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
    <h1> Covid Web Project </h1><br>
    <%@ include file="nav.jsp" %>

    <h2> Login </h2>
    <form action="/login"  method="post">
        <label for="username" >Username:</label><br>
        <input type="text" id="username" name="username" required><br>
        <label for="password" >Password:</label><br>
        <input type="password" id="password" name="password" required><br>
        <input type="submit" value="Submit">
         <%
         if(request.getAttribute("check") != null && (boolean)request.getAttribute("check")){%>
                <p>Error</p>
        <%}
        %>
    </form>
</body>
</html>
