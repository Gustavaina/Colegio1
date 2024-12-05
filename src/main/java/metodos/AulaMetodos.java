package metodos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import util.MySQLConexion;

public class AulaMetodos {

    public boolean insertarAula(String idAula, String descripc, String tipoAula, String grado, String seccion, int codCurso, int idTurno, int idAlum) {
        String sql = "INSERT INTO aula (id_aula, descripc, tipo_aula, grado, seccion, cod_curso, id_turno, id_alum) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = MySQLConexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, idAula);
            ps.setString(2, descripc);
            ps.setString(3, tipoAula);
            ps.setString(4, grado);
            ps.setString(5, seccion);
            ps.setInt(6, codCurso);
            ps.setInt(7, idTurno);
            ps.setInt(8, idAlum);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean eliminarAula(int codAula) {
        String sql = "DELETE FROM aula WHERE cod_aula = ?";
        try (Connection con = MySQLConexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, codAula);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean actualizarAula(int codAula, String idAula, String descripc, String tipoAula, String grado, String seccion, int codCurso, int idTurno, int idAlum) {
        String sql = "UPDATE aula SET id_aula = ?, descripc = ?, tipo_aula = ?, grado = ?, seccion = ?, cod_curso = ?, id_turno = ?, id_alum = ? WHERE cod_aula = ?";
        try (Connection con = MySQLConexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, idAula);
            ps.setString(2, descripc);
            ps.setString(3, tipoAula);
            ps.setString(4, grado);
            ps.setString(5, seccion);
            ps.setInt(6, codCurso);
            ps.setInt(7, idTurno);
            ps.setInt(8, idAlum);
            ps.setInt(9, codAula);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
