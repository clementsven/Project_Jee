<%--
  Created by IntelliJ IDEA.
  User: Safyrus
  Date: 06/01/2022
  Time: 13:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Profil</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
    <%@ include file="nav.jsp" %>

    <h2>${username} profile</h2>
    <form action="profil"  method="post">
<%--        <label for="username" >Username:</label><br>--%>
<%--        <input type="text" id="username" name="username" value="${username}" required><br>--%>
        <label for="first_name" >First name:</label><br>
        <input type="text" id="first_name" name="first_name" value="${first_name}"><br>
        <label for="last_name" >Last name:</label><br>
        <input type="text" id="last_name" name="last_name" value="${last_name}"><br>
        <label for="date" >Birth Date:</label><br>
        <input type="date" id="date" name="date" value="${date}"><br>
        <input type="submit" value="Save">
        <% if(request.getAttribute("error_date") != null && (Boolean)request.getAttribute("error_date")) { %>
        <p> Date is incorrect </p>
        <% } %>
<%--        <% if(request.getAttribute("error_user") != null && (Boolean)request.getAttribute("error_user")) { %>--%>
<%--        <p> Username is already used </p>--%>
<%--        <% } %>--%>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
