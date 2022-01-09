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
            <a class="navbar-brand" href="/">Covid Protection</a>
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
                        <a class="nav-link" href="notif">Notifications</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="activity">Activities</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="places">Places</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="friends">Friends</a>
                    </li>
                    <%if (session.getAttribute("covid") != null && (boolean)session.getAttribute("covid")) {%>
                    <li class="nav-item">
                        <form action="/" method="post">
                            <button class="btn btn-outline-warning disabled" type="button">I HAVE COVID</button>
                        </form>
                    </li>
                    <%} else {%>
                    <li class="nav-item">
                        <form action="notif-covid" method="post">
                            <button class="btn btn-outline-warning" type="submit">I HAVE COVID</button>
                        </form>
                    </li>
                    <%}%>
                    <%  } else { %>
                    <li class="nav-item">
                        <a class="nav-link" href="login">Log in</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled">Profil</a>
                    </li>
                    <%  } %>
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