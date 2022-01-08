<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Safyrus
  Date: 08/01/2022
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Friends list</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<%@ include file="nav.jsp" %>

<h2>Friends</h2>

<form action="friends" method="post">
    <h3>Add a friend</h3>
    <div class="form-group">
        <label for="username" >Username:</label><br>
        <input type="text" class="form-control" id="username" name="username"><br>
        <button type="submit" class="btn btn-primary">Add friend</button>
    </div>
</form>

<h3>Friends list</h3>
<div class="list-group">
    <%
        String user = (String) session.getAttribute("username");
        User currentUser = new User(null, null, user, null, null, null, false);
        currentUser.getOtherData();
        ArrayList<User> friends = currentUser.getAllFriends();
        if (friends.isEmpty())  {%>
    <p>The list is empty</p>
    <%} else {
            for (User u: friends) {
    %>
    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
        <div class="d-flex w-100 justify-content-between">
            <h5 class="mb-1">Friend <%=u.getUsername()%></h5>
        </div>
        <p class="mb-1"><%=u.getFirstName()%> <%=u.getLastName()%></p>
    </a>
    <%
            }
        }
    %>
</div>
</body>
</html>
