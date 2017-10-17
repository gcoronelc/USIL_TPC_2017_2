package pe.egcc.colegio.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

      RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
      rd.forward(request, response);
      
    }

    private void salir(HttpServletRequest request, HttpServletResponse response) {
      
    }

}
