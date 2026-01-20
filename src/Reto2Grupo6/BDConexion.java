package Reto2Grupo6;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BDConexion {

    private static final String URL =
    		"jdbc:mysql://localhost:33060/?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASS = "elorrieta";

    public static Connection getConexion() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASS);
    }
}
