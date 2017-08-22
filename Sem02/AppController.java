package pe.egcc.promapp.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pe.egcc.promapp.model.PromModel;
import pe.egcc.promapp.service.PromService;

@WebServlet(name = "AppController", 
        urlPatterns = {"/AppController","/Panchito","SpringMaster"})
public class AppController extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest request, 
          HttpServletResponse response) throws ServletException, IOException {
  
    // Datos
    PromModel bean = new PromModel();
    bean.setPrct1(Integer.parseInt(request.getParameter("pc1")));
    bean.setPrct2(Integer.parseInt(request.getParameter("pc2")));
    bean.setPrct3(Integer.parseInt(request.getParameter("pc3")));
    bean.setEp(Integer.parseInt(request.getParameter("ep")));
    bean.setEf(Integer.parseInt(request.getParameter("ef")));
    
    // Proceso
    PromService service = new PromService();
    bean = service.procesar(bean);
    
    // Forward
    request.setAttribute("bean", bean);
    RequestDispatcher rd;
    rd = request.getRequestDispatcher("reporte.jsp");
    rd.forward(request, response);
    
  }

  
  
}
