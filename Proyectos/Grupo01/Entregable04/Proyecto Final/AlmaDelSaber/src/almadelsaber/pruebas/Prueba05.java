package almadelsaber.pruebas;

import java.util.List;
import java.util.Map;

import almadelsaber.service.SeccionService;



public class Prueba05 {
	public static void main(String[] args) {
	    
	    // Datos
	    int periodo = 2018;
	    int nivel = 2;
	    
	    // Proceso
	    SeccionService seccionService = new SeccionService();
	    List<Map<String,Object>> lista;
	    lista = seccionService.leerSecciones(periodo, nivel);
	    
	    // Reporte
	    System.out.println("REPORTE");
	    System.out.println("SIZE: " + lista.size());
	    for (Map<String, Object> r : lista) {
	      System.out.println(r.get("nombre") 
	          + " - " + r.get("matriculados"));
	    }
	    
	  }

	}