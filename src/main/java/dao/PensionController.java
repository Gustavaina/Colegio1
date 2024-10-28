/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;


import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modelo.PensionBean;
import util.MySQLConexion;

/**
 *
 * @author U-07
 */
public class PensionController extends MySQLConexion implements IControllerBase<PensionBean> {

    @Override
    public PensionBean SelectByCodigo(String codigo) {
        PensionBean cBE = new PensionBean();//NULA
        String call = "{call prcPensionSelectByCodigo(?)}";
        CallableStatement cstm = null;
        ResultSet res = null;
        try {
            cstm = getConexion().prepareCall(call);
            cstm.setString(1, codigo);
            res = cstm.executeQuery();
            while (res.next()) {

                cBE.setId_pension(res.getString("id_pension"));
                cBE.setId_matricula(res.getString("id_matricula"));
                cBE.setId_alumno(res.getString("id_alumno"));
                cBE.setPension_mes(res.getString("pen_mescod"));
                cBE.setPension_monto(res.getDouble("pension_monto"));
                cBE.setPension_descuento(res.getDouble("pension_descuento"));
                cBE.setPension_mora(res.getDouble("pension_mora"));
                cBE.setPension_fecha_registro(res.getString("pension_fecha_registro"));
                cBE.setPension_fecha_vencimiento(res.getString("pension_fecha_vencimiento"));
                cBE.setPension_estado(res.getInt("pension_fecha_vencimiento"));
  
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());

        }
        System.out.println("ERROR AL CONSULTAR");
        return cBE;
    }

    @Override
    public boolean Insert(PensionBean input) {

        CallableStatement cstm = null;
        int res = 0;
        try {
            cstm = getConexion().prepareCall("{call prcPensionInsert(?,?,?,?,?,?,?,?,?)}");

            cstm.setString(1, input.getId_matricula());
            cstm.setString(2, input.getId_alumno());
            cstm.setString(3, input.getPension_mes());
            cstm.setDouble(4, input.getPension_monto());
            cstm.setDouble(5, input.getPension_descuento());
            cstm.setDouble(6, input.getPension_mora());
            cstm.setString(7, input.getPension_fecha_registro());
            cstm.setString(8, input.getPension_fecha_vencimiento());
            cstm.setInt(9, input.getPension_estado());
            

            res = cstm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return res != 0;
    }

    @Override
    public ArrayList<PensionBean> SelectAll() {
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

    @Override
    public boolean Update(PensionBean input) {
        String call = "{call prcPensionUpdate(?,?,?,?,?,?,?,?,?,?)}";
        CallableStatement cstm = null;
        int ResultSet = 0;
        try {
            cstm = getConexion().prepareCall(call);

            cstm.setString(1, input.getId_pension());
            cstm.setString(2, input.getId_matricula());
            cstm.setString(3, input.getId_alumno());
            cstm.setString(4, input.getPension_mes());
            cstm.setDouble(5, input.getPension_monto());
            cstm.setDouble(6, input.getPension_descuento());
            cstm.setDouble(7, input.getPension_mora());
            cstm.setString(8, input.getPension_fecha_registro());
            cstm.setString(9, input.getPension_fecha_vencimiento());
            cstm.setInt(10, input.getPension_estado());
            
            
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
        String call = "{call prcPensionDelete(?)}";
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
    public int validar(PensionBean input) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
