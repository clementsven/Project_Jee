<%--
  Created by IntelliJ IDEA.
  User: Safyrus
  Date: 04/01/2022
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
    <%@ include file="nav.jsp" %>

    <img src="img/main.jpg" width="400px" height="400px" style = "float:left" alt="...">
    <img src="img/main.jpg" width="400px" height="400px" style = "float:right" alt="...">
        <div style="text-align: center;">
    <h2> Login </h2>
    <form action="login"  method="post">
            <label for="username" >Username:</label><br>
            <input type="text" id="username" name="username" required><br>
            <label for="password" >Password:</label><br>
            <input type="password" id="password" name="password" required><br>
        <input type="submit" class="btn btn-warning" value="Submit">
         <%
         if(request.getAttribute("check") != null && (boolean)request.getAttribute("check")){%>
                <p>Error</p>
        <%}
        %>
        </div>
    </form>
</body>
</html>
