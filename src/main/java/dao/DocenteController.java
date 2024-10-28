/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;


import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import modelo.DocenteBean;
import util.MySQLConexion;


public class DocenteController extends MySQLConexion implements IControllerBase<DocenteBean> {

    @Override
    public DocenteBean SelectByCodigo(String codigo) {
         DocenteBean aBE = new DocenteBean();
        String call="{call prcDocenteSelectByCodigo(?)}";
        CallableStatement cstm=null;
        ResultSet res = null;
        try{
            cstm = getConexion().prepareCall(call);
            cstm.setString(1, codigo);
            res = cstm.executeQuery();            
            while(res.next()){
                
         aBE.setId_docente(res.getString("id_docente"));
         aBE.setDoc_descri(res.getString("doc_descri"));
         aBE.setDoc_estcod(res.getInt("doc_estcod"));
         aBE.setDoc_nombre(res.getString("doc_nombre"));
         aBE.setDoc_apellido(res.getString("doc_apellido"));
         aBE.setDoc_dni(res.getInt("doc_dni"));   
         aBE.setDoc_telefono(res.getInt("doc_telefono"));
            }
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }
        System.out.println("ERROR AL CONSULTAR");
        return aBE;
    }

    @Override
    public boolean Insert(DocenteBean input) {
        
        CallableStatement cstm=null;
        int res = 0 ;
        try{
            
            cstm = getConexion().prepareCall("{call prcDocenteInsert(?,?,?,?,?,?,?)}");
            
            
            cstm.setString(1, input.getDoc_descri());
            cstm.setInt(2, input.getDoc_estcod());
            cstm.setString(3, input.getDoc_nombre());
            cstm.setString(4, input.getDoc_apellido());
            cstm.setInt(5, input.getDoc_dni());
            cstm.setInt(6, input.getDoc_telefono());
            
            res = cstm.executeUpdate();           
        }catch(SQLException e){
            System.out.println(e.getMessage());}
        return res != 0;
    }

    @Override
    public ArrayList<DocenteBean> SelectAll() {
        
        ArrayList<DocenteBean> lista = new ArrayList<DocenteBean>();//NULA
        String call="{call prcDocenteSelectAll()}";
        CallableStatement cstm = null;
        ResultSet res = null;
        try{
            cstm = getConexion().prepareCall(call);
            cstm.execute();
            res=cstm.getResultSet();
            
            while(res.next()){
                DocenteBean aDocente = new DocenteBean ();
      
                
                  aDocente.setId_docente(res.getString("id_docente"));
                  aDocente.setDoc_descri(res.getString("doc_descri"));
                  aDocente.setDoc_estcod(res.getInt("doc_estcod"));
                  aDocente.setDoc_nombre(res.getString("doc_nombre"));
                  aDocente.setDoc_apellido(res.getString("doc_apellido")); 
                  aDocente.setDoc_dni(res.getInt("doc_dni")); 
                  aDocente.setDoc_telefono(res.getInt("doc_telefono"));
                
                lista.add(aDocente);              
            }
        }catch(SQLException e){
            System.out.println(e.getMessage());}
        return lista; 
    }

    @Override
    public boolean Update(DocenteBean input) {
        
         String call="{call prcDocenteUpdate(?,?,?,?,?,?,?)}";
         
        CallableStatement cstm=null;
        int ResultSet = 0 ;
        try{
            cstm = getConexion().prepareCall(call);
            
            cstm.setString(1, input.getId_docente());
            cstm.setString(2, input.getDoc_descri());
            cstm.setInt(3, input.getDoc_estcod());
            cstm.setString(4, input.getDoc_nombre());
            cstm.setString(5, input.getDoc_apellido());
            cstm.setInt(6, input.getDoc_dni());
            cstm.setInt(7, input.getDoc_telefono());
           
            ResultSet = cstm.executeUpdate();           
        }catch(SQLException e){
            System.out.println("Procedimiento no funcionable"+e.getMessage());}
       
        return ResultSet != 0;
     
    }

    @Override
    public boolean Delete(String codigo) {
        
        CallableStatement cstm=null;       
        int ResultSet = 0 ;
        String call="{call prcDocenteDelete(?)}";
        try{
            cstm = getConexion().prepareCall(call);
            
            cstm.setString(1, codigo);
            ResultSet = cstm.executeUpdate();
            
        }catch(SQLException e){System.out.println("Error al eliminar"+e.getMessage());}
        return ResultSet != 0;
    }
//    public static void main(String[] args) {
//       DocenteController prueba1 = new      DocenteController ();
//       
//    }

    @Override
    public int validar(DocenteBean input) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
