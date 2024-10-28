/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import util.MySQLConexion;

/**
 *
 * @author moral
 */

public class AlumnoModel  extends MySQLConexion{
   private  String  alu_id;
   private String alu_nombres;
   private String alu_apellidos;
   private String alu_dni;
   private String alu_telefono;
   private String alu_sexo;
   private String alu_direccion;
   
   
    public AlumnoModel() {
    }
    public AlumnoModel(String alu_id, String alu_nombres, String alu_apellidos, String alu_dni, String alu_telefono,String alu_sexo, String alu_direccion) {
        this.alu_id = alu_id;
        this.alu_nombres = alu_nombres;
        this.alu_apellidos = alu_apellidos;
        this.alu_dni = alu_dni;
        this.alu_telefono = alu_telefono;
        this.alu_sexo = alu_sexo;
        this.alu_direccion = alu_direccion;
    }
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
    public String getAlu_telefono() {
        return alu_telefono;
    }
    public void setAlu_telefono(String alu_telefono) {
        this.alu_telefono = alu_telefono;
    }
    public String getAlu_direccion() {
        return alu_direccion;
    }
    public void setAlu_direccion(String alu_direccion) {
        this.alu_direccion = alu_direccion;
    }

    public String getAlu_sexo() {
        return alu_sexo;
    }

    public void setAlu_sexo(String alu_sexo) {
        this.alu_sexo = alu_sexo;
    }

    
}



