/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author moral
 */
public class CursoModel {
    int id_cur;
    String cur_descri;
int cur_estcod;
    public CursoModel() {
    }

    public CursoModel(int id_cur, String cur_descri, int cur_estcod) {
        this.id_cur = id_cur;
        this.cur_descri = cur_descri;
        this.cur_estcod = cur_estcod;
    }

    public int getId_cur() {
        return id_cur;
    }

    public void setId_cur(int id_cur) {
        this.id_cur = id_cur;
    }

    public String getCur_descri() {
        return cur_descri;
    }

    public void setCur_descri(String cur_descri) {
        this.cur_descri = cur_descri;
    }

    public int getCur_estcod() {
        return cur_estcod;
    }

    public void setCur_estcod(int cur_estcod) {
        this.cur_estcod = cur_estcod;
    }
    
}
