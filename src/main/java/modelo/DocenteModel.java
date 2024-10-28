
package modelo;

public class DocenteModel {
   private  String  id_docente;
   private String doc_descri;
   private int doc_estcod;
   private String doc_nombre;
   private String doc_apellido;
   private int doc_dni;
   private int doc_telefono;

    public DocenteModel() {
    }

    public DocenteModel(String id_docente, String doc_descri, int doc_estcod, String doc_nombre, String doc_apellido, int doc_dni, int doc_telefono) {
        this.id_docente = id_docente;
        this.doc_descri = doc_descri;
        this.doc_estcod = doc_estcod;
        this.doc_nombre = doc_nombre;
        this.doc_apellido = doc_apellido;
        this.doc_dni = doc_dni;
        this.doc_telefono = doc_telefono;
    }

    public String getId_docente() {
        return id_docente;
    }

    public void setId_docente(String id_docente) {
        this.id_docente = id_docente;
    }

    public String getDoc_descri() {
        return doc_descri;
    }

    public void setDoc_descri(String doc_descri) {
        this.doc_descri = doc_descri;
    }

    public int getDoc_estcod() {
        return doc_estcod;
    }

    public void setDoc_estcod(int doc_estcod) {
        this.doc_estcod = doc_estcod;
    }

    public String getDoc_nombre() {
        return doc_nombre;
    }

    public void setDoc_nombre(String doc_nombre) {
        this.doc_nombre = doc_nombre;
    }

    public String getDoc_apellido() {
        return doc_apellido;
    }

    public void setDoc_apellido(String doc_apellido) {
        this.doc_apellido = doc_apellido;
    }

    public int getDoc_dni() {
        return doc_dni;
    }

    public void setDoc_dni(int doc_dni) {
        this.doc_dni = doc_dni;
    }

    public int getDoc_telefono() {
        return doc_telefono;
    }

    public void setDoc_telefono(int doc_telefono) {
        this.doc_telefono = doc_telefono;
    }

    
   
   
   
}
