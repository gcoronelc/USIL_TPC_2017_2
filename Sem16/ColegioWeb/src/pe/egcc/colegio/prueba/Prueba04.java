package pe.egcc.colegio.prueba;

import java.util.List;
import java.util.Map;

import pe.egcc.colegio.service.ColegioService;

public class Prueba04 {
  
  public static void main(String[] args) {
    
    // Datos
    int periodo = 2018;
    int nivel = 2;
    
    // Proceso
    ColegioService colegioService = new ColegioService();
    List<Map<String,Object>> lista;
    lista = colegioService.leerSecciones(periodo, nivel);
    
    // Reporte
    System.out.println("REPORTE");
    System.out.println("SIZE: " + lista.size());
    for (Map<String, Object> r : lista) {
      System.out.println(r.get("nombre") 
          + " - " + r.get("matriculados"));
    }
    
  }

}
