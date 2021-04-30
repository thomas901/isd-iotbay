<%@page import="uts.isd.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    User user = (User)session.getAttribute("user");
    %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title> Welcome Page</title>
                <link rel="stylesheet" href="css/welcome.css">
	</head>
	<body>
            <% if (user != null) { %>
                <div class="container">   
                <div class="header" >
                    <h1> Welcome, ${user.name} </h1> 
             
                
                <div> You will be redirected to main page in </div> 
                <div id="counter" > 5 </div>  

                <div> <p> If you are not automatically redirected please <a href="main.jsp"> click here! </a> </p>     
            </div>        
                <script>
                    setInterval(function() {
                        var div = document.querySelector("#counter");
                        var count = div.textContent * 1 - 1;
                        div.textContent = count;
                        if (count <= 0) {
                            window.location="main.jsp";
                        }
                    }, 1000);
                </script>
             <% } else { %>
                 <h1 class="error">Not logged in </h1>
             <% } %>
        </body>
             
             
  
	</body>
</html>
