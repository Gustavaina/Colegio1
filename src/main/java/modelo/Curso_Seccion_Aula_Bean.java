/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author moral
 */
public class Curso_Seccion_Aula_Bean extends  Curso_Seccion_Aula_Model {
 
  String nombre_curso;
  String sec_descri;
  String aul_descri;
  String doc_nombre;
String id_nivel;
int estado;
public Curso_Seccion_Aula_Bean()   {


}
 public Curso_Seccion_Aula_Bean(String cur_codigo, String id_seccion, String id_aula, String id_docente, int estado)  {
 this.cur_codigo=cur_codigo;
 this.id_seccion=id_seccion;
 this.id_aula=id_aula;
 this.id_docente=id_docente;
 this.estado=estado;
 }

 
     public Curso_Seccion_Aula_Bean(String cur_codigo, String nombre_curso, String sec_descri, String aul_descri, String doc_nombre, String id_nivel, int estado) {
        this.cur_codigo=cur_codigo;
        this.nombre_curso = nombre_curso;
        this.sec_descri = sec_descri;
        this.aul_descri = aul_descri;
        this.doc_nombre = doc_nombre;
        this.id_nivel = id_nivel;
        this.estado = estado;
    }
    public String getNombre_curso() {
        return nombre_curso;
    }

    public void setNombre_curso(String nombre_curso) {
        this.nombre_curso = nombre_curso;
    }

    public String getSec_descri() {
        return sec_descri;
    }

    public void setSec_descri(String sec_descri) {
        this.sec_descri = sec_descri;
    }

    public String getAul_descri() {
        return aul_descri;
    }

    public void setAul_descri(String aul_descri) {
        this.aul_descri = aul_descri;
    }

    public String getDoc_nombre() {
        return doc_nombre;
    }

    public void setDoc_nombre(String doc_nombre) {
        this.doc_nombre =doc_nombre;
    }

    public String getId_nivel() {
        return id_nivel;
    }

    public void setId_nivel(String id_nivel) {
        this.id_nivel =id_nivel;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
  

 
  

 

  
}
