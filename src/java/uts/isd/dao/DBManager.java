package uts.isd.dao;

import uts.isd.User;
import java.sql.*;

public class DBManager {

    private Statement st;
   
    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

    //Find Customers by ID in the database. Probably the login page 
    public User findUser(String email, String password) throws SQLException{
        // return a customer
        String fetch = "select * from IOTDB.CUSTOMER where EMAIL = '" + email + 
            "' and PASSWORD='" + password + "'";
        ResultSet rs = st.executeQuery(fetch);

        while(rs.next()) {
            String customerEmail = rs.getString(4);
            String customerPassword = rs.getString(2);
            if(customerEmail.equals(email) && customerPassword.equals(password)) {
                String customerName = rs.getString(2);
                return new User(customerEmail, customerPassword, customerName, "customer"); 
            }
        }
        return null;
    }

    public void addUser(String email, String name, String password, String gender, String favcol) throws SQLException {
        // add user 
    }

    public void updateUser(String email, String name, String password, String gender, String favcol) throws SQLException {
        // code for update-operation
    }

    public void deleteUser(String email) throws SQLException {
        // code for delete-operation
    }

}
