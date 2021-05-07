package uts.isd.model.dao;

import uts.isd.model.User;
import java.sql.*;
import java.util.LinkedList;
import uts.isd.model.Order;
import uts.isd.model.OrderedItem;
/* 
* DBManager is the primary DAO class to interact with the database. 
* Complete the existing methods of this classes to perform CRUD operations with the db.
*/

public class DBManager {
    private Statement st;

    public DBManager(Connection conn) throws SQLException {       
        st = conn.createStatement();   
    }
    
    public void executeUpdate(String update) throws SQLException {
        st.executeUpdate(update);
    }
    
    public void printQuery(String query) throws SQLException {
        ResultSet rs = st.executeQuery(query);
        ResultSetMetaData rsmd = rs.getMetaData();
        int columnsNumber = rsmd.getColumnCount();
        while (rs.next()) {
            for (int i = 1; i <= columnsNumber; i++) {
                if (i > 1) System.out.print(",  ");
                System.out.print(rs.getString(i));
            }
            System.out.println("");
        }
    }
    
    public LinkedList<Order> getPastOrders(int customerID) throws SQLException {
        //explicitly define order to use constructor in same order
        String query = "select OrderID, CustomerID, OrderedDate, Status, ShippedDate, TotalPrice, FullfilledBy, AddressID, Address, PaymentID, Paid, DatePaid from \"ORDER\" where customerID = " + customerID; //order is keyword in SQL so needs to be 'stringed'
        ResultSet rs = st.executeQuery(query);
        LinkedList<Order> orders = new LinkedList<>();
        
        while (rs.next()) {
            orders.add(new Order(rs.getInt(1), rs.getInt(2), rs.getDate(3), rs.getString(4), rs.getDate(5), rs.getDouble(6), rs.getInt(7), rs.getInt(8), rs.getString(9), rs.getInt(10), rs.getBoolean(11), rs.getDate(12)));
        }
        return orders;
    }
    
    public LinkedList<Order> getPastOrders(int customerID, String startDate, String endDate, int startID, int endID) throws SQLException {
        //explicitly define order to use constructor in same order   
        String query = "select OrderID, CustomerID, OrderedDate, Status, ShippedDate, TotalPrice, FullfilledBy, AddressID, Address, PaymentID, Paid, DatePaid from \"ORDER\" where customerID = " + customerID + " and (orderID between " + startID + " and " + endID + ")" + " and (orderedDate between '" + startDate + "' and '" + endDate + "')"; //order is keyword in SQL so needs to be 'stringed'
        ResultSet rs = st.executeQuery(query);
        LinkedList<Order> orders = new LinkedList<>();
        
        while (rs.next()) {
            orders.add(new Order(rs.getInt(1), rs.getInt(2), rs.getDate(3), rs.getString(4), rs.getDate(5), rs.getDouble(6), rs.getInt(7), rs.getInt(8), rs.getString(9), rs.getInt(10), rs.getBoolean(11), rs.getDate(12)));
        }
        return orders;
    }
    
    public LinkedList<OrderedItem> getPastOrder(int orderID) throws SQLException {
        //explicitly define order to use constructor in same order
        String query = "select name, quantity from orderlineitem inner join product on product.productid = orderlineitem.productid where orderid = " + orderID;
        ResultSet rs = st.executeQuery(query);
        LinkedList<OrderedItem> order = new LinkedList<>();
        
        while (rs.next()) {
            order.add(new OrderedItem(rs.getString(1), rs.getInt(2)));
        }
        return order;
    }
}