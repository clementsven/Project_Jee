<%@ page import="project.jee.projectjeecovid.database.User" %><%--
  Created by IntelliJ IDEA.
  User: Safyrus
  Date: 06/01/2022
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<ul class="nav nav-tabs">
    <li class="nav-item">
        <a class="nav-link active" aria-current="page" href="#">Home</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="sign-in">Sign in</a>
    </li>
<%
    String username = (String) request.getSession().getAttribute("username");
    String passhash = (String) request.getSession().getAttribute("passhash");
    User u = new User(null, null, username, passhash, null, null, false);
    if (u.exist()) {
%>
    <li class="nav-item">
        <a class="nav-link" href="log-out">Log out</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="profil">Profil</a>
    </li>
<%  } else { %>
    <li class="nav-item">
        <a class="nav-link disabled">Log out</a>
    </li>
    <li class="nav-item">
        <a class="nav-link disabled">Profil</a>
    </li>
<%  } %>
</ul>
