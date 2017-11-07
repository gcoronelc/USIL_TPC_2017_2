package pe.egcc.colegio.prueba;

import pe.egcc.colegio.service.ColegioService;

public class Prueba03 {
  
  public static void main(String[] args) {
    
    // Datos
    int periodo = 2018;
    int grado = 201;
    int vacantes = 30;
    int usuario = 2;
    
    // Proceso
    ColegioService colegioService = new ColegioService();
    int seccion = colegioService.progSeccion(periodo, grado, vacantes, usuario);
    
    // Reporte
    System.out.println("Seccion: " + seccion);
    
  }

}
