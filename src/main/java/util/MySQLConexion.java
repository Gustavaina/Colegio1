package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLConexion {
    
    public static Connection getConexion() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3306/sgm"; 
            String usr = "root"; 
            String psw = ""; 

            con = DriverManager.getConnection(url, usr, psw); 
            System.out.println("Conexión exitosa a la base de datos.");
        } catch (ClassNotFoundException ex) {
            System.out.println("Error: No se encontró el driver de MySQL.");
            ex.printStackTrace(); 
        } catch (SQLException ex) {
            System.out.println("Error al conectar con la base de datos: " + ex.getMessage());
            ex.printStackTrace(); 
        }
        return con; 
    }
}


 


