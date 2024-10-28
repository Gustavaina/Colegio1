/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author U-07
 */
public class MatriculaModel  {
    
    String id_matricula;
    String id_alumno;
    String id_seccion;
    String matricula_fecha_ingreso;
    int matricula_estado;

    public MatriculaModel(String id_matricula, String id_alumno, String id_seccion, String matricula_fecha_ingreso, int matricula_estado) {
        this.id_matricula = id_matricula;
        this.id_alumno = id_alumno;
        this.id_seccion = id_seccion;
        this.matricula_fecha_ingreso = matricula_fecha_ingreso;
        this.matricula_estado = matricula_estado;
    }
    

    public MatriculaModel() {
    }

    public String getId_matricula() {
        return id_matricula;
    }

    public void setId_matricula(String id_matricula) {
        this.id_matricula = id_matricula;
    }

    public String getId_alumno() {
        return id_alumno;
    }

    public void setId_alumno(String id_alumno) {
        this.id_alumno = id_alumno;
    }

    public String getId_seccion() {
        return id_seccion;
    }

    public void setId_seccion(String id_seccion) {
        this.id_seccion = id_seccion;
    }


    public String getMatricula_fecha_ingreso() {
        return matricula_fecha_ingreso;
    }

    public void setMatricula_fecha_ingreso(String matricula_fecha_ingreso) {
        this.matricula_fecha_ingreso = matricula_fecha_ingreso;
    }

    public int getMatricula_estado() {
        return matricula_estado;
    }

    public void setMatricula_estado(int matricula_estado) {
        this.matricula_estado = matricula_estado;
    }

    @Override
    public String toString() {
        return "MatriculaModel{" + "id_matricula=" + id_matricula + ", id_alumno=" + id_alumno + ", id_seccion=" + id_seccion + ", matricula_fecha_ingreso=" + matricula_fecha_ingreso + ", matricula_estado=" + matricula_estado + '}';
    }
    
    
}
