/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;



import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import modelo.NivelBean;
import util.MySQLConexion;

public class NivelController extends MySQLConexion implements IControllerBase<NivelBean> {
    
     @Override
    public NivelBean SelectByCodigo(String codigo) {
         NivelBean cBE = new NivelBean();//NULA
        String call="{call prcNivelSelectByCodigo(?)}";
        CallableStatement cstm=null;
        ResultSet res = null;
        try{
            cstm = getConexion().prepareCall(call);
            cstm.setString(1, codigo);
            res = cstm.executeQuery();            
            while(res.next()){
                
        cBE.setId_nivel(res.getString("id_nivel"));
        cBE.setNiv_descri(res.getString("niv_descri")); 
        cBE.setNiv_estcod(res.getInt("niv_estcod")); 
       
            }
        }catch(Exception e){
        System.out.println(e.getMessage());
        
        }
        System.out.println("ERROR AL CONSULTAR");
        return cBE;
    }

    @Override
    public boolean Insert(NivelBean input) {
     
        //PreparedStatement pst = null;
        CallableStatement cstm=null;
        int res = 0 ;
        try{
            cstm = getConexion().prepareCall("{call prcNivelInsert(?,?,?)}");
            
            cstm.setString(1, input.getNiv_descri());
            cstm.setInt(2, input.getNiv_estcod());
            
            res = cstm.executeUpdate();           
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }
        return res != 0;
    }

    @Override
    public ArrayList<NivelBean> SelectAll() {
        
        ArrayList<NivelBean> lista = new ArrayList<NivelBean>();//NULA
        String call="{call prcNivelSelectAll()}";
        CallableStatement cstm = null;
        ResultSet res = null;
        try{
            cstm = getConexion().prepareCall(call);
            cstm.execute();
            res=cstm.getResultSet();
            //res = cstm.executeQuery(SQL);
            //lista= new ArrayList<AulaBean>();//VACIA
            while(res.next()){
                NivelBean cNivel = new NivelBean ();
                
                  cNivel.setId_nivel(res.getString("id_nivel"));
     cNivel.setNiv_descri(res.getString("niv_descri"));
       cNivel.setNiv_estcod(res.getInt("niv_estcod"));
                lista.add(cNivel); //AGREGAMOS EL ITEM                
            }
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }
        return lista; 
    }

    @Override
    public boolean Update(NivelBean input) {
         String call="{call prcNivelUpdate(?,?,?)}";
         CallableStatement cstm=null;
            int ResultSet = 0 ;
        try{
            cstm = getConexion().prepareCall(call);
            
            cstm.setString(1, input.getId_nivel());
            cstm.setString(2, input.getNiv_descri());
            cstm.setInt(3, input.getNiv_estcod());
            ResultSet = cstm.executeUpdate(); 
            
        }catch(SQLException e){
            System.out.println("Procedimiento no funcionable"+e.getMessage());
        }
       
        return ResultSet != 0;
     
    }

    @Override
    public boolean Delete(String codigo) {
        CallableStatement cstm=null;
        int ResultSet = 0 ;
        String call="{call prcNivelDelete(?)}";
        try{
            cstm = getConexion().prepareCall(call);
            cstm.setString(1, codigo);
            ResultSet = cstm.executeUpdate();     
            
        }catch(SQLException e){
            System.out.println("Error al eliminar"+e.getMessage());}
        return ResultSet != 0;
    }

    @Override
    public int validar(NivelBean input) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    
}