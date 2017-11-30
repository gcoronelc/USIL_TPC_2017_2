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
import almadelsaber.service.RegistrarAlumno;


@WebServlet(urlPatterns = {"/LeerAlumnos","/RegistrarAlu"})
public class AlumnoController extends HttpServlet {
	
  private static final long serialVersionUID = 1L;
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	  String path = request.getServletPath();
	  
	  switch (path) {
    case "/RegistrarAlu":
      RegistrarAlu(request, response);
      break;
    case "/LeerAlumnos":
      leerAlumnos(request, response);
      break;
    }
	
	}
	
	
	

  private void leerAlumnos(HttpServletRequest request, 
      HttpServletResponse response) throws IOException {
    

    // Proceso
    ResponseModel bean;;
    try {
                 
      RegistrarAlumno alumnoService = new RegistrarAlumno();
      List<Map<String, Object>> lista;
      lista = alumnoService.leerAlumnos();
      
      Gson gson= new Gson();
      String jsonText = gson.toJson(lista);
      
      bean = new ResponseModel(1, jsonText);
      
    } catch (Exception e) {
      bean = new ResponseModel( -1, e.getMessage() );
    }
    
    UtilController.sendResponseModelAJAX(response, bean);
    
  }




  private void RegistrarAlu(HttpServletRequest request, HttpServletResponse response) 
      throws ServletException, IOException {
    // Datos
  
    String apellido = request.getParameter("apellido");
    String nombre = request.getParameter("nombre");
    String dni = request.getParameter("dni");
    String direccion = request.getParameter("direccion");
    String telefono = request.getParameter("telefono");
    String email = request.getParameter("email");
    
    
    

    // Proceso
    String mensaje;
    try {
                  
      RegistrarAlumno alumnoService = new RegistrarAlumno();
      int alumno = alumnoService.registrarAlu(apellido, nombre, dni, direccion, telefono, email);
      mensaje = "Proceso ok. Codigo de Alumno: " + alumno + ".";
      
    } catch (Exception e) {
      mensaje = e.getMessage();
    }
    
    UtilController.sendMessageAJAX(response, mensaje);
    
  }

}