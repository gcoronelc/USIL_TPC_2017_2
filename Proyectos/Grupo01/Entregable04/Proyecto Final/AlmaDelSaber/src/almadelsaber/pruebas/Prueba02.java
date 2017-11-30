package almadelsaber.pruebas;

import almadelsaber.model.UsuarioModel;
import almadelsaber.service.LogeoService;

public class Prueba02 {
	public static void main(String[] args) {
	    System.out.println("Gustavo");
	    try {
	      // Datos
	      String usuario = "gabriel";
	      String clave = "gabriel";
	      // Proceso
	      LogeoService logeoService = new LogeoService();
	      UsuarioModel  user = logeoService.validar(usuario, clave);
	      // Reporte
	      System.out.println("Usuario: " + user.getUsuario());
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	  }
	}
