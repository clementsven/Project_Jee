<%@ page import="project.jee.projectjeecovid.database.User" %><%--
  Created by IntelliJ IDEA.
  User: Safyrus
  Date: 06/01/2022
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<ul class="nav nav-tabs">
    <li class="nav-item">
        <a class="nav-link" href="/">Home</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="sign-in">Sign in</a>
    </li>
<%
    if (session.getAttribute("username") != null) {
%>
    <li class="nav-item">
        <a class="nav-link" href="log-out">Log out</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="profil">Profil</a>
    </li>
<%  } else { %>
    <li class="nav-item">
        <a class="nav-link" href="login">Log in</a>
    </li>
    <li class="nav-item">
        <a class="nav-link disabled">Profil</a>
    </li>
<%  } %>
</ul>
