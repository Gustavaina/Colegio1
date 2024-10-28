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
import modelo.AlumnoBean;
import util.MySQLConexion;

/**
 *
 * // aplicando cambios
 * @author moral
 */
public class AlumnoController extends MySQLConexion implements IControllerBase<AlumnoBean> {
    
    

    @Override
    public AlumnoBean SelectByCodigo(String codigo) {
         AlumnoBean aBE = new AlumnoBean();//NULA
     String call="{call prcAlumnoSelectByCodigo(?)}";
          //call prcCursoSelectBycodigo("CUR-000001");
        CallableStatement cstm=null;
        ResultSet res=null;
        try{
           cstm=getConexion().prepareCall(call);
            cstm.setString(1, codigo);
            res = cstm.executeQuery();            
            while(res.next()){
                
         aBE.setAlu_id(res.getString("id_alumno"));
      aBE.setAlu_nombres(res.getString("alu_nombres"));
       aBE.setAlu_apellidos(res.getString("alu_apellidos"));
       aBE.setAlu_dni(res.getString("alu_dni"));
       aBE.setAlu_sexo(res.getString("alu_sexo"));
      aBE.setAlu_telefono(res.getString("alu_telefono"));
      aBE.setAlu_direccion(res.getString("alu_direccion"));                         
            }
        }catch(SQLException e){System.out.println(e.getMessage());}
       
        return aBE;
    }

    @Override
    public boolean Insert(AlumnoBean input) {
        String call="{call prcAlumnoinsert(?,?,?,?,?,?,?)}";
        //PreparedStatement pst = null;
        CallableStatement cstm=null;
         int res=0;
         try       {
         cstm=getConexion().prepareCall(call);
            cstm.setString(1, input.getAlu_nombres());
            cstm.setString(2, input.getAlu_apellidos());
            cstm.setString(3, input.getAlu_dni());
           cstm.setString(4, input.getAlu_telefono());
           cstm.setString(5, input.getAlu_sexo());
           cstm.setString(6, input.getAlu_direccion());
          
        res=cstm.executeUpdate();
         }catch(SQLException e)   {
         System.out.println(e.getMessage());
         }
           return res != 0;
    }

    @Override
    public ArrayList<AlumnoBean> SelectAll() {
        ArrayList<AlumnoBean> lista = null;//NULA
        String SQL="SELECT * FROM alumno";
        Statement stm = null;
        ResultSet res = null;
        try{
            stm = getConexion().createStatement();
            res = stm.executeQuery(SQL);
            lista= new ArrayList<AlumnoBean>();//VACIA
            while(res.next()){
                AlumnoBean aAlumno = new AlumnoBean ();
                  aAlumno.setAlu_id(res.getString("id_alumno"));
     aAlumno.setAlu_nombres(res.getString("alu_nombres"));
       aAlumno.setAlu_apellidos(res.getString("alu_apellidos"));
      aAlumno.setAlu_dni(res.getString("alu_dni"));
      aAlumno.setAlu_telefono(res.getString("alu_telefono"));
      aAlumno.setAlu_sexo(res.getString("alu_sexo"));
      aAlumno.setAlu_direccion(res.getString("alu_direccion")); 
                
                lista.add(aAlumno); //AGREGAMOS EL ITEM                
            }
        }catch(SQLException e){System.out.println(e.getMessage());}
        return lista; 
    }

    @Override
    public boolean Update(AlumnoBean input) {
         System.out.println("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz ");
 String call="{call prcAlumnoUpdate(?,?,?,?,?,?,?)}";         
          CallableStatement cstm=null;
        int res = 0 ;
        try{
             cstm=getConexion().prepareCall(call);
            cstm.setString(1, input.getAlu_id());
           cstm.setString(2, input.getAlu_nombres());
            cstm.setString(3, input.getAlu_apellidos());
           cstm.setString(4, input.getAlu_dni());
           cstm.setString(5, input.getAlu_telefono());
           cstm.setString(6, input.getAlu_sexo());
           cstm.setString(7, input.getAlu_direccion());
         
            res = cstm.executeUpdate();           
        }catch(SQLException e){System.out.println(e.getMessage());}
        
        return res != 0;
     
    }

    @Override
    public boolean Delete(String codigo) {
         String call="{call prcAlumnoDelete(?)}";
      CallableStatement cstm=null;
        int res = 0 ;
        try{
            cstm=getConexion().prepareCall(call);
            cstm.setString(1, codigo);
            res = cstm.executeUpdate();           
        }catch(SQLException e){System.out.println(e.getMessage());}
        return res != 0;
    }
    public static void main(String[] args) {
        AlumnoController prueba1 = new      AlumnoController ();
        prueba1.SelectByCodigo("1");
   }

    @Override
    public int validar( AlumnoBean input) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
