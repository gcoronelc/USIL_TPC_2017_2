package almadelsaber.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import almadelsaber.model.ResponseModel;
import almadelsaber.model.UsuarioModel;
import almadelsaber.service.SeccionService;



@WebServlet(urlPatterns = {"/LeerSecciones","/ProgSeccion"})
public class SeccionController extends HttpServlet {
	
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
                 
      SeccionService seccionService = new SeccionService();
      List<Map<String, Object>> lista;
      lista = seccionService.leerSecciones(periodo, nivel);
      
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
      
      UsuarioModel usuario = (UsuarioModel) UtilController.getSession(request,"usuario");            
      SeccionService seccionService = new SeccionService();
      int seccion = seccionService.progSeccion( nombre, periodo, grado, vacantes, usuario.getIdempleado());
      mensaje = "Proceso ok. Seccion: " + seccion + ".";
      
    } catch (Exception e) {
      mensaje = e.getMessage();
    }
    
    UtilController.sendMessageAJAX(response, mensaje);
    
  }

}