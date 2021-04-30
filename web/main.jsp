<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    User user = (User)session.getAttribute("user");
    %>
<html>

    <head>
            <title> Home Page </title>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, intial-scale=1.0">
            <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open Sans">
            <link rel="stylesheet" href="css/index.css">
    </head>
	
    <body>
        <header id="IoTBay">
            <div class="header">
                <h1> Hello, ${user.name} </h1>
                <h2> ${user.email} </h2>
            </div>
        </header>

        <div class="container">
            <% if (user.getAccountType().equals("customer")) { %>
                <input type="button" class="button" value="Shop">
                <input type="button" class="button" value="Account">
                <input type="button" class="button" value="Orders">
            <% } else { %>
                <input type="button" class="button" value="Products">
                <input type="button" class="button" value="Users">
                <input type="button" class="button" value="Logs">
            <% } %>
        </div>
        <div class="container">
            <input type="button" class="button" value="Logout" onclick=location.href="logout.jsp">
        </div>
    </body> 
    
</html>
