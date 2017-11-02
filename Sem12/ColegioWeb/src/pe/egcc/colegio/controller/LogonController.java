package pe.egcc.colegio.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pe.egcc.colegio.model.Usuario;
import pe.egcc.colegio.service.LogonService;

@WebServlet({"/Ingresar", "/Salir"})
public class LogonController extends HttpServlet {

  private static final long serialVersionUID = 1L;
       
  	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  	  
  	  String path = request.getServletPath();
  	  
  	  switch (path) {
      case "/Ingresar":
        ingresar(request,response);
        break;
      case "/Salir":
        salir(request,response);
        break;
      }
  	  	
  	}

    private void ingresar(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
      
      // Variable de control
      String destino;

    	// Datos
      String usuario = request.getParameter("usuario");
      String clave = request.getParameter("clave");
      
      
      try {
        
        LogonService logonService = new LogonService();
        Usuario bean = logonService.validar(usuario, clave);
        
        if( bean == null ){
          throw new Exception("Datos incorrectos");
        }
        
        UtilController.setSession(request,"usuario", bean);
        
        destino = "main.jsp";
        
      } catch (Exception e) {

        request.setAttribute("error", e.getMessage());
        destino = "index.jsp";
      }
      
    	
      UtilController.forward(request, response, destino);
      
    }

    private void salir(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
      
      UtilController.resetSession(request);
      UtilController.forward(request, response, "index.jsp");
      
    }

}
