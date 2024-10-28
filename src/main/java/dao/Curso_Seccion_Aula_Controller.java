/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;


import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import modelo.Curso_Seccion_Aula_Bean;
import util.MySQLConexion;

/**
 *
 * @author moral
 */
public class Curso_Seccion_Aula_Controller extends MySQLConexion implements IControllerBase<Curso_Seccion_Aula_Bean> {

    @Override
    public Curso_Seccion_Aula_Bean SelectByCodigo(String codigo) {
       Curso_Seccion_Aula_Bean csBE = new Curso_Seccion_Aula_Bean();
          String call="{call prcCurso_x_seccionSelectByCodigo(?)}";
          //call prcCursoSelectBycodigo("CUR-000001");
        CallableStatement cstm=null;
        ResultSet res=null;
    
        try   {
        cstm=getConexion().prepareCall(call);
        cstm.setString(1, codigo);
            res=cstm.executeQuery();
            while(res.next()){  
            csBE.setCur_codigo(res.getString("cur_codigo"));
            csBE.setId_seccion(res.getString("id_seccion"));
            csBE.setId_aula(res.getString("id_aula"));
            csBE.setId_docente(res.getString("id_docente"));
            csBE.setEstado(res.getInt("estado"));
          
        
            }
        }catch(Exception e)   {
        System.out.println(e.getMessage());
        }
        System.out.println("ERROR AL CONSULTAR");
         return   csBE;
    }

    @Override
    public boolean Insert(Curso_Seccion_Aula_Bean input) {
       CallableStatement cstm=null;
        int res = 0 ;
        try{
            cstm = getConexion().prepareCall("{call prcCurso_x_seccion_Insert(?,?,?,?,?)}");
            
            
           
           cstm.setString(1,input.getCur_codigo()); 
           cstm.setString(2,input.getId_seccion());
               cstm.setString(3,input.getId_aula());
             cstm.setString(4,input.getId_docente());
            cstm.setInt(5,input.getEstado());
       
            res = cstm.executeUpdate();           
        }catch(SQLException e){
            System.out.println(e.getMessage());}
        return res != 0;
    }

    @Override
    public ArrayList<Curso_Seccion_Aula_Bean> SelectAll() {
       
        ArrayList<Curso_Seccion_Aula_Bean> lista = new ArrayList<Curso_Seccion_Aula_Bean>();//NULA
        String call="{call prcCurso_x_seccionSelectAll()}";
        CallableStatement cstm = null;
        ResultSet res = null;
        try{
            cstm = getConexion().prepareCall(call);
            cstm.execute();
            res=cstm.getResultSet();
            
            while(res.next()){
               Curso_Seccion_Aula_Bean CursoSeccion = new Curso_Seccion_Aula_Bean();
      
                
                CursoSeccion.setCur_codigo(res.getString("cur_codigo"));
            CursoSeccion.setId_seccion(res.getString("id_seccion"));
           CursoSeccion.setId_aula(res.getString("id_aula"));
            CursoSeccion.setId_docente(res.getString("id_docente"));
            CursoSeccion.setEstado(res.getInt("estado"));
                
                lista.add(CursoSeccion);              
            }
        }catch(SQLException e){
            System.out.println(e.getMessage());}
        return lista; 
    }



    @Override
    public boolean Update(Curso_Seccion_Aula_Bean input) {
     String call="{call prcCurso_x_seccionUpdate(?,?,?,?,?)}";
         
        CallableStatement cstm=null;
        int ResultSet = 0 ;
        try{
            cstm = getConexion().prepareCall(call);
            
            cstm.setString(1, input.getCur_codigo());
            cstm.setString(2, input.getId_seccion());
            cstm.setString(3,input.getId_aula());
            cstm.setString(4, input.getId_docente());
            cstm.setInt(5, input.getEstado());
           
     
            ResultSet = cstm.executeUpdate();           
        }catch(SQLException e){
            System.out.println("Procedimiento no funcionable"+e.getMessage());}
       
        return ResultSet != 0;
    }

    @Override
    public boolean Delete(String codigo) {
            CallableStatement cstm=null;       
        int ResultSet = 0 ;
        String call="{call prcCurso_x_seccionDelete(?)}";
        try{
            cstm = getConexion().prepareCall(call);
            
            cstm.setString(1, codigo);
            ResultSet = cstm.executeUpdate();
            
        }catch(SQLException e){System.out.println("Error al eliminar"+e.getMessage());}
        return ResultSet != 0;
    }

    @Override
    public int validar(Curso_Seccion_Aula_Bean input) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public ArrayList<Curso_Seccion_Aula_Bean>  SelectAllAll()   {
        
        
         ArrayList<Curso_Seccion_Aula_Bean> lista = new ArrayList<Curso_Seccion_Aula_Bean>();//NULA
        String call="{call prcSelectCursoSeccionDocenteAula_all()}";
        CallableStatement cstm = null;
        ResultSet res = null;
        try{
            cstm = getConexion().prepareCall(call);
            cstm.execute();
            res=cstm.getResultSet();
            
            while(res.next()){
                Curso_Seccion_Aula_Bean CursoSeccion = new Curso_Seccion_Aula_Bean ();
               
                CursoSeccion.setCur_codigo(res.getString("cur_codigo"));
                CursoSeccion.setNombre_curso(res.getString("nombre_curso"));
            CursoSeccion.setSec_descri(res.getString("sec_descri"));
            CursoSeccion.setAul_descri(res.getString("aul_descri"));
           CursoSeccion.setDoc_nombre(res.getString("doc_nombre"));
            CursoSeccion.setId_nivel(res.getString("id_nivel"));
            
            CursoSeccion.setEstado(res.getInt("estado"));
                lista.add(CursoSeccion);              
            }
        }catch(SQLException e){
            System.out.println("Error en la consulta");
            System.out.println(e.getMessage());}
        return lista; 
        
    
        
    }
    
    public static void main(String[] args) {
        Curso_Seccion_Aula_Controller prueba1 = new Curso_Seccion_Aula_Controller();
       // prueba1.SelectAllAll();
         prueba1.SelectAll();
       
        ArrayList<Curso_Seccion_Aula_Bean> ldata = prueba1.SelectAllAll();
       
            
           Curso_Seccion_Aula_Bean item = null;
                               Iterator<Curso_Seccion_Aula_Bean> iter = ldata.iterator();

                            //    while (iter.hasNext()) {
                            //        item = iter.next();
                           //         System.out.println(""+item.getEstado());
                        // System.out.println(""+item.getCur_codigo());
                        //        }
                                
                                prueba1.Insert(item);
                                
        
    }
  
    
}
