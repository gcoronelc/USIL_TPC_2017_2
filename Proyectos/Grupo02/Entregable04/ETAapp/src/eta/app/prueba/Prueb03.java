package eta.app.prueba;

import eta.app.service.ColegioService;

public class Prueb03 {

	 public static void main(String[] args) {
		    
		    // Datos
		    int periodo = 2018;
		    int grado = 201;
		    int vacantes = 30;
		    int usuario = 2;
		    
		    // Proceso
		    ColegioService colegioService = new ColegioService();
		    int seccion = colegioService.programarSec(periodo, grado, vacantes, usuario);
		    
		    // Reporte
		    System.out.println("SECCION: seccion");
		    
		  }
	
}
