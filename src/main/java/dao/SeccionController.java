/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;





import java.sql.CallableStatement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Set;
import modelo.SeccionBean;
import util.MySQLConexion;

public class SeccionController extends MySQLConexion implements IControllerBase<SeccionBean> {
    
     @Override
    public SeccionBean SelectByCodigo(String codigo) {
        SeccionBean cBE = new SeccionBean();//NULA
        String call="{call prcSeccionSelectByCodigo(?)}";
        CallableStatement cstm=null;
        ResultSet res = null;
        try{
            cstm = getConexion().prepareCall(call);
            cstm.setString(1, codigo);
            res = cstm.executeQuery();            
            while(res.next()){
                
        cBE.setId_seccion(res.getString("id_seccion"));
        cBE.setSec_descri(res.getString("sec_descri")); 
        cBE.setSec_estcod(res.getInt("sec_estcod"));
        cBE.setId_aula(res.getString("id_aula")); 
        cBE.setId_nivel(res.getString("id_nivel")); 
       
            }
        }catch(Exception e){
        System.out.println(e.getMessage());
        
        }
        System.out.println("ERROR AL CONSULTAR");
        return cBE;
    }

    @Override
    public boolean Insert(SeccionBean input) {
//        String call="{call prcNivelInsert(?,?,?,?,?)}";
        //PreparedStatement pst = null;
        CallableStatement cstm=null;
        int res = 0 ;
        try{
            cstm = getConexion().prepareCall("{call prcSeccionInsert(?,?,?,?,?)}");
            
//            cstm.setString(1, input.getId_seccion());
            cstm.setString(1, input.getSec_descri());
            cstm.setInt(2, input.getSec_estcod());
            cstm.setString(3, input.getId_aula());
            cstm.setString(4, input.getId_nivel());
            
            res = cstm.executeUpdate();           
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }
        return res != 0;
    }

    @Override
    public ArrayList<SeccionBean> SelectAll() {
        
        ArrayList<SeccionBean> lista = new ArrayList<SeccionBean>();//NULA
        String call="{call prcSeccionSelectAll()}";
        CallableStatement cstm = null;
        ResultSet res = null;
        try{
            cstm = getConexion().prepareCall(call);
            cstm.execute();
            res=cstm.getResultSet();
            //res = cstm.executeQuery(SQL);
            //lista= new ArrayList<AulaBean>();//VACIA
            while(res.next()){
                SeccionBean cSeccion = new SeccionBean ();
                
                  cSeccion.setId_seccion(res.getString("id_seccion"));
       cSeccion.setSec_descri(res.getString("sec_descri"));
       cSeccion.setSec_estcod(res.getInt("sec_estcod"));
       cSeccion.setId_aula(res.getString("id_aula"));        
       cSeccion.setId_nivel(res.getString("id_nivel"));
       
                lista.add(cSeccion); //AGREGAMOS EL ITEM                
            }
        }catch(SQLException e){
            System.out.println("Error al consultar");
            System.out.println(e.getMessage());
        }
        return lista; 
    }

    @Override
    public boolean Update(SeccionBean input) {
         String call="{call prcSeccionUpdate(?,?,?,?,?)}";
         CallableStatement cstm=null;
            int ResultSet = 0 ;
        try{
            cstm = getConexion().prepareCall(call);
            
            cstm.setString(1, input.getId_seccion());
            cstm.setString(2, input.getSec_descri());
            cstm.setInt(3, input.getSec_estcod());
            cstm.setString(4, input.getId_aula());
            cstm.setString(5, input.getId_nivel());
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
        String call="{call prcSeccionDelete(?)}";
        try{
            cstm = getConexion().prepareCall(call);
            cstm.setString(1, codigo);
            ResultSet = cstm.executeUpdate();     
            
        }catch(SQLException e){
            System.out.println("Error al eliminar"+e.getMessage());}
        return ResultSet != 0;
    }
    
    public ArrayList<SeccionBean> obtenerSeccionesPorAula(String codc) {
        ArrayList<SeccionBean> secciones = new ArrayList<>();
        try {
            Connection conn = getConexion();
            CallableStatement cstmt = conn.prepareCall("{call spsecaulas(?, ?)}");
            cstmt.setString(1, "rango_inicio"); // Reemplazar por los valores correctos
            cstmt.setString(2, "rango_fin"); // Reemplazar por los valores correctos
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                SeccionBean secAula = new SeccionBean();
                secAula.setId_aula(rs.getString("id_aula"));
                secAula.setCantidad(rs.getInt("cantidad_secciones"));
                secciones.add(secAula);
            }
            rs.close();
            cstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return secciones;
    }

    @Override
    public int validar(SeccionBean input) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public static void main(String[] args) {
        SeccionController prueba1 = new SeccionController();
        prueba1.SelectAll();
        
    }
}
