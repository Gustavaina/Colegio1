
package util;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionORACLE implements IConexionBase{
    // Cadena Conexion MySQLString 
    String StrConxORACLE= "jdbc:oracle:thin:@localhost:1521:XE";
    String StrUserORACLE= "hr";
    String StrPassORACLE= "123456";
    //Declaraciones de Variables
    Connection Conexion;
    public ConexionORACLE(){
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            //DriverManager.setLoginTimeout(300);
            Conexion=DriverManager.getConnection(StrConxORACLE, StrUserORACLE, StrPassORACLE);
            if (Conexion != null) {                
                DatabaseMetaData dm = (DatabaseMetaData) Conexion.getMetaData();
                System.out.println(this.getClass().getName()+ ": Conexion con Oracle Establecida..");
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
        ConexionORACLE Cn=new ConexionORACLE();
   }

    @Override
    public Connection getConexion() {
        return this.Conexion;
    }
    
}
