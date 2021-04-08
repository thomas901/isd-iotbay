<%-- 
    Document   : welcome
    Created on : 08/04/2021, 3:31:43 AM
    Author     : Minty
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Welcome Page</title>
    </head>
    <body>
        <h1>Welcome Page</h1>
        <%
            String name = request.geParameter("name");
            String email = request.geParameter("email");
            String password = request.geParameter("password");
            String dob = request.geParameter("dob");
        %>
        
        
    </body>
</html>
