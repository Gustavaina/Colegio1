package metodos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.MySQLConexion;

public class AlumnoMetodos {
    
    
    
    
    public static String obtenerDniApoderadoPorDniMenor(String dniMenor) {
    Connection con = MySQLConexion.getConexion();
    String dniApoderado = null;
    String sql = "SELECT dni_apoderado FROM apoderados WHERE dni_menor = ?";
    try (PreparedStatement pst = con.prepareStatement(sql)) {
        pst.setString(1, dniMenor);
        try (ResultSet rs = pst.executeQuery()) {
            if (rs.next()) {
                dniApoderado = rs.getString("dni_apoderado");
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    return dniApoderado;
}



    // Método para insertar un alumno con id_pago
     public boolean insertarAlumno(String nombres, String apellidos, String dni, String telefono, String sexo, String direccion, String grado, String nivel, String dniApoderado) {
    String sql = "INSERT INTO alumno (alu_nombres, alu_apellidos, alu_dni, alu_telefono, alu_sexo, alu_direccion, alu_grado, alu_nivel, dni_apoderado) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    try (Connection con = MySQLConexion.getConexion();
         PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setString(1, nombres);
        ps.setString(2, apellidos);
        ps.setString(3, dni);
        ps.setString(4, telefono);
        ps.setString(5, sexo);
        ps.setString(6, direccion);
        ps.setString(7, grado);
        ps.setString(8, nivel);
        ps.setString(9, dniApoderado); // Aquí agregamos el nuevo parámetro
        return ps.executeUpdate() > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}



  public boolean eliminarAlumno(int idAlumno, String dniApoderado) {
    String sql = "DELETE FROM alumno WHERE alu_id = ? AND dni_apoderado = ?";
    try (Connection con = MySQLConexion.getConexion();
         PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setInt(1, idAlumno);
        ps.setString(2, dniApoderado); // Agregamos el parámetro de dni_apoderado
        return ps.executeUpdate() > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}



    public boolean actualizarAlumno(int idAlumno, String nombres, String apellidos, String dni, String telefono, String sexo, String direccion, String grado, String nivel, String dniApoderado) {
    String sql = "UPDATE alumno SET alu_nombres = ?, alu_apellidos = ?, alu_dni = ?, alu_telefono = ?, alu_sexo = ?, alu_direccion = ?, alu_grado = ?, alu_nivel = ?, dni_apoderado = ? WHERE alu_id = ?";
    try (Connection con = MySQLConexion.getConexion();
         PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setString(1, nombres);
        ps.setString(2, apellidos);
        ps.setString(3, dni);
        ps.setString(4, telefono);
        ps.setString(5, sexo);
        ps.setString(6, direccion);
        ps.setString(7, grado);
        ps.setString(8, nivel);
        ps.setString(9, dniApoderado); // Agregamos el nuevo parámetro
        ps.setInt(10, idAlumno);
        return ps.executeUpdate() > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}


}
