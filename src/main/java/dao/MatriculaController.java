/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;


import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modelo.MatriculaBean;
import util.MySQLConexion;

/**
 *
 * @author U-07
 */
public class MatriculaController extends MySQLConexion implements IControllerBase<MatriculaBean> {

    @Override
    public MatriculaBean SelectByCodigo(String codigo) {
        MatriculaBean cBE = new MatriculaBean();//NULA
        String call = "{call prcMatriculaSelectByCodigo(?)}";
        CallableStatement cstm = null;
        ResultSet res = null;
        try {
            cstm = getConexion().prepareCall(call);
            cstm.setString(1, codigo);
            res = cstm.executeQuery();
            while (res.next()) {

                cBE.setId_matricula(res.getString("id_matricula"));
                cBE.setId_alumno(res.getString("id_alumno"));
                cBE.setId_seccion(res.getString("id_seccion"));
                cBE.setMatricula_fecha_ingreso(res.getString("matricula_fecha_ingreso"));
                cBE.setMatricula_estado(res.getInt("matricula_estado"));
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());

        }
        System.out.println("ERROR AL CONSULTAR");
        return cBE;
    }

    @Override
    public boolean Insert(MatriculaBean input) {
        
        CallableStatement cstm = null;
        int res = 0;
        try {
            cstm = getConexion().prepareCall("{call prcMatriculaInsert(?,?,?,?,?)}");
            cstm.setString(1, input.getId_alumno());
            cstm.setString(2, input.getId_seccion());
            cstm.setString(3, input.getMatricula_fecha_ingreso());
            cstm.setInt(4, input.getMatricula_estado());

            res = cstm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return res != 0;
    }

    @Override
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

    @Override
    public boolean Update(MatriculaBean input) {
        String call = "{call prcMatriculaUpdate(?,?,?,?,?)}";
        CallableStatement cstm = null;
        int ResultSet = 0;
        try {
            cstm = getConexion().prepareCall(call);

            cstm.setString(1, input.getId_matricula());
            cstm.setString(2, input.getId_alumno());
            cstm.setString(3, input.getId_seccion());
            cstm.setString(4, input.getMatricula_fecha_ingreso());
            cstm.setInt(5, input.getMatricula_estado());
            ResultSet = cstm.executeUpdate();
            System.out.println( input.toString());

        } catch (SQLException e) {
            System.out.println("Procedimiento no funcionable" + e.getMessage());
        }

        return ResultSet != 0;

    }

    @Override
    public boolean Delete(String codigo) {
        CallableStatement cstm = null;
        int ResultSet = 0;
        String call = "{call prcMatriculaDelete(?)}";
        try {
            cstm = getConexion().prepareCall(call);
            cstm.setString(1, codigo);
            ResultSet = cstm.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error al eliminar" + e.getMessage());
        }
        return ResultSet != 0;
    }

    @Override
    public int validar(MatriculaBean input) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
