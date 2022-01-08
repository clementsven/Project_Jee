<%--
  Created by IntelliJ IDEA.
  User: Safyrus
  Date: 08/01/2022
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>New Activity</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<%@ include file="nav.jsp" %>

<h2> New Activity </h2>

<form action="new-activity" method="post">
    <label for="date_start" >Starting Date:</label><br>
    <input type="date" id="date_start" name="date_start" value="${date_start}"><br>
    <label for="date_end" >Ending Date:</label><br>
    <input type="date" id="date_end" name="date_end" value="${date_end}"><br>
    <label for="name" >Name:</label><br>
    <input type="text" id="name" name="name" value="${name}"><br>
    <input type="submit" value="Submit">
    <% if(request.getAttribute("error_date_begin") != null && (Boolean)request.getAttribute("error_date_begin")) { %>
    <p> The starting date cannot be before the current date </p>
    <% } %>
    <% if(request.getAttribute("error_date_end") != null && (Boolean)request.getAttribute("error_date_end")) { %>
    <p> The end date cannot be before the starting date </p>
    <% } %>
</form>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
