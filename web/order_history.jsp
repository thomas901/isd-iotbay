<%@page import="uts.isd.model.Order"%>
<%@page import="java.util.LinkedList"%>
<%@page import="uts.isd.model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    //for testing
    Customer customer = (Customer)session.getAttribute("customer");
    LinkedList<Order> pastOrders = (LinkedList<Order>)session.getAttribute("pastOrders");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Order history for <%=customer.getName()%>:</h1>
        <a href="account.jsp">Account</a><br>
        <a class="button" href="ShopController">Shop</a>
        <form action="OrderHistoryController" method="post">
            <div>
                <div>
                    <p>Orders placed between</p>
                    <input type="date" name="startDate"> 
                    <p>and</p>
                    <input type="date" name="endDate"> 
                </div>
                <div>
                    <p>Order ID between</p>
                    <input type="number" name="startID"> 
                    <p>and</p>
                    <input type="number" name="endID"> 
                </div>
            </div>
            <input type="submit" class="button " value="Search">
	</form>
        <% if (pastOrders == null) { %>
            <h2>An error occurred trying to retrieve past orders</h2>
        <% } else if (pastOrders.size() == 0) { %>
            <h2>No orders found</h2>
        <% } else { %>
            <table border="1" cellspacing="3" cellpadding="3">
                <tr>
                    <th>Order ID</th>
                    <th>Ordered Date</th>
                    <th>Status</th>
                    <th>Shipped Date</th>
                    <th>Total Price</th>
                    <th>Fulfilled By</th>
                    <th>Address ID</th>
                    <th>Address</th>
                    <th>Payment ID</th>
                    <th>Paid?</th>
                    <th>Date Paid</th>
                    
                </tr>
            <% for (Order order : pastOrders) { %>
                <tr>
                    <td><%=order.getOrderID()%></td>
                    <td><%=order.getOrderedDate()%></td>
                    <td><%=order.getStatus()%></td>
                    <td><%=order.getShippedDate()%></td>
                    <td><%=order.getTotalPrice()%></td>
                    <td><%=order.getFullfilledBy()%></td>
                    <td><%=order.getAddressID()%></td>
                    <td><%=order.getAddress()%></td>
                    <td><%=order.getPaymentID()%></td>
                    <td><%=order.isPaid() ? "Yes" : "No"%></td>
                    <td><%=order.getDatePaid()%></td>
                    <td><a href="ViewPastOrderController?orderID=<%=order.getOrderID()%>">View</a></td>
                </tr>
            <% }  %>
            </table>
        <% } %>
    </body>
</html>