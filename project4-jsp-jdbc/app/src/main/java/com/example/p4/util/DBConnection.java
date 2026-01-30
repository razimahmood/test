package com.example.p4.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    // Using docker-compose service name "mysql" as host
    private static final String URL =
            "jdbc:mysql://mysql:3306/jsp_project4?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";

    private static final String USER = "root";
    private static final String PASSWORD = "root";

    /**
     * Get a MySQL connection with a simple retry loop.
     * This helps when Tomcat starts faster than MySQL.
     */
    public static Connection getConnection() throws SQLException {
        loadDriver();

        SQLException last = null;

        // Retry up to ~30 seconds (30 tries x 1s)
        for (int i = 1; i <= 30; i++) {
            try {
                return DriverManager.getConnection(URL, USER, PASSWORD);
            } catch (SQLException e) {
                last = e;
                try { Thread.sleep(1000); } catch (InterruptedException ignored) {}
            }
        }

        throw last != null ? last : new SQLException("Failed to connect to DB (unknown error).");
    }

    private static void loadDriver() {
        try {
            // MySQL Connector/J 8+
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(
                    "MySQL JDBC Driver not found. Put mysql-connector-j.jar into WEB-INF/lib.",
                    e
            );
        }
    }
}
