package pe.egcc.colegio.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pe.egcc.colegio.model.Usuario;
import pe.egcc.colegio.service.ColegioService;


@WebServlet(urlPatterns = {"/ProgSeccion"})
public class ColegioController extends HttpServlet {
	
  private static final long serialVersionUID = 1L;
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	  String path = request.getServletPath();
	  
	  switch (path) {
    case "/ProgSeccion":
      progSeccion(request, response);
      break;

    }
	
	}

  private void progSeccion(HttpServletRequest request, HttpServletResponse response) 
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
      int seccion = colegioService.progSeccion(periodo, grado, vacantes, usuario.getIdempleado());
      mensaje = "Proceso ok. Seccion: " + seccion + ".";
      
    } catch (Exception e) {
      mensaje = e.getMessage();
    }
    
    UtilController.sendMessageAJAX(response, mensaje);
    
  }

}
