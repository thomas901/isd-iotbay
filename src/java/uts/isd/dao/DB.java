package uts.isd.dao;

import java.sql.Connection;

public abstract class DB {
    protected String URL = "jdbc::derby://localhost:1527/";
    protected String db = "IOTDB";
    protected String dbuser = "iotdb";
    protected String dbpass = "pass";
    protected String driver = "org.apache.derby.jdbc.ClientDriver";
    protected Connection conn;
}
