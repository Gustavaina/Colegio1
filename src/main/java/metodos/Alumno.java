package metodos;

public class Alumno {
    private int id; 
    private String nombres;
    private String apellidos;
    private String dni;
    private String telefono;
    private String sexo;
    private String direccion;
    private String correo;

    // Constructor
    public Alumno(int id, String nombres, String apellidos, String dni, String telefono, String sexo, String direccion, String correo) {
        this.id = id;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.dni = dni;
        this.telefono = telefono;
        this.sexo = sexo;
        this.direccion = direccion;
        this.correo = correo;
    }

    
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

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }
}
