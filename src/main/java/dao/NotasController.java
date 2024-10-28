/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;


import java.sql.ResultSet;
import java.sql.SQLException;

import java.sql.CallableStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import modelo.NotasBean;
import util.MySQLConexion;

public class NotasController extends MySQLConexion implements IControllerBase<NotasBean> {

    @Override
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

    @Override
    public boolean Insert(NotasBean input) {
        
        CallableStatement cstm = null;
        int res = 0;
        try {
            cstm = getConexion().prepareCall("{call prcNotasInsert(?,?,?,?,?)}");

            
            cstm.setString(1, input.getId_matricula());
            cstm.setString(2, input.getId_curso());
            cstm.setString(3, input.getNot_observ());
            cstm.setDouble(4, input.getNot_valor());
            cstm.setInt(5, input.getNot_estcod());

            res = cstm.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return res != 0;
    }

    @Override
    public ArrayList<NotasBean> SelectAll() {
      
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

    @Override
    public boolean Update(NotasBean input) {
        String call = "{call prcNotasUpdate(?,?,?,?,?,?)}";
        CallableStatement cstm = null;
        int ResultSet = 0;
        try {
            cstm = getConexion().prepareCall(call);

            cstm.setString(1, input.getId_notas());
            cstm.setString(2, input.getId_matricula());
            cstm.setString(3, input.getId_curso());
            cstm.setString(4, input.getNot_observ());
            cstm.setDouble(5, input.getNot_valor());
            cstm.setInt(6, input.getNot_estcod());

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
        String call = "{call prcNotasDelete(?)}";
        try {
            cstm = getConexion().prepareCall(call);
            cstm.setString(1, codigo);
            ResultSet = cstm.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error al eliminar" + e.getMessage());
        }
        return ResultSet != 0;
    }
    
   public ArrayList<NotasBean> SelectByMatricula(String id_matricula) {
    ArrayList<NotasBean> notasPorMatricula = new ArrayList<>();
    try {
        // Lógica para obtener las notas por matrícula, puede ser mediante un procedimiento almacenado o una consulta directa
        String call = "{call prcNotasSelectByMatricula(?)}";
        CallableStatement cstm = getConexion().prepareCall(call);
        cstm.setString(1, id_matricula);
        ResultSet res = cstm.executeQuery();
        while (res.next()) {
            NotasBean nota = new NotasBean();
            // Establecer los atributos de la nota
            nota.setId_notas(res.getString("id_notas"));
            nota.setId_matricula(res.getString("id_matricula"));
            nota.setId_curso(res.getString("id_curso"));
            nota.setNot_observ(res.getString("not_observ"));
            nota.setNot_valor(res.getDouble("not_valor"));
            nota.setNot_estcod(res.getInt("not_estcod"));
            // Agregar la nota a la lista
            notasPorMatricula.add(nota);
        }
    } catch (SQLException e) {
        System.out.println(e.getMessage());
    }
    return notasPorMatricula;
}

    @Override
    public int validar(NotasBean input) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
