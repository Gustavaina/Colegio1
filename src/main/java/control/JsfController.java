package control;


import dao.Negocio;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.model.SelectItem;
import modelo.AlumnoBean;
import modelo.CursoBean2;
import modelo.CursoModel2;
import modelo.MatriculaBean;
import modelo.NotasBean;
import modelo.NotasModel;
import modelo.PensionBean;

@ManagedBean
@SessionScoped
public class JsfController {

    private List<MatriculaBean> ListMatricula;
    private List<NotasBean> ListNotas;
    private List<SelectItem> ListCur;
    private List<SelectItem> lisMatri;
    private List<AlumnoBean> ListAlumno;
    private List<CursoBean2> ListCurs;
    private List<AlumnoBean> listaAlumnosPorCurso;
    private List<SelectItem> ListPen;
    private List<PensionBean> listpens;
    private List<SelectItem> listAlu;
    private PensionBean pen;

    private String selectedAlumnoId;
    private AlumnoBean alu;
    private String nombre;
    private String texto;
    private NotasModel notas;
    private CursoModel2 cur;
    private Negocio Negocio;
    private MatriculaBean matriculaSeleccionada;
    private NotasBean notaSeleccionada;
    private String selectedCourse;

    @PostConstruct
    public void init() {
        try {
            Negocio = new Negocio();
            ListCur = new ArrayList<>();
            listAlu = new ArrayList<>();
            List<AlumnoBean> alumnos = Negocio.SelectAllAlu();
            for (AlumnoBean alumno : alumnos) {
                SelectItem selectItem = new SelectItem(alumno.getAlu_id(), alumno.getAlu_nombres());
                listAlu.add(selectItem);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
       
        
    }

    public void cargarClientes() {
        texto = "";
        ListMatricula = Negocio.SelectAll();
    }

    public void cargarNotas(MatriculaBean matricu) {
        matriculaSeleccionada = matricu;
        ListNotas = Negocio.notasByMatri(matricu.getId_matricula());
    }

    public void cargarCursos(NotasBean notas) {
        notaSeleccionada = notas;
        ListCurs = Negocio.obtenerCursosRelacionadosConNotas(notas.getId_notas());
    }

    public void filtraCur() {
        if (selectedCourse != null && !selectedCourse.isEmpty()) {
            listaAlumnosPorCurso = Negocio.ListCurAlu(selectedCourse);
        } else {
            listaAlumnosPorCurso = null;
        }
    }

    public void filtraPen() {
        try {
            if (selectedAlumnoId != null && !selectedAlumnoId.isEmpty()) {
                listpens = Negocio.cargarPenAlu(selectedAlumnoId);
            } else {
                listpens = new ArrayList<>();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    // Getters y Setters
    public List<MatriculaBean> getListMatricula() {
        return ListMatricula;
    }

    public void setListMatricula(List<MatriculaBean> ListMatricula) {
        this.ListMatricula = ListMatricula;
    }

    public List<NotasBean> getListNotas() {
        return ListNotas;
    }

    public void setListNotas(List<NotasBean> ListNotas) {
        this.ListNotas = ListNotas;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public List<AlumnoBean> getListAlumno() {
        return ListAlumno;
    }

    public void setListAlumno(List<AlumnoBean> ListAlumno) {
        this.ListAlumno = ListAlumno;
    }

    public NotasModel getNotas() {
        return notas;
    }

    public void setNotas(NotasModel notas) {
        this.notas = notas;
    }

    public CursoModel2 getCur() {
        return cur;
    }

    public void setCur(CursoModel2 cur) {
        this.cur = cur;
    }

    public List<SelectItem> getLisMatri() {
        return lisMatri;
    }

    public void setLisMatri(List<SelectItem> lisMatri) {
        this.lisMatri = lisMatri;
    }

    public Negocio getNegocio() {
        return Negocio;
    }

    public void setNegocio(Negocio Negocio) {
        this.Negocio = Negocio;
    }

    public MatriculaBean getMatriculaSeleccionada() {
        return matriculaSeleccionada;
    }

    public void setMatriculaSeleccionada(MatriculaBean matriculaSeleccionada) {
        this.matriculaSeleccionada = matriculaSeleccionada;
    }

    public NotasBean getNotaSeleccionada() {
        return notaSeleccionada;
    }

    public void setNotaSeleccionada(NotasBean notaSeleccionada) {
        this.notaSeleccionada = notaSeleccionada;
    }

    public List<CursoBean2> getListCurs() {
        return ListCurs;
    }

    public void setListCurs(List<CursoBean2> ListCurs) {
        this.ListCurs = ListCurs;
    }

    public List<AlumnoBean> getListaAlumnosPorCurso() {
        return listaAlumnosPorCurso;
    }

    public void setListaAlumnosPorCurso(List<AlumnoBean> listaAlumnosPorCurso) {
        this.listaAlumnosPorCurso = listaAlumnosPorCurso;
    }

    public String getSelectedCourse() {
        return selectedCourse;
    }

    public void setSelectedCourse(String selectedCourse) {
        this.selectedCourse = selectedCourse;
    }

    public List<SelectItem> getListCur() {
        return ListCur;
    }

    public void setListCur(List<SelectItem> ListCur) {
        this.ListCur = ListCur;
    }

    public List<SelectItem> getListPen() {
        return ListPen;
    }

    public void setListPen(List<SelectItem> ListPen) {
        this.ListPen = ListPen;
    }

    public PensionBean getPen() {
        return pen;
    }

    public void setPen(PensionBean pen) {
        this.pen = pen;
    }

    public AlumnoBean getAlu() {
        return alu;
    }

    public void setAlu(AlumnoBean alu) {
        this.alu = alu;
    }

    public List<SelectItem> getListAlu() {
        return listAlu;
    }

    public void setListAlu(List<SelectItem> listAlu) {
        this.listAlu = listAlu;
    }

    public List<PensionBean> getListpens() {
        return listpens;
    }

    public void setListpens(List<PensionBean> listpens) {
        this.listpens = listpens;
    }

    public String getSelectedAlumnoId() {
        return selectedAlumnoId;
    }

    public void setSelectedAlumnoId(String selectedAlumnoId) {
        this.selectedAlumnoId = selectedAlumnoId;
    }
}
