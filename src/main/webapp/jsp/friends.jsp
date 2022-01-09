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

<img src="img/main.jpg" width="400px" height="400px" style = "float:right" alt="...">
<img src="img/main.jpg" width="400px" height="400px" style = "float:left" alt="...">
<div style="text-align: center;">
<h2>Friends</h2>
<form action="friends" method="post">
    <h3>Add a friend</h3>
    <p class="form-group">
        <label for="username" >Username:</label><br>
        <input type="text" id="username" name="username"><br><br>
        <button type="submit" class="btn btn-primary">Add friend</button>
        <% if(request.getAttribute("error") != null ) {
        if((boolean)request.getAttribute("error")){%>
            <p>
                Don't exist man
            </p>
        <% } else { %>
            <p>
                Send like papa in mama
            </p>
        <% }} %>
</form>
    <form action="friendsRequest" method="get">
            <button type="submit" class="btn btn-primary">friend request</button>
    </form>
<%for(int i = 0;i<10;i++){ %>
    <br>
    <% } %>


<h3>Friends list</h3>
</div>
<div class="list-group">
    <%
        String user = (String) session.getAttribute("username");
        User currentUser = new User(null, null, user, null, null, null, false);
        currentUser.getOtherData();
        ArrayList<User> friends = (ArrayList<User>) currentUser.getAllFriend();
        if (friends.isEmpty())  {%>
    <p>The list is empty</p>
    <%} else {
            for (User u: friends) {
    %>
    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start list-group-item-warning">

            <h5 class="mb-1">Friend <%=u.getUsername()%></h5>
            <p class="mb-1" ><%=u.getFirstName()%> <%=u.getLastName()%></p>

        <form action="deleteFriends" method="post">
            <input type="hidden" name="userToDelete" value="<%=u.getUsername()%>"/>
            <button class="btn btn-outline-secondary" type="submit" >Delete</button>
        </form>

        <%
            }}
        %>
    </a>
   </div>
</body>
</html>
