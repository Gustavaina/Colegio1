package metodos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import util.MySQLConexion;
import java.sql.ResultSet;

public class AlumnoMetodos {

    // Método para insertar un nuevo alumno
    public boolean insertarAlumno(String nombre, String apellidos, String dni, String telefono, String sexo, String direccion, String grado, String nivel) {
        String sql = "INSERT INTO alumno (alu_nombres, alu_apellidos, alu_dni, alu_telefono, alu_sexo, alu_direccion, alu_grado, alu_nivel) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = MySQLConexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
             
            ps.setString(1, nombre);
            ps.setString(2, apellidos);
            ps.setString(3, dni);
            ps.setString(4, telefono);
            ps.setString(5, sexo);
            ps.setString(6, direccion);
            ps.setString(7, grado); // Agregar grado
            ps.setString(8, nivel);  // Agregar nivel

            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

  // Método para actualizar un alumno existente
public boolean actualizarAlumno(String dni, String nombre, String apellidos, String telefono, String sexo, String direccion, String grado, String nivel) {
    String sql = "UPDATE alumno SET alu_nombres = ?, alu_apellidos = ?, alu_telefono = ?, alu_sexo = ?, alu_direccion = ?, alu_grado = ?, alu_nivel = ? WHERE alu_dni = ?";
    
    try (Connection con = MySQLConexion.getConexion();
         PreparedStatement ps = con.prepareStatement(sql)) {
        
        ps.setString(1, nombre);
        ps.setString(2, apellidos);
        ps.setString(3, telefono);
        ps.setString(4, sexo);
        ps.setString(5, direccion);
        ps.setString(6, grado);
        ps.setString(7, nivel);
        ps.setString(8, dni); // Condición para actualizar por DNI

        int rowsUpdated = ps.executeUpdate();
        return rowsUpdated > 0;

    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}





    // Método para eliminar un alumno por DNI
    public boolean eliminarAlumnoPorDni(String dni) {
        String sql = "DELETE FROM alumno WHERE alu_dni = ?";
        
        try (Connection con = MySQLConexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
             
            ps.setString(1, dni);
            int rowsDeleted = ps.executeUpdate();
            System.out.println(rowsDeleted > 0 ? "Alumno eliminado correctamente." : "No se encontró el alumno.");
            return rowsDeleted > 0;

        } catch (SQLException e) {
            System.out.println("Error al eliminar alumno: " + e.getMessage());
            return false;
        }
    }

    // Método para verificar si el DNI ya existe
    public boolean verificarDni(String dni) {
        boolean existe = false;
        String query = "SELECT COUNT(*) FROM alumno WHERE alu_dni = ?"; 

        try (Connection con = MySQLConexion.getConexion(); 
             PreparedStatement stmt = con.prepareStatement(query)) {
            
            stmt.setString(1, dni);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                existe = rs.getInt(1) > 0; 
            }
        } catch (Exception e) {
            e.printStackTrace(); 
        }
        return existe;
    }
} 