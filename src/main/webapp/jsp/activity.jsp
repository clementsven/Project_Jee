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
    <title>Activities</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<%@ include file="nav.jsp" %>

<h2> Activities </h2>

<div class="list-group">
    <form action="new-activity" method="get">
        <button type="submit" class="btn btn-primary">Create new activity</button>
    </form>

    <%
        String user = (String) session.getAttribute("username");
        ArrayList<Activity> activities = Activity.getAllUserActivities(user);
        for (Activity a: activities) {
            String placeName = ActivityPlace.getPlaceName(a.getId());
    %>
    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start list-group-item-warning">
        <div class="d-flex w-100 justify-content-between ">
            <h5 class="mb-1">Activity <%=a.getId()%></h5>
            <small><%=a.getDateBegin().toString()%> - <%=a.getDateEnd().toString()%></small>
        </div>
        <p class="mb-1"><%=a.getName()%></p>
        <small>Made by <%=a.getCreator()%>. Located in <%=placeName%></small>
    </a>
    <%
        }
    %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
