<%@page import="uts.isd.model.User"%>
<%@page import="uts.isd.model.UserList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% String submitted = request.getParameter("submitted"); %>
<% UserList temp = (UserList)application.getAttribute("userList");
if (temp == null) {
   application.setAttribute("userList", new UserList());
}%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/login.css">
        <title> Login Page</title>
    </head>
    <body>
        
        <form action="login.jsp" method="post">
            <div class="container">
                <div class="header"> 
                    <h1> <b> Login </b> </h1>     
                </div> 
                
                <p> Email:</p>
                    <input type="email" placeholder="Email" name="email" required> 

                <p> Password: </p>
                <input type="password" placeholder="Password" name="password" required>    
                
            

                <div>
                   <input type="button" class="button button-color " value="Go Back" onclick=location.href="landing.jsp"> 
                   <input type="hidden" name="submitted" value="yes">
                   <input type="submit" class="button " value="Login">
               </div>
                
                <p> Don't have an account? <a href="register.jsp"> Click here to register! </a> </p> 
             <% if (submitted != null) {
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");
                    UserList userList = (UserList)application.getAttribute("userList");
                    User user = userList.getUser(email, password);
                    if (user != null) {
                        session.setAttribute("user", user);
                        response.sendRedirect("welcome.jsp");
                    } else {
                        %><p class="error">Login failed</p><%
                    }
                } %>   
            </div>      
        </form>
    </body>
</html>
