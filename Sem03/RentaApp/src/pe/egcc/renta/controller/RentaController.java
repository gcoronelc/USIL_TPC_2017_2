package pe.egcc.renta.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.jrockit.jfr.RequestDelegate;

import pe.egcc.renta.model.RentaModel;
import pe.egcc.renta.service.RentaService;

/**
 * Servlet implementation class RentaController
 */
@WebServlet("/RentaController")
public class RentaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	@Override
	protected void service(HttpServletRequest request, 
	    HttpServletResponse response) throws ServletException, IOException {
	 
	  // Datos
	  RentaModel model = new RentaModel();
	  model.setCurso(request.getParameter("curso"));
	  model.setPrecio(Double.parseDouble(request.getParameter("precio")));
	  model.setHoras(Integer.parseInt(request.getParameter("horas")));
	  model.setCantAlu(Integer.parseInt(request.getParameter("cantAlu")));
	  model.setPagoHora(Double.parseDouble(request.getParameter("pagoHora")));
	  
	  // Proceso
	  RentaService service = new RentaService();
	  model = service.procesarRenta(model);
	  
	  // Forward
	  request.setAttribute("bean", model);
	  RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
	  rd.forward(request, response);
	}

}
