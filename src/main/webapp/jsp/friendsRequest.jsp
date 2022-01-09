<%@ page import="project.jee.projectjeecovid.database.User" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Sven
  Date: 09/01/2022
  Time: 08:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Friends request list </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>

<%@ include file="nav.jsp" %>
<div style="text-align: center;">
    <h3>Friends Request list</h3>
</div>
<div class="list-group">
    <%
        String user = (String) session.getAttribute("username");
        User currentUser = new User(null, null, user, null, null, null, false);
        currentUser.getOtherData();
        ArrayList<User> friends = (ArrayList<User>) currentUser.getAllHalfFriend();
        if (friends.isEmpty()) {%>
    <p>The list is empty</p>
    <%
    } else {
        for (User u : friends) {
    %>
    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start list-group-item-warning">

        <h5 class="mb-1">Friend <%=u.getUsername()%>
        </h5>
        <p class="mb-1"><%=u.getFirstName()%> <%=u.getLastName()%>
        </p>
        <form action="friendsRequest" method="post">
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="radio" id="R1" value="true">
                <label class="form-check-label" for="R1">Accept</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="radio" id="R2" value="false">
                <label class="form-check-label" for="R2">Refuse</label>
            </div>

            <input type="hidden" name="hiddenUsername" value="<%=u.getUsername()%>"/>
            <button class="btn btn-outline-secondary" type="submit">Confirm</button>
        </form>
        <%
                }
            }
        %>
    </a>
</div>
</body>
</html>
