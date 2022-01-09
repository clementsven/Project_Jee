<%--
  Created by IntelliJ IDEA.
  User: Safyrus
  Date: 08/01/2022
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>New Place</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<%@ include file="nav.jsp" %>
<div style="text-align: center;">
<h2> New Place </h2>

<form action="new-place" method="post">
    <div class="form-group col-md-2">
        <label for="adr" >Address:</label><br>
        <input type="text" class="form-control" id="adr" name="adr" value="${adr}"><br>
        <label for="name" >Name:</label><br>
        <input type="text" class="form-control" id="name" name="name" value="${name}"><br>
        <input type="submit" class="btn btn-primary" value="Submit">
        <% if(request.getAttribute("error_adr") != null && (Boolean)request.getAttribute("error_adr")) { %>
        <p> error_adr </p>
        <% } %>
        <% if(request.getAttribute("error_name") != null && (Boolean)request.getAttribute("error_name")) { %>
        <p> error_name </p>
        <% } %>
    </div>
</form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
