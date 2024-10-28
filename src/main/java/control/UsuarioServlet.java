package control;


import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonSyntaxException;
import dao.UsuarioController;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.UsuarioBean;

@WebServlet(name = "UsuarioServlet", urlPatterns = {"/Usuario.do"})
public class UsuarioServlet extends HttpServlet {
    UsuarioController UBL = new UsuarioController();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        //TODO - HEADER RESPONSE
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        //TODO - JSON RESULT
        com.google.gson.JsonObject jsonResult = new com.google.gson.JsonObject();        
        try {
            //TODO - POBLAR LISTA DE DATOS
            ArrayList<UsuarioBean> lst = new ArrayList<>(); 
            if(request.getParameter("codigo")!=null){
                UsuarioBean UBE = UBL.SelectByCodigo(request.getParameter("codigo"));
                lst.add(UBE);
            }else{
                lst = UBL.SelectAll();
            }
            
            JsonElement jElement = new Gson().toJsonTree(lst);
            jsonResult.addProperty("status", Boolean.TRUE);
            jsonResult.addProperty("message", lst.size() + " REGISTRO(S) ENCONTRADO(S)");
            jsonResult.add("usuarios", jElement);
        } catch (Exception e) {
            jsonResult.addProperty("status", Boolean.FALSE);
            jsonResult.addProperty("message", e.getMessage());
        }
        out.println(jsonResult.toString());
        out.flush();
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        //TODO - HEADER RESPONSE
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        //TODO - JSON RESULT
        com.google.gson.JsonObject jsonResult = new com.google.gson.JsonObject();         
        try {
            StringBuilder sb = new StringBuilder();
            BufferedReader br = request.getReader();
            String str;
            while((str = br.readLine())!= null){
                sb.append(str);
            }
             com.google.gson.JsonObject jsonRequest = JsonParser.parseString(sb.toString()).getAsJsonObject();
        UsuarioBean UBE = new Gson().fromJson(jsonRequest, UsuarioBean.class);
            jsonResult.addProperty("status", Boolean.TRUE);
            if(UBL.Insert(UBE)){
                jsonResult.addProperty("message",  "1 REGISTRO GUARDADO");
            }else{
                jsonResult.addProperty("message",  "NINGUN REGISTRO GUARDADO");
            }
        } catch (JsonSyntaxException | IOException e) {
            jsonResult.addProperty("status", Boolean.FALSE);
            jsonResult.addProperty("message", e.getMessage());
        }
        out.println(jsonResult.toString());
        out.flush();        
        
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        //TODO - HEADER RESPONSE
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        //TODO - JSON RESULT
       com.google.gson.JsonObject jsonResult = new com.google.gson.JsonObject();   
        try {            
            if(request.getParameter("codigo")!=null){
                jsonResult.addProperty("status", Boolean.TRUE);
                if(UBL.Delete(request.getParameter("codigo"))){                    
                    jsonResult.addProperty("message","1 REGISTRO ELIMINADO");
                }else{
                    jsonResult.addProperty("message","NINGUN REGISTRO ELIMINADO");
                }
            }
        } catch (Exception e) {
            jsonResult.addProperty("status", Boolean.FALSE);
            jsonResult.addProperty("message", e.getMessage());
        }
        out.println(jsonResult.toString());
        out.flush();
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        //TODO - HEADER RESPONSE
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        //TODO - JSON RESULT
        com.google.gson.JsonObject jsonResult = new com.google.gson.JsonObject();         
        try {
            StringBuilder sb = new StringBuilder();
            BufferedReader br = request.getReader();
            String str;
            while((str = br.readLine())!= null){
                sb.append(str);
            }
           com.google.gson.JsonObject jsonRequest = JsonParser.parseString(sb.toString()).getAsJsonObject();
            UsuarioBean UBE = new Gson().fromJson(jsonRequest, UsuarioBean.class);
            jsonResult.addProperty("status", Boolean.TRUE);
            if(UBL.Update(UBE)){
                jsonResult.addProperty("message",  "1 REGISTRO ACTUALIZADO");
            }else{
                jsonResult.addProperty("message",  "NINGUN REGISTRO ACTUALIZADO");
            }
        } catch (JsonSyntaxException | IOException e) {
            jsonResult.addProperty("status", Boolean.FALSE);
            jsonResult.addProperty("message", e.getMessage());
        }
        out.println(jsonResult.toString());
        out.flush();
    }
}