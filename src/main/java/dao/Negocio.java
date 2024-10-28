package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modelo.AlumnoBean;
import modelo.CursoBean2;
import modelo.MatriculaBean;
import modelo.NotasBean;
import modelo.PensionBean;
import util.MySQLConexion;
import static util.MySQLConexion.getConexion;

public class Negocio extends MySQLConexion {

    public ArrayList<MatriculaBean> SelectAll() {

        ArrayList<MatriculaBean> lista = new ArrayList<MatriculaBean>();//NULA
        String call = "{call prcMostrarMatriculados()}";
        CallableStatement cstm = null;
        ResultSet res = null;
        try {
            cstm = getConexion().prepareCall(call);
            cstm.execute();
            res = cstm.getResultSet();
            while (res.next()) {
                MatriculaBean cMatricula = new MatriculaBean();

                cMatricula.setAlu_nombres(res.getString("alu_nombres"));
                cMatricula.setAlu_apellidos(res.getString("alu_apellidos"));
                cMatricula.setAlu_dni(res.getString("alu_dni"));
                cMatricula.setMatricula_fecha_ingreso(res.getString("matricula_fecha_ingreso"));
                cMatricula.setSec_descri(res.getString("sec_descri"));
                cMatricula.setId_matricula(res.getString("id_matricula"));
                cMatricula.setAlu_id(res.getString("id_alumno"));
                cMatricula.setMatricula_estado(res.getInt("matricula_estado"));
                //  cMatricula.setDescri_alumno(res.getString("alu_nombres"));
                //  cMatricula.setDescri_seccion(res.getString("sec_descri"));

                lista.add(cMatricula); //AGREGAMOS EL ITEM                
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return lista;
    }

    //NOTAS
    public NotasBean SelectByCodigo(String codigo) {
        NotasBean cBE = new NotasBean();//NULA
        String call = "{call prcNotasSelectByCodigo(?)}";
        CallableStatement cstm = null;
        ResultSet res = null;
        try {
            cstm = getConexion().prepareCall(call);
            cstm.setString(1, codigo);
            res = cstm.executeQuery();
            while (res.next()) {

                cBE.setId_notas(res.getString("id_notas"));
                cBE.setId_matricula(res.getString("id_matricula"));
                cBE.setId_curso(res.getString("id_curso"));
                cBE.setNot_observ(res.getString("not_observ"));
                cBE.setNot_valor(Double.parseDouble(res.getString("not_valor")));
                cBE.setNot_estcod(Integer.parseInt(res.getString("not_estcod")));
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());

        }
        System.out.println("ERROR AL CONSULTAR");
        return cBE;
    }

    /*     @Override*/
    public ArrayList<NotasBean> SelectAllNotas() {

        ArrayList<NotasBean> lista = new ArrayList<NotasBean>();//NULA
        String call = "{call prcNotasMostrarNotas()}";
        CallableStatement cstm = null;
        ResultSet res = null;
        try {
            cstm = getConexion().prepareCall(call);
            cstm.execute();
            res = cstm.getResultSet();
            while (res.next()) {
                NotasBean cNotas = new NotasBean();

                cNotas.setId_notas(res.getString("id_notas"));
                cNotas.setMat_id(res.getString("id_matricula"));
                cNotas.setDescripcion_curso(res.getString("descripcion_curso"));
                cNotas.setNot_observ(res.getString("not_observ"));
                cNotas.setNot_valor(res.getDouble("not_valor"));
                cNotas.setNot_estcod(res.getInt("not_estcod"));

                lista.add(cNotas); //AGREGAMOS EL ITEM                
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return lista;
    }

    //lista notas x matricula
    public List<NotasBean> notasByMatri(String Mat_id) {
        List<NotasBean> notas = new ArrayList<>();
        String sql = "SELECT id_notas, not_observ, not_valor FROM notas WHERE id_matricula = ?";
//        CallableStatement cstm = null;
//        ResultSet res = null;
        try (Connection conn = MySQLConexion.getConexion(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, Mat_id);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    NotasBean nota = new NotasBean();
                    nota.setId_notas(rs.getString("id_notas"));
                    nota.setNot_observ(rs.getString("not_observ"));
                    nota.setNot_valor(rs.getDouble("not_valor"));
                    notas.add(nota);

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();

        }
        return notas;

    }

    public List<CursoBean2> obtenerCursosRelacionadosConNotas(String id_notas) {
        List<CursoBean2> listaCursos = new ArrayList<>();
        String sql = "SELECT curso.id_curso, curso.nombre_curso, curso.descripcion_curso "
                + "FROM notas "
                + "INNER JOIN curso ON notas.id_curso = curso.id_curso";
        try (Connection conn = MySQLConexion.getConexion(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                CursoBean2 curso = new CursoBean2();
                curso.setId_curso(rs.getString("id_curso"));
                curso.setNombre_curso(rs.getString("nombre_curso"));
                curso.setDescripcion_curso(rs.getString("descripcion_curso"));
                listaCursos.add(curso);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaCursos;
    }

    public ArrayList<CursoBean2> SelectAllCur() {

        ArrayList<CursoBean2> lista = new ArrayList<CursoBean2>();
        String call = "{call prcCursoSelectAll()}";
        CallableStatement cstm = null;
        ResultSet res = null;
        try {

            cstm = getConexion().prepareCall(call);

            //  res = stm.executeQuery(SQL);
            cstm.execute();
            res = cstm.getResultSet();
            // lista= new ArrayList<CursoBean2>();//VACIA
            while (res.next()) {
                CursoBean2 cCurso = new CursoBean2();

                cCurso.setId_curso(res.getString("id_curso"));
                cCurso.setNombre_curso(res.getString("nombre_curso"));
                cCurso.setDescripcion_curso(res.getString("descripcion_curso"));
                cCurso.setEstado_curso(res.getInt("estado_curso"));
                lista.add(cCurso); //AGREGAMOS EL ITEM 

            }
        } catch (SQLException e) {
            System.out.println("" + e.getMessage());
        }
        return lista;
    }

    public List<AlumnoBean> ListCurAlu(String cursoId) {
        List<AlumnoBean> listaAlumnos = new ArrayList<>();
        String sql = "SELECT a.id_alumno, a.alu_nombres, a.alu_apellidos "
                + "FROM matricula m "
                + "INNER JOIN alumno a ON m.alu_codigo = a.id_alumno "
                + "INNER JOIN curso_x_seccion cxs ON m.id_seccion = cxs.id_seccion "
                + "INNER JOIN curso c ON cxs.cur_codigo = c.id_curso "
                + "WHERE c.id_curso = ?";

        try (Connection conn = MySQLConexion.getConexion(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, cursoId);  // Asigna el ID del curso al parámetro
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    AlumnoBean alumno = new AlumnoBean();
                    alumno.setAlu_id(rs.getString("id_alumno"));
                    alumno.setAlu_nombres(rs.getString("alu_nombres"));
                    alumno.setAlu_apellidos(rs.getString("alu_apellidos"));
                    listaAlumnos.add(alumno);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaAlumnos;
    }

     public List<AlumnoBean> SelectAllAlu() {
        List<AlumnoBean> lista = new ArrayList<>();
        String SQL = "SELECT * FROM alumno";
        try (Connection conn = MySQLConexion.getConexion(); Statement stm = conn.createStatement(); ResultSet res = stm.executeQuery(SQL)) {
            while (res.next()) {
                AlumnoBean aAlumno = new AlumnoBean();
                aAlumno.setAlu_id(res.getString("id_alumno"));
                aAlumno.setAlu_nombres(res.getString("alu_nombres"));
                aAlumno.setAlu_apellidos(res.getString("alu_apellidos"));
                aAlumno.setAlu_dni(res.getString("alu_dni"));
                aAlumno.setAlu_telefono(res.getString("alu_telefono"));
                aAlumno.setAlu_sexo(res.getString("alu_sexo"));
                aAlumno.setAlu_direccion(res.getString("alu_direccion"));
                lista.add(aAlumno);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    public ArrayList<PensionBean> SelectAllPen() {
        ArrayList<PensionBean> lista = new ArrayList<PensionBean>();//NULA
        String call = "{call prcPensionSelectAll()}";
        CallableStatement cstm = null;
        ResultSet res = null;
        try {
            cstm = getConexion().prepareCall(call);
            cstm.execute();
            res = cstm.getResultSet();
            while (res.next()) {
                PensionBean cPension = new PensionBean();
                cPension.setId_pension(res.getString("id_pension"));
                cPension.setId_matricula(res.getString("id_matricula"));
                cPension.setId_alumno(res.getString("id_alumno"));
                cPension.setPension_mes(res.getString("pension_mes"));
                cPension.setPension_monto(res.getDouble("pension_monto"));
                cPension.setPension_descuento(res.getDouble("pension_descuento"));
                cPension.setPension_mora(res.getDouble("pension_mora"));
                cPension.setPension_fecha_registro(res.getString("pension_fecha_registro"));
                cPension.setPension_fecha_vencimiento(res.getString("pension_fecha_vencimiento"));
                cPension.setPension_estado(res.getInt("estado"));

                lista.add(cPension); //AGREGAMOS EL ITEM                
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return lista;
    }

  public List<PensionBean> cargarPenAlu(String selectedAlumnoId) {
        List<PensionBean> pensiones = new ArrayList<>();
        String sql = "SELECT a.alu_nombres, p.pension_mes, p.pension_monto, p.pension_descuento, p.pension_mora, p.pension_fecha_registro, p.pension_fecha_vencimiento, p.estado " +
                     "FROM ALUMNO a " +
                     "JOIN MATRICULA m ON a.id_alumno = m.id_alumno " +
                     "JOIN PENSIONES p ON m.id_matricula = p.id_matricula " +
                     "WHERE a.id_alumno = ? " +
                     "ORDER BY p.pension_mes";
        
        try (Connection conn = MySQLConexion.getConexion(); PreparedStatement ps = conn.prepareStatement(sql)){
            ps.setString(1, selectedAlumnoId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    PensionBean pension = new PensionBean();
                    pension.setNombres_alu(rs.getString("alu_nombres"));
                    pension.setPension_mes(rs.getString("pension_mes"));
                    pension.setPension_monto(rs.getDouble("pension_monto"));
                    pension.setPension_descuento(rs.getDouble("pension_descuento"));
                    pension.setPension_mora(rs.getDouble("pension_mora"));
                    pension.setPension_fecha_registro(rs.getString("pension_fecha_registro"));
                    pension.setPension_fecha_vencimiento(rs.getString("pension_fecha_vencimiento"));
                    pension.setPension_estado(rs.getInt("estado"));
                    pensiones.add(pension);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pensiones;
    }
  

    public List<AlumnoBean> countStudentsByGender(String sex) {
        List<AlumnoBean> list = new ArrayList<>();
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "{call CountStudentsByGender(?)}";
            CallableStatement st = cn.prepareCall(sql);
            if (sex != null && !sex.isEmpty()) {
                st.setString(1, sex);
            } else {
                st.setNull(1, java.sql.Types.CHAR);
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                AlumnoBean gc = new AlumnoBean();
                gc.setAlu_sexo(rs.getString("sexo"));
                gc.setCount(rs.getInt("count"));
                list.add(gc);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return list;
    }

}
