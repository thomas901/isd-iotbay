package uts.isd.model.dao;

import uts.isd.model.User;
import java.sql.*;
import java.util.ArrayList;
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
}