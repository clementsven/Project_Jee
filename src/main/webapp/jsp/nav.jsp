<%@ page import="project.jee.projectjeecovid.database.User" %><%--
  Created by IntelliJ IDEA.
  User: Safyrus
  Date: 06/01/2022
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%--<ul class="nav nav-tabs">
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
    <li class="nav-item">
        <a class="nav-link" href="notif">Notification</a>
    </li>
<%  } else { %>
    <li class="nav-item">
        <a class="nav-link" href="login">Log in</a>
    </li>
    <li class="nav-item">
        <a class="nav-link disabled">Profil</a>
    </li>
<%  } %>
</ul>--%>

<header>
    <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">Protection Covid</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav me-auto mb-2 mb-md-0">
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
                    <li class="nav-item">
                        <a class="nav-link" href="notif">Notification</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="activity">Activity</a>
                    </li>
                    <%  } else { %>
                    <li class="nav-item">
                        <a class="nav-link" href="login">Log in</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled">Profil</a>
                    </li>
                    <%  } %>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Navigation
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <li><a class="dropdown-item" href="#">See contact covid zone</a></li>
                            <li><a class="dropdown-item" href="#">See contact covid event</a></li>
                            <li><a class="dropdown-item" href="#">Random covid victim</a></li>
                        </ul>
                    </li>
                </ul>
                <%
                    if (session.getAttribute("username") != null) {
                %>
                <a class="navbar-brand" href="profil"> Connected as <%=session.getAttribute("username")%></a>
                <%  } %>
                <%--<form class="d-flex">
                    <ul class="navbar-nav me-auto mb-2 mb-md-0">
                        <% if(true){%>
                        <form action="/login"  method="post">
                            <li class="nav-item">
                                <a class="nav-link disabled" color = "red">Username : </a>
                            </li >
                            <li class="nav-item">
                                <input type="text" id="username" name="username" required><br>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link disabled">   Password  : </a>
                            </li> <li class="nav-item">
                            <input type="password" id="password" name="password" required><br> </li>

                                <% if(request.getAttribute("check") != null && (boolean)request.getAttribute("check")){%>
                            <p>.Error.</p>
                                <%}else{%><p>.     .</p>
                                <%}%>

                            <button class="btn btn-outline-warning" type="submit">Login</button> %>
                                <%}else{%>
                            <label for="password" >Password:</label><br>

                                <%}%>
                    </ul>
                </form>--%>
            </div>
        </div>
    </nav>

</header>