/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;


public class NotasModel {
  String id_notas; 
  String id_matricula; 
  String id_curso;  
  String not_observ;
  Double not_valor;
  int not_estcod;

    public NotasModel() {
    }

    public NotasModel(String id_notas, String id_matricula, String id_curso, String not_observ, int not_estcod, Double not_valor) {
        this.id_notas = id_notas;
        this.id_matricula = id_matricula;
        this.id_curso = id_curso;
        this.not_observ = not_observ;
        this.not_estcod = not_estcod;
        this.not_valor = not_valor;
    }

    public String getId_notas() {
        return id_notas;
    }

    public void setId_notas(String id_notas) {
        this.id_notas = id_notas;
    }

    public String getId_matricula() {
        return id_matricula;
    }

    public void setId_matricula(String id_matricula) {
        this.id_matricula = id_matricula;
    }

    public String getId_curso() {
        return id_curso;
    }

    public void setId_curso(String id_curso) {
        this.id_curso = id_curso;
    }

    public String getNot_observ() {
        return not_observ;
    }

    public void setNot_observ(String not_observ) {
        this.not_observ = not_observ;
    }

    public int getNot_estcod() {
        return not_estcod;
    }

    public void setNot_estcod(int not_estcod) {
        this.not_estcod = not_estcod;
    }

    public Double getNot_valor() {
        return not_valor;
    }

    public void setNot_valor(Double not_valor) {
        this.not_valor = not_valor;
    }

    @Override
    public String toString() {
        return "NotasModel{" + "id_notas=" + id_notas + ", id_matricula=" + id_matricula + ", id_curso=" + id_curso + ", not_observ=" + not_observ + ", not_estcod=" + not_estcod + ", not_valor=" + not_valor + '}';
    }

  
   
  
  
    
}
