package metodos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import util.MySQLConexion;

public class CursoMetodos {

    public boolean insertarCurso(String idCurso, String nombreCurso, String nivelCurso, String inicioCurso, String finalCurso) {
    boolean resultado = false;
    String sql = "INSERT INTO curso (id_curso, nombre_curso, nivel_curso, inicio_curso, final_curso) VALUES (?, ?, ?, ?, ?)";
    
    try (Connection con = MySQLConexion.getConexion();
         PreparedStatement ps = con.prepareStatement(sql)) {
        
        ps.setString(1, idCurso);
        ps.setString(2, nombreCurso);
        ps.setString(3, nivelCurso);
        ps.setTimestamp(4, Timestamp.valueOf(inicioCurso));  // Conversión a Timestamp
        ps.setTimestamp(5, Timestamp.valueOf(finalCurso));    // Conversión a Timestamp
        
        int filasAfectadas = ps.executeUpdate();
        if (filasAfectadas > 0) {
            resultado = true; // Curso insertado correctamente
        }
    } catch (SQLException e) {
        e.printStackTrace(); // Imprimir detalles completos del error
    }
    
    return resultado;
}



    public boolean eliminarCurso(int codCurso) {
        String sql = "DELETE FROM curso WHERE cod_curso = ?";
        try (Connection con = MySQLConexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, codCurso);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean actualizarCurso(int codCurso, String idCurso, String nombreCurso, String nivelCurso, String inicioCurso, String finalCurso) {
        String sql = "UPDATE curso SET id_curso = ?, nombre_curso = ?, nivel_curso = ?, inicio_curso = ?, final_curso = ? WHERE cod_curso = ?";
        try (Connection con = MySQLConexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, idCurso);
            ps.setString(2, nombreCurso);
            ps.setString(3, nivelCurso);
            ps.setString(4, inicioCurso);
            ps.setString(5, finalCurso);
            ps.setInt(6, codCurso);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
