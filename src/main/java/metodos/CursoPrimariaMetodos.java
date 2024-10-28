package metodos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import util.MySQLConexion;
import java.sql.ResultSet;

public class CursoPrimariaMetodos {

    public boolean insertarCursoPri(int aula_id, String curso_matematica, String curso_comunicacion, String curso_ingles, String cursos_ciencias, String curso_arte,
            String curso_edu_fisica, String curso_historia){
        String sql= "INSERT INTO cursosprimaria (aula_id, curso_matematica, curso_comunicacion, curso_ingles, cursos_ciencias, curso_arte, curso_edu_fisica, curso_historia)VALUES (?,?,?,?,?,?,?,?)";
        try (Connection con = MySQLConexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
             
            ps.setInt(1, aula_id);
            ps.setString(2,curso_matematica);
            ps.setString(3,curso_comunicacion);
            ps.setString(4,curso_ingles);
            ps.setString(5,cursos_ciencias);
            ps.setString(6,curso_arte);
            ps.setString(7,curso_edu_fisica);
            ps.setString(8,curso_historia);
            
            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    /*public boolean insertarCursoPri(int aulaId, String cursoMatematica, String cursoComunicacion, String cursoIngles,
                                String cursoCiencias, String cursoArte, String cursoEduFisica, String cursoHistoria) {
    Connection con = null;
    PreparedStatement ps = null;

    try {
        con = MySQLConexion.getConexion();
        String sql = "INSERT INTO cursosprimaria (aula_id, curso_matematica, curso_comunicacion, curso_ingles, curso_ciencias, curso_arte, curso_edu_fisica, curso_historia) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        ps = con.prepareStatement(sql);
        ps.setInt(1, aulaId);
        ps.setString(2, cursoMatematica);
        ps.setString(3, cursoComunicacion);
        ps.setString(4, cursoIngles);
        ps.setString(5, cursoCiencias);
        ps.setString(6, cursoArte);
        ps.setString(7, cursoEduFisica);
        ps.setString(8, cursoHistoria);

        int resultado = ps.executeUpdate();
        return resultado > 0; // Retorna true si se insertó al menos una fila
    } catch (SQLException e) {
        e.printStackTrace(); // Imprimir el error en la consola
        return false; // Retorna false si hubo un error
    } finally {
        if (ps != null) {
            try {
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}*/


    
    public boolean actualizarCursoPri(int aula_id, String curso_matematica, String curso_comunicacion, String curso_ingles, String cursos_ciencias, String curso_arte,
            String curso_edu_fisica, String curso_historia, int curso_id ) {
    String sql = "UPDATE cursosprimaria SET aula_id = ?, curso_matematica = ?, curso_comunicacion = ?, curso_ingles = ?, cursos_ciencias  = ?, curso_arte = ?, curso_edu_fisica = ?, curso_historia = ? WHERE curso_id= ?";
    
    try (Connection con = MySQLConexion.getConexion();
         PreparedStatement ps = con.prepareStatement(sql)) {
        
        ps.setInt(1, aula_id);
        ps.setString(2,curso_matematica);
        ps.setString(3,curso_comunicacion);
        ps.setString(4,curso_ingles);
        ps.setString(5,cursos_ciencias);
        ps.setString(6,curso_arte);
        ps.setString(7,curso_edu_fisica);
        ps.setString(8,curso_historia);
        ps.setInt(9, curso_id);
        
        int rowsUpdated = ps.executeUpdate();
        return rowsUpdated > 0;

    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}
    
    public boolean eliminarCursoPri_por_idcurso(int curso_id) {
        String sql = "DELETE FROM cursosprimaria WHERE curso_id = ?";
        
        try (Connection con = MySQLConexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
             
            ps.setInt(1, curso_id);
            int rowsDeleted = ps.executeUpdate();
            System.out.println(rowsDeleted > 0 ? "El curso fue eliminado correctamente." : "No se encontró el curso.");
            return rowsDeleted > 0;

        } catch (SQLException e) {
            System.out.println("Error al eliminar curso: " + e.getMessage());
            return false;
        }
    }
}
