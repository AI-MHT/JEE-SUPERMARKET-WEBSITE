package connectiondb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class connectiondb {
    private static Connection conn;

    static {
        try {
            // Load the MySQL driver
            Class.forName("com.mysql.jdbc.Driver");

            // Set the connection string
            String url = "jdbc:mysql://localhost:3306/superm";
            String user = "root";
            String password = "";

            // Create the connection object
            conn = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() {
        return conn;
    }
}
