/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;



public class PensionModel {

    String id_pension;
    String id_matricula;
    String id_alumno;
    String pension_mes;
    Double pension_monto;
    Double pension_descuento;
    Double pension_mora;
    String pension_fecha_registro;
    String pension_fecha_vencimiento;
    int pension_estado;

    public PensionModel() {
    }

    public PensionModel(String id_pension, String id_matricula, String id_alumno, String pension_mes, Double pension_monto, Double pension_descuento, Double pension_mora, String pension_fecha_registro, String pension_fecha_vencimiento, int pension_estado) {
        this.id_pension = id_pension;
        this.id_matricula = id_matricula;
        this.id_alumno = id_alumno;
        this.pension_mes = pension_mes;
        this.pension_monto = pension_monto;
        this.pension_descuento = pension_descuento;
        this.pension_mora = pension_mora;
        this.pension_fecha_registro = pension_fecha_registro;
        this.pension_fecha_vencimiento = pension_fecha_vencimiento;
        this.pension_estado = pension_estado;
    }

    public String getId_pension() {
        return id_pension;
    }

    public void setId_pension(String id_pension) {
        this.id_pension = id_pension;
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

    public String getPension_mes() {
        return pension_mes;
    }

    public void setPension_mes(String pension_mes) {
        this.pension_mes = pension_mes;
    }

    public Double getPension_monto() {
        return pension_monto;
    }

    public void setPension_monto(Double pension_monto) {
        this.pension_monto = pension_monto;
    }

    public Double getPension_descuento() {
        return pension_descuento;
    }

    public void setPension_descuento(Double pension_descuento) {
        this.pension_descuento = pension_descuento;
    }

    public Double getPension_mora() {
        return pension_mora;
    }

    public void setPension_mora(Double pension_mora) {
        this.pension_mora = pension_mora;
    }

    public String getPension_fecha_registro() {
        return pension_fecha_registro;
    }

    public void setPension_fecha_registro(String pension_fecha_registro) {
        this.pension_fecha_registro = pension_fecha_registro;
    }

    public String getPension_fecha_vencimiento() {
        return pension_fecha_vencimiento;
    }

    public void setPension_fecha_vencimiento(String pension_fecha_vencimiento) {
        this.pension_fecha_vencimiento = pension_fecha_vencimiento;
    }

    public int getPension_estado() {
        return pension_estado;
    }

    public void setPension_estado(int pension_estado) {
        this.pension_estado = pension_estado;
    }

    @Override
    public String toString() {
        return "PensionModel{" + "id_pension=" + id_pension + ", id_matricula=" + id_matricula + ", id_alumno=" + id_alumno + ", pension_mes=" + pension_mes + ", pension_monto=" + pension_monto + ", pension_descuento=" + pension_descuento + ", pension_mora=" + pension_mora + ", pension_fecha_registro=" + pension_fecha_registro + ", pension_fecha_vencimiento=" + pension_fecha_vencimiento + ", pension_estado=" + pension_estado + '}';
    }

    
    
    
    
    
}  
    

   
