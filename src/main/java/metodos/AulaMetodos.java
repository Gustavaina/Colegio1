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

public class AulaMetodos {
    
    public boolean insertarAula(String aula_seccion, int alum_id, String aula_grado, String aula_nivel){
        String sql= "INSERT INTO aula (aula_seccion, alum_id, aula_grado, aula_nivel) VALUES (?,?,?,?)";
        try (Connection con = MySQLConexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
             
            ps.setString(1, aula_seccion);
            ps.setInt(2, alum_id);
            ps.setString(3,aula_grado);
            ps.setString(4,aula_nivel);

            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
   /* public boolean insertarAula(String aulaSeccion, int alumId, String aulaGrado) {
    boolean resultado = false;
    String sql = "INSERT INTO aula (aula_seccion, alum_id, aula_grado) VALUES (?, ?, ?)";

    try (Connection con = MySQLConexion.getConexion();
         PreparedStatement ps = con.prepareStatement(sql)) {
        
        ps.setString(1, aulaSeccion);
        ps.setInt(2, alumId);
        ps.setString(3, aulaGrado);

        resultado = ps.executeUpdate() > 0;

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return resultado;
} */

    
    public boolean actualizarAula(int alum_id,String aula_seccion, String aula_grado,String aula_nivel, int aula_id) {
    String sql = "UPDATE aula SET alum_id = ?, aula_seccion = ?, aula_grado = ?, aula_nivel = ? WHERE aula_id = ?";
    
    try (Connection con = MySQLConexion.getConexion();
         PreparedStatement ps = con.prepareStatement(sql)) {
        
        ps.setInt(1, alum_id);
        ps.setString(2, aula_seccion);
        ps.setString(3, aula_grado);
        ps.setString(4,aula_nivel);
        ps.setInt(5,aula_id);
        
        int rowsUpdated = ps.executeUpdate();
        return rowsUpdated > 0;

    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}
    
    public boolean eliminarAulaporaula_id(int aula_id) {
        String sql = "DELETE FROM aula WHERE aula_id = ?";
        
        try (Connection con = MySQLConexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
             
            ps.setInt(1, aula_id);
            int rowsDeleted = ps.executeUpdate();
            System.out.println(rowsDeleted > 0 ? "El aula fue eliminado correctamente." : "No se encontró el aula.");
            return rowsDeleted > 0;

        } catch (SQLException e) {
            System.out.println("Error al eliminar aula: " + e.getMessage());
            return false;
        }
    }
}
