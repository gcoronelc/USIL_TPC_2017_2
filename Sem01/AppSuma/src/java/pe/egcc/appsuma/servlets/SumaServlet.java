package pe.egcc.appsuma.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pe.egcc.appsuma.service.MateService;

/**
 *
 * @author Gustavo Coronel
 */
@WebServlet(name = "SumaServlet", urlPatterns = {"/SumaServlet", "/Panchito"})
public class SumaServlet extends HttpServlet {

  @Override
  protected void service(HttpServletRequest request, 
          HttpServletResponse response) throws ServletException, IOException {

    // Datos
    int n1 = Integer.parseInt( request.getParameter("num1") );
    int n2 = Integer.parseInt( request.getParameter("num2") );
    
    // Proceso
    MateService service = new MateService();
    int suma = service.sumar(n1, n2);
    
    // Reporte
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    out.println("<html>");
    out.println("<head>");
    out.println("<title>SUMA</title>");
    out.println("</head>");
    out.println("<body>");
    out.println("<h1>SUMA APP</p>");
    out.println("<p>Número 1: " + n1 + "</p>");
    out.println("<p>Número 2: " + n2 + "</p>");
    out.println("<p>Suma: " + suma + "</p>");
    out.println("<p><a href='index.html'>Retornar</a></p>");
    out.println("</body>");
    out.println("</html>");
    out.flush();
    out.close();
        
  }


}
