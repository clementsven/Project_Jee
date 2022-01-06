<%@ page import="project.jee.projectjeecovid.database.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
    <h1> Covid Web Project </h1><br>
    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="sign-in">Sign in</a>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>