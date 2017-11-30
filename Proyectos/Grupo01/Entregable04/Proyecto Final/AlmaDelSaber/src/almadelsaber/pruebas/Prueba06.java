package almadelsaber.pruebas;

import java.util.List;
import java.util.Map;

import almadelsaber.service.RegistrarAlumno;



public class Prueba06 {
public static void main(String[] args) {
	    
	    // Datos
	    int periodo = 2018;
	    int nivel = 2;
	    
	    // Proceso
	    RegistrarAlumno alumnoService = new RegistrarAlumno();
	    List<Map<String,Object>> lista;
	    lista = alumnoService.leerAlumnos();
	    
	    // Reporte
	    System.out.println("REPORTE");
	    System.out.println("SIZE: " + lista.size());
	    for (Map<String, Object> r : lista) {
	      System.out.println(r.get("nombre") 
	          + " - " + r.get("apellido"));
	    }
	    
	  }

	}
