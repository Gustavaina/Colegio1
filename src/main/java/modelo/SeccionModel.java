/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

public class SeccionModel {
    
  String id_seccion; 
  String sec_descri;
  int sec_estcod;
  String id_aula;
  String id_nivel;
  private int cantidad;

    public SeccionModel() {
    }

    public SeccionModel(String id_seccion, String sec_descri, int sec_estcod, String id_aula, String id_nivel, int cantidad) {
        this.id_seccion = id_seccion;
        this.sec_descri = sec_descri;
        this.sec_estcod = sec_estcod;
        this.id_aula = id_aula;
        this.id_nivel = id_nivel;
        this.cantidad = cantidad;
    }

    public String getId_seccion() {
        return id_seccion;
    }

    public void setId_seccion(String id_seccion) {
        this.id_seccion = id_seccion;
    }

    public String getSec_descri() {
        return sec_descri;
    }

    public void setSec_descri(String sec_descri) {
        this.sec_descri = sec_descri;
    }

    public int getSec_estcod() {
        return sec_estcod;
    }

    public void setSec_estcod(int sec_estcod) {
        this.sec_estcod = sec_estcod;
    }

    public String getId_aula() {
        return id_aula;
    }

    public void setId_aula(String id_aula) {
        this.id_aula = id_aula;
    }

    public String getId_nivel() {
        return id_nivel;
    }

    public void setId_nivel(String id_nivel) {
        this.id_nivel = id_nivel;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
    
  
  
    
}
