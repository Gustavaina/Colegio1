package metodos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import util.MySQLConexion;

public class TurnoMetodos {

    public boolean insertarTurno(String descripcion) {
        String sql = "INSERT INTO turno (descripcion) VALUES (?)";
        try (Connection con = MySQLConexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, descripcion);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean eliminarTurno(int idTurno) {
        String sql = "DELETE FROM turno WHERE id_turno = ?";
        try (Connection con = MySQLConexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idTurno);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean actualizarTurno(int idTurno, String descripcion) {
        String sql = "UPDATE turno SET descripcion = ? WHERE id_turno = ?";
        try (Connection con = MySQLConexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, descripcion);
            ps.setInt(2, idTurno);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
