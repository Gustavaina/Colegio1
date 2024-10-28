package dao;

import java.util.ArrayList;

public interface IControllerBase<T> {
    
    public T SelectByCodigo(String codigo);
    // public T SelectByCodigo(int codigo);
    public boolean Insert(T input);
    public ArrayList<T> SelectAll();
    public boolean Update(T input);
    public boolean Delete(String codigo);
     public  int validar(T input); // t input es para pasar un generico es decir cualquier clase.
    
}
