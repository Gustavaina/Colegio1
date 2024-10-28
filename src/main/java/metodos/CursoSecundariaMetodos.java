/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package metodos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import util.MySQLConexion;
import java.sql.ResultSet;

public class CursoSecundariaMetodos {
    public boolean insertaCursoSec(int aula_id, String curso_matematica, String curso_fisica, String curso_redaccion, String curso_historia, String curso_tutoria, String curso_ciencias, String curso_ingles, String curso_edu_fisica){
        String sql= "INSERT INTO cursossecundaria (aula_id, curso_matematica, curso_fisica, curso_redaccion, curso_historia, curso_tutoria, curso_ciencias, curso_ingles, curso_edu_fisica) VALUES (?,?,?,?,?,?,?,?,?)";
        try (Connection con = MySQLConexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
             
            ps.setInt(1, aula_id);
            ps.setString(2,curso_matematica);
            ps.setString(3, curso_fisica);
            ps.setString(4, curso_redaccion);
            ps.setString(5, curso_historia);
            ps.setString(6, curso_tutoria);
            ps.setString(7,curso_ciencias);
            ps.setString(8,curso_ingles);
            ps.setString(9,curso_edu_fisica);



            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean actualizarCursoSec(int aula_id, String curso_matematica, String curso_fisica, String curso_redaccion, String curso_historia, String curso_tutoria, String curso_ciencias, String curso_ingles, String curso_edu_fisica, int cursosec_id) {
    String sql = "UPDATE cursossecundaria SET aula_id = ?, curso_matematica = ?, curso_fisica = ?, curso_redaccion = ?, curso_historia = ?, curso_tutoria = ?, curso_ciencias = ?, curso_ingles = ?, curso_edu_fisica = ? WHERE cursosec_id = ?";
    
    try (Connection con = MySQLConexion.getConexion();
         PreparedStatement ps = con.prepareStatement(sql)) {
        
        ps.setInt(1, aula_id);
        ps.setString(2,curso_matematica);
        ps.setString(3, curso_fisica);
        ps.setString(4, curso_redaccion);
        ps.setString(5, curso_historia);
        ps.setString(6, curso_tutoria);
        ps.setString(7,curso_ciencias);
        ps.setString(8,curso_ingles);
        ps.setString(9,curso_edu_fisica);
        ps.setInt(10,cursosec_id);
        
        int rowsUpdated = ps.executeUpdate();
        return rowsUpdated > 0;

    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}
        public boolean eliminarCursoporcursoid(int cursosec_id) {
        String sql = "DELETE FROM cursossecundaria WHERE cursosec_id = ?";
        
        try (Connection con = MySQLConexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
             
            ps.setInt(1, cursosec_id);
            int rowsDeleted = ps.executeUpdate();
            System.out.println(rowsDeleted > 0 ? "El curso fue eliminado correctamente." : "No se encontró el curso.");
            return rowsDeleted > 0;

        } catch (SQLException e) {
            System.out.println("Error al eliminar curso: " + e.getMessage());
            return false;
        }
    }
}
    
    
    
