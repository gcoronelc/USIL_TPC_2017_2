package pe.egcc.colegio.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import pe.egcc.colegio.model.ResponseModel;
import pe.egcc.colegio.model.Usuario;
import pe.egcc.colegio.service.ColegioService;


@WebServlet(urlPatterns = {"/LeerSecciones","/ProgSeccion"})
public class ColegioController extends HttpServlet {
	
  private static final long serialVersionUID = 1L;
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	  String path = request.getServletPath();
	  
	  switch (path) {
    case "/ProgSeccion":
      progSeccion(request, response);
      break;
    case "/LeerSecciones":
      leerSecciones(request, response);
      break;
    }
	
	}
	
	
	

  private void leerSecciones(HttpServletRequest request, 
      HttpServletResponse response) throws IOException {
    
    // Datos
    int periodo = Integer.parseInt(request.getParameter("periodo"));
    int nivel = Integer.parseInt(request.getParameter("nivel"));
    

    // Proceso
    ResponseModel bean;;
    try {
                 
      ColegioService colegioService = new ColegioService();
      List<Map<String, Object>> lista;
      lista = colegioService.leerSecciones(periodo, nivel);
      
      Gson gson= new Gson();
      String jsonText = gson.toJson(lista);
      
      bean = new ResponseModel(1, jsonText);
      
    } catch (Exception e) {
      bean = new ResponseModel( -1, e.getMessage() );
    }
    
    UtilController.sendResponseModelAJAX(response, bean);
    
  }




  private void progSeccion(HttpServletRequest request, HttpServletResponse response) 
      throws ServletException, IOException {
    // Datos
    int periodo = Integer.parseInt(request.getParameter("periodo"));
    String nombre = request.getParameter("nombre");
    int grado = Integer.parseInt(request.getParameter("grado"));
    int vacantes = Integer.parseInt(request.getParameter("vacantes"));
    

    // Proceso
    String mensaje;
    try {
      
      Usuario usuario = (Usuario) UtilController.getSession(request,"usuario");            
      ColegioService colegioService = new ColegioService();
      int seccion = colegioService.progSeccion( nombre, periodo, grado, vacantes, usuario.getIdempleado());
      mensaje = "Proceso ok. Seccion: " + seccion + ".";
      
    } catch (Exception e) {
      mensaje = e.getMessage();
    }
    
    UtilController.sendMessageAJAX(response, mensaje);
    
  }

}
