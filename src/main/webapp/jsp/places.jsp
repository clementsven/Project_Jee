<%@ page import="project.jee.projectjeecovid.database.Place" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Safyrus
  Date: 08/01/2022
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>Places</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<%@ include file="nav.jsp" %>

<h2>Places</h2>
<form action="new-place" method="get">
  <button type="submit" class="btn btn-primary">Create new place</button>
</form>

<div class="list-group">
  <%
    String user = (String) session.getAttribute("username");
    User u = new User(null, null, user, null, null, null, false);
    u.getOtherData();
    ArrayList<Place> places = Place.getAllPlaces();
    for (Place p: places) {
  %>
  <a href="#" class="list-group-item list-group-item-action flex-column align-items-start list-group-item-warning">
    <div class="d-flex w-100 justify-content-between">
      <h5 class="mb-1">Place <%=p.getId()%></h5>
    </div>
    <p class="mb-1"><%=p.getName()%></p>
    <small><%=p.getAddress()%></small>
    <%
      if (u.getAdmin()) {
    %>
    <form action="del-place" method="get">
      <input type="text" name="id" value="<%=p.getId()%>" hidden>
      <button type="submit" class="btn btn-secondary">Delete</button>
    </form>
    <% } %>
  </a>
  <%
    }
  %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
