package com.elvizablog.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
  public static Connection initializeDatabase() throws SQLException, ClassNotFoundException {
    final String dbDriver = "com.mysql.jdbc.Driver";
    final String dbURL = "jdbc:mysql://localhost:3306/";
    final String dbName = "elvizablog";
    final String dbUsername = "root";
    final String dbPassword = "";
    Connection con = null;

    try {
      Class.forName(dbDriver);
      con = DriverManager.getConnection(dbURL + dbName, dbUsername, dbPassword);
    } catch (SQLException e) {
      e.printStackTrace();
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    }
    return con;
  }
}