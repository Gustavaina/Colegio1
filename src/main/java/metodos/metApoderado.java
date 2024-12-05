package metodos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import util.MySQLConexion;


public class metApoderado {

/*    // Método para agregar un apoderado
    public void agregarApoderado(String nombre, String apellidos, String telefono, String correo, String direccion, String dniMenor, String sexo, String dniApoderado) throws SQLException {
        // Implementación para agregar un apoderado en la base de datos
        Connection con = MySQLConexion.getConexion();
        String sql = "INSERT INTO apoderados (nombres, apellidos, telefono, correo_electronico, direccion, dni_menor, sexo, dni_apoderado) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, nombre);
            ps.setString(2, apellidos);
            ps.setString(3, telefono);
            ps.setString(4, correo);
            ps.setString(5, direccion);
            ps.setString(6, dniMenor);
            ps.setString(7, sexo);
            ps.setString(8, dniApoderado);
            ps.executeUpdate();
        } finally {
            con.close(); // Asegúrate de cerrar la conexión
        }
    }
*/
    public int agregarApoderado(String nombres, String apellidos, String telefono, String correo, String direccion, String dniMenor, String sexo, String dniApoderado) throws SQLException {
    String sql = "INSERT INTO apoderados (nombres, apellidos, telefono, correo_electronico, direccion, dni_menor, sexo, dni_apoderado) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    try (Connection con = MySQLConexion.getConexion();
         PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setString(1, nombres);
        ps.setString(2, apellidos);
        ps.setString(3, telefono);
        ps.setString(4, correo);
        ps.setString(5, direccion);
        ps.setString(6, dniMenor);
        ps.setString(7, sexo);
        ps.setString(8, dniApoderado);

        return ps.executeUpdate();  // Devuelve la cantidad de filas afectadas
    }
}

  public void editarApoderado(String nombres, String apellidos, String telefono, String correo, String direccion, String dniMenor, String sexo, String dniApoderado, int id) throws SQLException {
    String sql = "UPDATE apoderados SET nombres = ?, apellidos = ?, telefono = ?, correo_electronico = ?, direccion = ?, dni_menor = ?, sexo = ?, dni_apoderado = ? WHERE id = ?";
    try (Connection con = MySQLConexion.getConexion();
         PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setString(1, nombres);
        ps.setString(2, apellidos);
        ps.setString(3, telefono);
        ps.setString(4, correo);
        ps.setString(5, direccion);
        ps.setString(6, dniMenor);
        ps.setString(7, sexo);
        ps.setString(8, dniApoderado);
        ps.setInt(9, id); // Usando el id como identificador único

        ps.executeUpdate();
    }
}





    // Método para eliminar un apoderado
   public void eliminarApoderado(String dniApoderado) throws SQLException {
    String sql = "DELETE FROM apoderados WHERE dni_apoderado = ?";
    try (Connection con = MySQLConexion.getConexion();
         PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setString(1, dniApoderado);
        ps.executeUpdate();
    }
}

}

    
    
