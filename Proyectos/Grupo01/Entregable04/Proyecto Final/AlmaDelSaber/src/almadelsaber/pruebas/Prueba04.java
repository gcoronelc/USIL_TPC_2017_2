package almadelsaber.pruebas;

import almadelsaber.service.SeccionService;

public class Prueba04 {
	 public static void main(String[] args) {
		    
		    // Datos
		    int periodo = 2018;
		    String nombre = "Demo";
		    int grado = 201;
		    int vacantes = 30;
		    int usuario = 2;
		    
		    // Proceso
		    SeccionService seccionService = new SeccionService();
		    int seccion = seccionService.progSeccion( nombre,  periodo, grado, vacantes, usuario);
		    
		    // Reporte
		    System.out.println("Seccion: " + seccion);
		    
		  }

		}