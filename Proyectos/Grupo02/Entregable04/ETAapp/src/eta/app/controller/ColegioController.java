package eta.app.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import eta.app.model.Usuario;
import eta.app.service.ColegioService;
import eta.app.controller.UtilController;

@WebServlet("/ProgramarSec")
public class ColegioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		  String path = request.getServletPath();
		  
		  switch (path) {
	    case "/ProgramarSec":
	      programarSec(request, response);
	      break;

	    }
		}

 
    private void programarSec(HttpServletRequest request, HttpServletResponse response) 
    	throws ServletException, IOException {
    		
    	    // Datos
    	    int periodo = Integer.parseInt(request.getParameter("periodo"));
    	    int grado = Integer.parseInt(request.getParameter("grado"));
    	    int vacantes = Integer.parseInt(request.getParameter("vacantes"));
    	    
    	 // Proceso
    	    
    	    String mensaje;
    	    try {
    	      
    	      Usuario usuario = (Usuario) UtilController.getSession(request,"usuario");            
    	      ColegioService colegioService = new ColegioService();
    	      int seccion = colegioService.programarSec(periodo, grado, vacantes, usuario.getIdempleado());
    	      mensaje = "PROCESO EXITOSO. SECCION: " + seccion + ".";
    	      
    	    } catch (Exception e) {
    	      mensaje = e.getMessage();
    	    }
    	    
    	    UtilController.sendMessageAJAX(response, mensaje);
    	    
    	  }
    }

