package eta.app.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eta.app.model.Usuario;
import eta.app.service.LogService;
import eta.app.controller.UtilController;


@WebServlet({"/INGRESAR", "/SALIR"})
public class LogController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  	  
	  	  String path = request.getServletPath();
	  	  
	  	  switch (path) {
	      case "/INGRESAR":
	        ingresar(request,response);
	        break;
	      case "/SALIR":
	        salir(request,response);
	        break;
	      }
	  	  	
	  	}
	
	private void ingresar(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
	      
	      // VARIABLE
	      String destino;

	    	// DATOS
	      String usuario = request.getParameter("usuario");
	      String clave = request.getParameter("clave");
	      
	      
	      try {
	        
	        LogService logonService = new LogService();
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

