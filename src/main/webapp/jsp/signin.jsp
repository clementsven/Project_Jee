<%@ page import="project.jee.projectjeecovid.database.User" %><%--
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
    <h1> Covid Web Project </h1><br>
    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link" href="/">Home</a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="sign-in">Sign in</a>
        </li>
        <li class="nav-item">
            <%
                String username = (String) request.getSession().getAttribute("username");
                String passhash = (String) request.getSession().getAttribute("passhash");
                User u = new User(null, null, username, passhash, null, null, false);
                if (u.exist()) {%>
            <a class="nav-link disabled" href="log-out">Log out</a>
            <%  } else { %>
            <a class="nav-link disabled">Log out</a>
            <%  } %>
        </li>
    </ul>

    <form action="/sign-in"  method="post">
        <label for="username" >Username:</label><br>
        <input type="text" id="username" name="username" value="${username}" required><br>
        <label for="password" >Password:</label><br>
        <input type="password" id="password" name="password" required><br>
        <label for="first_name" >First name:</label><br>
        <input type="text" id="first_name" name="first_name" value="${first_name}"><br>
        <label for="last_name" >Last name:</label><br>
        <input type="text" id="last_name" name="last_name" value="${last_name}"><br>
        <label for="date" >Birth Date:</label><br>
        <input type="date" id="date" name="date" value="${date}"><br>
        <input type="submit" value="Submit">
        <% System.out.println(request.getAttribute("error")); %>
        <% if(request.getAttribute("error_length") != null && (Boolean)request.getAttribute("error_length")) { %>
            <p> Password is too short (8 characters minimum) </p>
        <% } %>
        <% if(request.getAttribute("error_date") != null && (Boolean)request.getAttribute("error_date")) { %>
            <p> Date is incorrect </p>
        <% } %>
        <% if(request.getAttribute("error_user") != null && (Boolean)request.getAttribute("error_user")) { %>
            <p> Username is incorrect </p>
        <% } %>
    </form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
