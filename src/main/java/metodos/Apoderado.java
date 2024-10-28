package metodos;

public class Apoderado {
    private int id;
    private String nombres;
    private String apellidos;
    private String telefono;
    private String correoElectronico; // Mejor cambiar el nombre a camelCase
    private String direccion;
    private String dniMenor;
    private String sexo;
    private String dniApoderado;

    // Constructor vacío
    public Apoderado() {
    }

    // Constructor con parámetros
    public Apoderado(int id, String nombres, String apellidos, String telefono, 
                     String correoElectronico, String direccion, String dniMenor, 
                     String sexo, String dniApoderado) {
        this.id = id;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.telefono = telefono;
        this.correoElectronico = correoElectronico;
        this.direccion = direccion;
        this.dniMenor = dniMenor;
        this.sexo = sexo;
        this.dniApoderado = dniApoderado;
    }

    // Getters y Setters (opcional, pero recomendado)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreoElectronico() {
        return correoElectronico;
    }

    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getDniMenor() {
        return dniMenor;
    }

    public void setDniMenor(String dniMenor) {
        this.dniMenor = dniMenor;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getDniApoderado() {
        return dniApoderado;
    }

    public void setDniApoderado(String dniApoderado) {
        this.dniApoderado = dniApoderado;
    }
}
