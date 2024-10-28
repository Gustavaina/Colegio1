
package modelo;

public abstract class UsuarioModel{
  String id_usuario;
  String codigo_usuario;
  String tipo_usuario;
    int estado;
String contrasena_usuario;

    public UsuarioModel() {
    }

    public UsuarioModel(String id_usuario, String codigo_usuario, String tipo_usuario, int estado, String contrasena_usuario) {
        this.id_usuario = id_usuario;
        this.codigo_usuario = codigo_usuario;
        this.tipo_usuario = tipo_usuario;
        this.estado = estado;
        this.contrasena_usuario = contrasena_usuario;
    }

    public String getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(String id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getCodigo_usuario() {
        return codigo_usuario;
    }

    public void setCodigo_usuario(String codigo_usuario) {
        this.codigo_usuario = codigo_usuario;
    }

    public String getTipo_usuario() {
        return tipo_usuario;
    }

    public void setTipo_usuario(String tipo_usuario) {
        this.tipo_usuario = tipo_usuario;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public String getContrasena_usuario() {
        return contrasena_usuario;
    }

    public void setContrasena_usuario(String contrasena_usuario) {
        this.contrasena_usuario = contrasena_usuario;
    }
    
    
}
  
    
    //CONSTRUCTOR POLIMORFISMO
   