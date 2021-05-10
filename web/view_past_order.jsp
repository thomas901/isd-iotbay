<%@page import="uts.isd.model.OrderedItem"%>
<%@page import="uts.isd.model.Order"%>
<%@page import="java.util.LinkedList"%>
<%@page import="uts.isd.model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    //for testing
    Customer customer = (Customer)session.getAttribute("customer");
    LinkedList<OrderedItem> order = (LinkedList<OrderedItem>)session.getAttribute("pastOrder");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Order <%=request.getParameter("orderID")%></h1>
        <a class="button" href="OrderHistoryController">Order History</a><br>
        <% if (order == null) { %>
            <h2>An error occurred trying to retrieve this order</h2>
        <% } else if (order.size() == 0) { %>
            <h2>This order contained no items</h2>
        <% } else { %>
            <table border="1" cellspacing="3" cellpadding="3">
                <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    
                </tr>
            <% for (OrderedItem item : order) { %>
                <tr>
                    <td><%=item.getName()%></td>
                    <td><%=item.getQuantity()%></td>
                </tr>
            <% }  %>
            </table>
        <% } %>
    </body>
</html>