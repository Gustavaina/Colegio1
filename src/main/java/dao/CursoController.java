/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import modelo.CursoBean;
import util.MySQLConexion;

/**
 *
 * @author moral
 */
public class CursoController extends  MySQLConexion implements IControllerBase<CursoBean> {

    @Override
    public CursoBean SelectByCodigo(String codigo) {
        CursoBean cBE = new CursoBean();
          String SQL="SELECT * FROM curso where id_cur =?";
        PreparedStatement pst=null;
        ResultSet res=null;
    
        try   {
        pst=getConexion().prepareStatement(SQL);
         pst.setString(1, codigo);
            res=pst.executeQuery();
            while(res.next()){  
            
            cBE.setId_cur(res.getInt("id_cur"));
            cBE.setCur_descri(res.getString("cur_descri"));
            cBE.setCur_estcod(res.getInt("cur_estcod"));
            }
        }catch(Exception e)   {
        System.out.println(e.getMessage());
        }
        System.out.println("ERROR AL CONSULTAR");
         return   cBE;
    }

    @Override
    public boolean Insert(CursoBean input) {
        String SQL="Insert into curso(cur_descri, cur_estcod) values( ?,?)";
        PreparedStatement pst = null;
         int res=0;
         try       {
             
         pst=getConexion().prepareStatement(SQL);
          pst.setString(1, input.getCur_descri());
         pst.setInt(2,  input.getCur_estcod());
        res=pst.executeUpdate();
         }catch(SQLException e)   {
         System.out.println(e.getMessage());
         }
           return res != 0;
    }

    @Override
    public ArrayList<CursoBean> SelectAll() {
        ArrayList<CursoBean> lista = null;
        String SQL="select * from curso";
           Statement stm = null;
        ResultSet res = null;
        try {
          stm = getConexion().createStatement();
           res = stm.executeQuery(SQL);
           lista= new ArrayList<CursoBean>();//VACIA
           while(res.next())   {
                       CursoBean cCurso = new CursoBean();

             cCurso.setId_cur(res.getInt("id_cur"));
           cCurso.setCur_descri(res.getString("cur_descri"));
            cCurso.setCur_estcod(res.getInt("cur_estcod"));
            lista.add(cCurso); //AGREGAMOS EL ITEM 
            
           }
        } catch(SQLException e)
        {
            System.out.println(""+e.getMessage());
        }      
        
        return lista;
              

    }

    @Override
    public boolean Update(CursoBean input) {
        String SQL="UPDATE  curso SET cur_descri =?, cur_estcod=?  WHERE id_cur=?";
           PreparedStatement pst = null;
           int res=0;
           
           try   {
            pst=getConexion().prepareStatement(SQL);
          pst.setString(1, input.getCur_descri());
         pst.setInt(2,  input.getCur_estcod());
         pst.setInt(3,input.getId_cur());
           res=pst.executeUpdate();
           }catch(SQLException e)  {
           System.out.println(e.getMessage());
           }
               return res != 0;
    }

    @Override
    public boolean Delete(String codigo) {
        String SQL="DELETE FROM curso where id_cur=?";
        PreparedStatement pst = null;
        int res = 0 ;
        try    {
       pst=getConexion().prepareStatement(SQL);
       pst.setString(1, codigo);
       res=pst.executeUpdate();
        }catch(SQLException e)  {
            System.out.println(""+e.getMessage());
        }
        return res!=0;
    }
    public static void main(String[] args) {
        CursoController prueba1 = new CursoController();
        prueba1.SelectByCodigo("1");
    }

    @Override
    public int validar(CursoBean input) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    
}
