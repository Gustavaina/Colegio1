
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
public class JsfControllerMatri {
 private List<MatriculaBean> listMatricula;
    private List<NotasBean> listNotas;
    private List<SelectItem> listCur;
    private List<SelectItem> lisMatri;
    private List<AlumnoBean> listAlumno;
    private List<CursoBean2> listCurs;
    private List<AlumnoBean> listaAlumnosPorCurso;
    private List<SelectItem> listPen;
    private List<PensionBean> listpens;
    private List<SelectItem> listAlu;
    private PensionBean pen;
    private AlumnoBean alu;
    private String nombre;
    private String texto;    
    private NotasModel notas;
    private CursoModel2 cur;    
    private Negocio negocio;
    private MatriculaBean matriculaSeleccionada;
    private NotasBean notaSeleccionada;
    private String selectedCourse;

    @PostConstruct
    public void init() {
        try {
        negocio = new Negocio();
        listpens = negocio.SelectAllPen();        
        listCur = new ArrayList<>();
        listAlumno = new ArrayList<>();
        listAlu = new ArrayList<>();  // Initialize listAlu
        for (AlumnoBean x : negocio.SelectAllAlu()) {
            SelectItem sel = new SelectItem(x.getAlu_id(), x.getAlu_nombres());
            listAlu.add(sel);
        }
        cargarClientes();
          } catch (Exception e) {
        e.printStackTrace();
    }
    }

    public void cargarClientes() {
        texto = "";
        listMatricula = negocio.SelectAll();
    }

    public void cargarNotas(MatriculaBean matricu) {
        matriculaSeleccionada = matricu;
        listNotas = negocio.notasByMatri(matricu.getId_matricula());
    }

    public void cargarCursos(NotasBean notas) {
        notaSeleccionada = notas;
        listCurs = negocio.obtenerCursosRelacionadosConNotas(notas.getId_notas());
    }

    public void filtraCur() {
        if (selectedCourse != null && !selectedCourse.isEmpty()) {
            listaAlumnosPorCurso = negocio.ListCurAlu(selectedCourse);
        } else {
            listaAlumnosPorCurso = null;
        }
    }
    
    //getters and setters


    public List<SelectItem> getLisMatri() {
        return lisMatri;
    }

    public void setLisMatri(List<SelectItem> lisMatri) {
        this.lisMatri = lisMatri;
    }

    public List<AlumnoBean> getListaAlumnosPorCurso() {
        return listaAlumnosPorCurso;
    }

    public void setListaAlumnosPorCurso(List<AlumnoBean> listaAlumnosPorCurso) {
        this.listaAlumnosPorCurso = listaAlumnosPorCurso;
    }


    public List<PensionBean> getListpens() {
        return listpens;
    }

    public void setListpens(List<PensionBean> listpens) {
        this.listpens = listpens;
    }

    public List<SelectItem> getListAlu() {
        return listAlu;
    }

    public void setListAlu(List<SelectItem> listAlu) {
        this.listAlu = listAlu;
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

    public String getSelectedCourse() {
        return selectedCourse;
    }

    public void setSelectedCourse(String selectedCourse) {
        this.selectedCourse = selectedCourse;
    }

    public List<MatriculaBean> getListMatricula() {
        return listMatricula;
    }

    public void setListMatricula(List<MatriculaBean> listMatricula) {
        this.listMatricula = listMatricula;
    }

    public List<NotasBean> getListNotas() {
        return listNotas;
    }

    public void setListNotas(List<NotasBean> listNotas) {
        this.listNotas = listNotas;
    }

    public List<SelectItem> getListCur() {
        return listCur;
    }

    public void setListCur(List<SelectItem> listCur) {
        this.listCur = listCur;
    }

    public List<AlumnoBean> getListAlumno() {
        return listAlumno;
    }

    public void setListAlumno(List<AlumnoBean> listAlumno) {
        this.listAlumno = listAlumno;
    }

    public List<CursoBean2> getListCurs() {
        return listCurs;
    }

    public void setListCurs(List<CursoBean2> listCurs) {
        this.listCurs = listCurs;
    }

    public List<SelectItem> getListPen() {
        return listPen;
    }

    public void setListPen(List<SelectItem> listPen) {
        this.listPen = listPen;
    }

    public Negocio getNegocio() {
        return negocio;
    }

    public void setNegocio(Negocio negocio) {
        this.negocio = negocio;
    }
    
    
    
    
    
    
    
}
