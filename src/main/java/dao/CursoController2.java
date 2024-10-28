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
import modelo.CursoBean;
import modelo.CursoBean2;
import util.MySQLConexion;

/**
 *
 * @author U-07
 */
public class CursoController2  extends MySQLConexion implements IControllerBase<CursoBean2> {

    @Override
    public CursoBean2 SelectByCodigo(String codigo) {
        CursoBean2 cBE = new CursoBean2();
          String call="{call prcCursoSelectByCodigo(?)}";
          //call prcCursoSelectBycodigo("CUR-000001");
        CallableStatement cstm=null;
        ResultSet res=null;
    
        try   {
        cstm=getConexion().prepareCall(call);
        cstm.setString(1, codigo);
            res=cstm.executeQuery();
            while(res.next()){  
            
            cBE.setId_curso(res.getString("id_curso"));
            cBE.setNombre_curso(res.getString("nombre_curso"));
            cBE.setDescripcion_curso(res.getString("descripcion_curso"));
             cBE.setEstado_curso(res.getInt("estado_curso"));
            }
        }catch(Exception e)   {
        System.out.println(e.getMessage());
        }
        System.out.println("ERROR AL CONSULTAR");
         return   cBE;
    }

    @Override
    public boolean Insert(CursoBean2 input) {
         String call="{call prcCursoInsert(?,?,?,?)}";
        //PreparedStatement pst = null;
        CallableStatement cstm=null;
         int res=0;
         try       {
             
         cstm=getConexion().prepareCall(call);
           cstm.setString(1,input.getNombre_curso());
           cstm.setString(2,input.getDescripcion_curso());
            cstm.setInt(3,  input.getEstado_curso());
          //cstm.setString(4,"@out_id" );
          
        res=cstm.executeUpdate();
         }catch(SQLException e)   {
         System.out.println(e.getMessage());
         }
           return res != 0;
    }

    @Override
    public ArrayList<CursoBean2> SelectAll() {
        
        
           ArrayList<CursoBean2> lista =  new ArrayList<CursoBean2>();
        String call="{call prcCursoSelectAll()}";
           CallableStatement cstm = null;
        ResultSet res = null;
        try {
            
          cstm = getConexion().prepareCall(call);
        
         //  res = stm.executeQuery(SQL);
         cstm.execute();
           res=cstm.getResultSet();
          // lista= new ArrayList<CursoBean2>();//VACIA
           while(res.next())   {
                       CursoBean2 cCurso = new CursoBean2();

             cCurso.setId_curso(res.getString("id_curso"));
            cCurso.setNombre_curso(res.getString("nombre_curso"));
            cCurso.setDescripcion_curso(res.getString("descripcion_curso"));
             cCurso.setEstado_curso(res.getInt("estado_curso"));
            lista.add(cCurso); //AGREGAMOS EL ITEM 
            
           }
        } catch(SQLException e)
        {
            System.out.println(""+e.getMessage());
        }      
        return lista;
    }

    @Override
    public boolean Update(CursoBean2 input) {
        String call="{call prcCursoUpdate(?,?,?,?)}";
        CallableStatement cstm=null;
       int  ResultSet =0;
       try {
           cstm=getConexion().prepareCall(call);
          
           cstm.setString(1, input.getId_curso());
           cstm.setString(2, input.getNombre_curso());
           cstm.setString(3, input.getDescripcion_curso());
           cstm.setInt(4, input.getEstado_curso());
            ResultSet=cstm.executeUpdate();
       
       }catch(SQLException e)  {
           System.out.println("Procedimiento no funcionable"+e.getMessage());
       }
         return ResultSet !=0;
    }

    @Override
    public boolean Delete(String codigo) {
       CallableStatement cstm=null;
       int ResultSet =0;
       
        String call="{call prcCursoDelete(?)}";
        try  {
            cstm=getConexion().prepareCall(call);
            cstm.setString(1,codigo);
           ResultSet=cstm.executeUpdate();
           
        
        }catch(SQLException e){
            System.out.println("Error al eliminar"+e.getMessage());
        }  
        
        return ResultSet !=0;
    }
    
     public ArrayList<CursoBean2> getCursosPorMatricula(String matriculaId) {
        ArrayList<CursoBean2> cursos = new ArrayList<>();
        String call = "{CALL prcCursosPorMatricula(?)}";
        try (CallableStatement cstm = getConexion().prepareCall(call)) {
            cstm.setString(1, matriculaId);
            try (ResultSet rs = cstm.executeQuery()) {
                while (rs.next()) {
                    CursoBean2 curso = new CursoBean2();
                    // Aquí asigna los valores del ResultSet al objeto CursoBean según la estructura de tu tabla
                    curso.setId_curso(rs.getString("id_curso"));
                    curso.setNombre_curso(rs.getString("nombre_curso"));
                    // Agrega otros campos si es necesario
                    cursos.add(curso);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener cursos por matrícula: " + e.getMessage());
        }
        return cursos;
    }

    @Override
    public int validar(CursoBean2 input) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    
    public String ver_usuarios(CursoBean2 input)  {
    
    
        return null;
    
    
    }

}
