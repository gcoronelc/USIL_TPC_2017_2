package pe.egcc.calculadora.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pe.egcc.calculadora.service.CalculaService;

@WebServlet({"/Sumar","/Restar","/Multiplicar","/Dividir","/Resto"})
public class CalculaController extends HttpServlet {
  
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, 
	    HttpServletResponse response) throws ServletException, IOException {

	  String path = request.getServletPath();
	  
	  switch (path) {
    case "/Sumar":
      sumar(request,response);
      break;
    case "/Restar":
      restar(request,response);
      break;
    }
	  
	}

  private void sumar(HttpServletRequest request, 
      HttpServletResponse response) 
      throws ServletException, IOException {
    // Datos
    int num1 = Integer.parseInt(request.getParameter("num1"));
    int num2 = Integer.parseInt(request.getParameter("num2"));
    // Proceso
    CalculaService service = new CalculaService();
    int suma = service.sumar(num1, num2);
    // Reporte
    request.setAttribute("num1", num1);
    request.setAttribute("num2", num2);
    request.setAttribute("suma", suma);
    // Dispatcher
    dispatcher(request, response, "sumar.jsp");
  }

 

  private void restar(HttpServletRequest request, HttpServletResponse response) {
    // TODO Auto-generated method stub
    
  }
  
  
  private void dispatcher(HttpServletRequest request, 
      HttpServletResponse response, String destino) 
      throws ServletException, IOException {
    RequestDispatcher rd;
    rd = request.getRequestDispatcher(destino);
    rd.forward(request, response);
  }

}
