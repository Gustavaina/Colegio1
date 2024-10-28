/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;


public class NivelModel {
    
    String id_nivel;
    String niv_descri;
    int niv_estcod;

    public NivelModel() {
    }

    public NivelModel(String id_nivel, String niv_descri, int niv_estcod) {
        this.id_nivel = id_nivel;
        this.niv_descri = niv_descri;
        this.niv_estcod = niv_estcod;
    }

    public String getId_nivel() {
        return id_nivel;
    }

    public void setId_nivel(String id_nivel) {
        this.id_nivel = id_nivel;
    }

    public String getNiv_descri() {
        return niv_descri;
    }

    public void setNiv_descri(String niv_descri) {
        this.niv_descri = niv_descri;
    }

    public int getNiv_estcod() {
        return niv_estcod;
    }

    public void setNiv_estcod(int niv_estcod) {
        this.niv_estcod = niv_estcod;
    }
    
    
}
