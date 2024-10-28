/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;


import java.util.ArrayList;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import modelo.UsuarioBean;
import util.MySQLConexion;
/**
 *
 * @author U-07
 */
public class UsuarioController extends MySQLConexion implements IControllerBase<UsuarioBean> {

    @Override
    public UsuarioBean SelectByCodigo(String codigo) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean Insert(UsuarioBean input) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<UsuarioBean> SelectAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean Update(UsuarioBean input) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean Delete(String codigo) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int validar(UsuarioBean input) {
       String call="{call prcUsuarioValidar(?,?)}";
       CallableStatement cstm= null;
       int contador=0; 
       ResultSet rs; // llamar al conjunto de resultados.
       try{
       cstm=getConexion().prepareCall(call);
       cstm.setString(1, input.getCodigo_usuario());
       cstm.setString(2, input.getContrasena_usuario());
       rs=cstm.executeQuery();
       while(rs.next())  {
       contador++;
       input.setId_usuario(rs.getString("id_usuario"));
       input.setTipo_usuario(rs.getString("tipo_usuario"));
       input.setEstado(rs.getInt("estado"));
       }
           if (contador==1) {
                return 1;
           }else  {
           return 0;
           }
       
       }catch(SQLException e )  {
        return 0;
       
       }
       
       
    }
 
     
  
    
}
