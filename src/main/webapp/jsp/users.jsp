<%@ page import="project.jee.projectjeecovid.database.Activity" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="project.jee.projectjeecovid.database.ActivityPlace" %><%--
  Created by IntelliJ IDEA.
  User: Safyrus
  Date: 08/01/2022
  Time: 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Users</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<%@ include file="nav.jsp" %>

<h2> Users </h2>

<div class="list-group">
    <%
        ArrayList<User> users = User.getAllUser();
        for (User u: users) {
    %>
    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
        <div class="d-flex w-100 justify-content-between">
            <h5 class="mb-1">User <%=u.getUsername()%></h5>
        </div>
        <form action="edit-user" method="get">
            <input type="text" name="user" value="<%=u.getUsername()%>" hidden>
            <button type="submit" class="btn btn-primary">Edit</button>
        </form>
        <form action="del-user" method="get">
            <input type="text" name="user" value="<%=u.getUsername()%>" hidden>
            <button type="submit" class="btn btn-secondary">Delete</button>
        </form>
    </a>
    <%
        }
    %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
