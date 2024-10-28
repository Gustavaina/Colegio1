/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;


import dao.UsuarioController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.UsuarioBean;


/**
 *
 * @author U-07
 */
public class Controlador extends HttpServlet {
UsuarioBean uBE = new UsuarioBean();
UsuarioController  uCO= new UsuarioController();

int r;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException {
        String accion=request.getParameter("accion");
        try  {
        if (accion!=null) {
                switch(accion){
                    case "validarusuario":
                        validarusuario(request,response);
                        break;
                    case "cerrarsesion":
                  //  cerrarsesion(request,response);
                    default:
                        response.sendRedirect("index.jsp");
                }
                }else {
                          response.sendRedirect("index.jsp"); 
                        
                        }
        }catch(Exception e){
        
        
        }

    }

   
     public void validarusuario(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException  {
           HttpSession session=request.getSession();
        
        
        response.setContentType("text/html;charset=UTF-8");
     // String accion=request.getParameter("accion");
      
             String codigo_usuario=request.getParameter("codigo_usuario");
             String contrasena_usuario=request.getParameter("contrasena_usu");
              uBE.setCodigo_usuario(codigo_usuario);
              uBE.setContrasena_usuario(contrasena_usuario);
              r=uCO.validar(uBE);
              if (r==1) {
                  // trabajando con sesiones
                 session.setAttribute("codigo_usuario", codigo_usuario);
                  session.setAttribute("contrasena_usuario", contrasena_usuario);
                
                request.getRequestDispatcher("menu_principal.jsp").forward(request, response);
                
            }else {
              
              request.getRequestDispatcher("index.jsp").forward(request, response);
              }
             
        
         
     }
     
     
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        
    }
    
    
    
    
    private void cerrarsesion(HttpServletRequest request, HttpServletResponse response) throws Exception  {
         HttpSession session=request.getSession();
         
            session.setAttribute("codigo_usuario", null);
                  session.setAttribute("contrasena_usuario", null);
                  session.invalidate();
                  response.sendRedirect("index.jsp");
                  
    
    }
}