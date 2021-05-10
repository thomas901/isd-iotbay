<%@page import="uts.isd.model.Order"%>
<%@page import="java.util.LinkedList"%>
<%@page import="uts.isd.model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    //for testing
    Customer customer = (Customer)session.getAttribute("customer");
    LinkedList<Order> savedOrders = (LinkedList<Order>)session.getAttribute("savedOrders");
    String message = (String)request.getParameter("message");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Saved orders</h1>
        <h2><%=message == null ? "" : message%></h2>
        <a href="account.jsp">Account</a><br>
        <a class="button" href="ShopController">Shop</a>
        <% if (savedOrders == null) { %>
            <h2>An error occurred trying to retrieve saved orders</h2>
        <% } else if (savedOrders.size() == 0) { %>
            <h2>You have no saved orders</h2>
        <% } else { %>
            <table border="1" cellspacing="3" cellpadding="3">
                <tr>
                    <th>Order ID</th>
                    <th>Total Price</th>
                    <th>Payment ID</th>
                    <th>Address ID</th>
                    <th>Address</th>
                </tr>
            <% for (Order order : savedOrders) { %>
                <tr>
                    <td><%=order.getOrderID()%></td>
                    <td><%=order.getTotalPrice()%></td>
                    <td><%=order.getPaymentID()%></td>
                    <td><%=order.getAddressID()%></td>
                    <td><%=order.getAddress()%></td>
                    <td><a href="ViewSavedOrderController?orderID=<%=order.getOrderID()%>">Resume</a></td>
                </tr>
            <% }  %>
            </table>
        <% } %>
    </body>
</html>