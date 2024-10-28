/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modelo.AulaBean;
import util.MySQLConexion;

public class AulaController extends MySQLConexion implements IControllerBase<AulaBean> {
    
     @Override
    public AulaBean SelectByCodigo(String codigo) {
         AulaBean cBE = new AulaBean();//NULA
        String call="{call prcAulaSelectByCodigo(?)}";
        CallableStatement cstm=null;
        ResultSet res = null;
        try{
            cstm = getConexion().prepareCall(call);
            cstm.setString(1, codigo);
            res = cstm.executeQuery();            
            while(res.next()){
                
        cBE.setId_aula(res.getString("id_aula"));
        cBE.setAul_descri(res.getString("aul_descri")); 
        cBE.setAul_estcod(res.getInt("aul_estcod")); 
       
            }
        }catch(SQLException e){
        System.out.println(e.getMessage());
        
        }
        System.out.println("ERROR AL CONSULTAR");
        return cBE;
    }

    @Override
    public boolean Insert(AulaBean input) {
//        String call="{call prcAulaInsert(?,?,?,?)}";
        //PreparedStatement pst = null;
        CallableStatement cstm=null;
        int res = 0 ;
        try{
            cstm = getConexion().prepareCall("{call prcAulaInsert(?,?,?)}");
            
            //cstm.setString(1, input.getId_aula());
            cstm.setString(1, input.getAul_descri());
            cstm.setInt(2, input.getAul_estcod());
            
            res = cstm.executeUpdate();           
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }
        return res != 0;
    }

    @Override
    public ArrayList<AulaBean> SelectAll() {
        
        ArrayList<AulaBean> lista = new ArrayList<AulaBean>();//NULA
        String call="{call prcAulaSelectAll()}";
        CallableStatement cstm = null;
        ResultSet res = null;
        try{
            cstm = getConexion().prepareCall(call);
            cstm.execute();
            res=cstm.getResultSet();
            //res = cstm.executeQuery(SQL);
            //lista= new ArrayList<AulaBean>();//VACIA
            while(res.next()){
                AulaBean cAula = new AulaBean ();
                
                  cAula.setId_aula(res.getString("id_aula"));
     cAula.setAul_descri(res.getString("aul_descri"));
       cAula.setAul_estcod(res.getInt("aul_estcod"));
                lista.add(cAula); //AGREGAMOS EL ITEM                
            }
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }
        return lista; 
    }

    @Override
    public boolean Update(AulaBean input) {
         String call="{call prcAulaUpdate(?,?,?)}";
         CallableStatement cstm=null;
            int ResultSet = 0 ;
        try{
            cstm = getConexion().prepareCall(call);
            
            cstm.setString(1, input.getId_aula());
            cstm.setString(2, input.getAul_descri());
            cstm.setInt(3, input.getAul_estcod());
            
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
        String call="{call prcAulaDelete(?)}";
        try{
            cstm = getConexion().prepareCall(call);
            cstm.setString(1, codigo);
            ResultSet = cstm.executeUpdate();     
            
        }catch(SQLException e){
            System.out.println("Error al eliminar"+e.getMessage());}
        return ResultSet != 0;
    }

    @Override
    public int validar(AulaBean input) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    
    
}
