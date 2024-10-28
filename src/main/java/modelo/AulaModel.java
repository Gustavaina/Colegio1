
package modelo;

import util.MySQLConexion;





public class AulaModel extends MySQLConexion{
    String id_aula;
    String aul_descri;
    int aul_estcod;

    public AulaModel() {
    }

    public AulaModel(String id_aula, String aul_descri, int aul_estcod) {
        this.id_aula = id_aula;
        this.aul_descri = aul_descri;
        this.aul_estcod = aul_estcod;
    }
    

    public String getId_aula() {
        return id_aula;
    }

    public void setId_aula(String id_aula) {
        this.id_aula = id_aula;
    }

    public String getAul_descri() {
        return aul_descri;
    }

    public void setAul_descri(String aul_descri) {
        this.aul_descri = aul_descri;
    }

    public int getAul_estcod() {
        return aul_estcod;
    }

    public void setAul_estcod(int aul_estcod) {
        this.aul_estcod = aul_estcod;
    }
    
    

}