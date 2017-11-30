package eta.app.prueba;

import eta.app.model.Usuario;
import eta.app.service.LogService;


public class Prueb02 {

	public static void main(String[] args) {
	    System.out.println("HECTOR");
	    try {
	      // Datos
	      String usuario = "hector";
	      String clave = "miguelito";
	      // Proceso
	      LogService logonService = new LogService();
	      Usuario  user = logonService.validar(usuario, clave);
	      // Reporte
	      System.out.println("USUARIO: " + user.getUsuario());
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	  }
	
	
	
}
