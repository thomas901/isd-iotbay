<%@page import="uts.isd.model.Customer"%>
<%
    //For testing - to be updated when Login feature is implemented
    Customer customer = new Customer(337, "Ima Stanley", "feugiat.", "(08) 5943 0330", "ima123@ligula.co.uk", true, null);
    session.setAttribute("customer", customer);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <a class="button" href="OrderHistoryController">Order History</a><br>
        <a class="button" href="ShopController">Back to shop</a>
    </body>
</html>
