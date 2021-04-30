<%@page import="uts.isd.model.User"%>
<%@page import="uts.isd.model.UserList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% UserList userList = (UserList)application.getAttribute("userList");
if (userList == null) {
   application.setAttribute("userList", new UserList());
}%>

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
                <h1> IoTBay </h1>
                <h2> Driven by the Internet </h2>
            </div>
        </header>

        <div class="container">
            <input type="button" class="button" value="Login" onclick=location.href="login.jsp">
            <input type="button" class="button" value="Register" onclick=location.href="register.jsp">
        </div>
    </body> 
    
</html>
