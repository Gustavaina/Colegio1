
package util;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionMsSQL implements IConexionBase {
   // Cadena Conexion MySQLString 
    String StrConxMsSQL= "jdbc:sqlserver://localhost;databaseName=Northwind;";
    //String StrConxMsSQL= "jdbc:sqlserver://localhost\\sqlexpress;databaseName=db_idat;user=sa;password=P@$$w0rd";
    String StrUserMsSQL= "root"; 
    String StrPassMsSQL= "";
    //Declaraciones de Variables
    Connection Conexion;

    public ConexionMsSQL() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            //DriverManager.setLoginTimeout(300);
            Conexion=DriverManager.getConnection(StrConxMsSQL, StrUserMsSQL, StrPassMsSQL);            
            if (Conexion != null) {                
                DatabaseMetaData dm = (DatabaseMetaData) Conexion.getMetaData();
                System.out.println(this.getClass().getName()+ ": Conexion con MsSQL Establecida..");
                System.out.println("Driver name: " + dm.getDriverName());
                System.out.println("Driver version: " + dm.getDriverVersion());
                System.out.println("Product name: " + dm.getDatabaseProductName());
                System.out.println("Product version: " + dm.getDatabaseProductVersion());
            }            
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
   
   public static void main(String[] args) {
        ConexionMsSQL Cn=new ConexionMsSQL();
   }

    @Override
    public Connection getConexion() {
        return this.Conexion;
    }
 
}
