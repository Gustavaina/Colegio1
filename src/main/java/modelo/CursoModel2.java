/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author U-07
 */
public class CursoModel2 {
   String id_curso;
   String nombre_curso;
 String descripcion_curso;
   int estado_curso;
   
   
   
    public CursoModel2() {
    }

    public CursoModel2(String id_curso, String nombre_curso, String descripcion_curso, int estado_curso) {
        this.id_curso = id_curso;
        this.nombre_curso = nombre_curso;
        this.descripcion_curso = descripcion_curso;
        this.estado_curso = estado_curso;
    }

    public String getId_curso() {
        return id_curso;
    }

    public void setId_curso(String id_curso) {
        this.id_curso = id_curso;
    }

    public String getNombre_curso() {
        return nombre_curso;
    }

    public void setNombre_curso(String nombre_curso) {
        this.nombre_curso = nombre_curso;
    }

    public String getDescripcion_curso() {
        return descripcion_curso;
    }

    public void setDescripcion_curso(String descripcion_curso) {
        this.descripcion_curso = descripcion_curso;
    }

    public int getEstado_curso() {
        return estado_curso;
    }

    public void setEstado_curso(int estado_curso) {
        this.estado_curso = estado_curso;
    }
  
}
