/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author U-07
 */
public class MatriculaBean  extends MatriculaModel{
    private String descri_alumno;
    
    private  String descri_seccion;
    private  String  alu_id;
   private String alu_nombres;
   private String alu_apellidos;
   private String alu_dni;
  private String sec_descri;

    public String getAlu_id() {
        return alu_id;
    }

    public void setAlu_id(String alu_id) {
        this.alu_id = alu_id;
    }

    public String getAlu_nombres() {
        return alu_nombres;
    }

    public void setAlu_nombres(String alu_nombres) {
        this.alu_nombres = alu_nombres;
    }

    public String getAlu_apellidos() {
        return alu_apellidos;
    }

    public void setAlu_apellidos(String alu_apellidos) {
        this.alu_apellidos = alu_apellidos;
    }

    public String getAlu_dni() {
        return alu_dni;
    }

    public void setAlu_dni(String alu_dni) {
        this.alu_dni = alu_dni;
    }

    public String getSec_descri() {
        return sec_descri;
    }

    public void setSec_descri(String sec_descri) {
        this.sec_descri = sec_descri;
    }
    public String getDescri_alumno() {
        return descri_alumno;
    }

    public void setDescri_alumno(String descri_alumno) {
        this.descri_alumno = descri_alumno;
    }

    public String getDescri_seccion() {
        return descri_seccion;
    }

    public void setDescri_seccion(String descri_seccion) {
        this.descri_seccion = descri_seccion;
    }
    
    
 
}
