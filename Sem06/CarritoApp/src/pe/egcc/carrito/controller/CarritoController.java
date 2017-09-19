package pe.egcc.carrito.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pe.egcc.carrito.model.Carrito;
import pe.egcc.carrito.model.Item;

@WebServlet(value={"/Agregar", "/Otros"})
public class CarritoController extends HttpServlet{

  private static final long serialVersionUID = 1L;

  @Override
  protected void service(HttpServletRequest request, 
      HttpServletResponse response) 
      throws ServletException, IOException {
   
    String path = request.getServletPath();
    
    switch (path) {
    case "/Agregar":
      agregar(request, response);
      break;
    }
    
  }

  private void agregar(HttpServletRequest request, 
      HttpServletResponse response) 
      throws ServletException, IOException {
    // Datos
    String producto = request.getParameter("producto");
    double precio = Double.parseDouble(request.getParameter("precio"));
    int cant = Integer.parseInt(request.getParameter("cant"));
    // Proceso
    Carrito carrito = dameMiCarrito(request);
    Item item = new Item(producto, precio, cant);
    carrito.agregar(item);
    request.setAttribute("mensaje", "Proceso ok.");
    // Forward
    forward(request, response, "agregar.jsp");
  }

  private void forward(HttpServletRequest request, 
      HttpServletResponse response, String destino) 
      throws ServletException, IOException {
    RequestDispatcher rd;
    rd = request.getRequestDispatcher(destino);
    rd.forward(request, response);
  }

  private Carrito dameMiCarrito(HttpServletRequest request) {
    HttpSession session = request.getSession();
    if( session.getAttribute("carrito") == null ){
      session.setAttribute("carrito",new Carrito());
    }
    Carrito carrito = (Carrito) session.getAttribute("carrito");
    return carrito;
  }
  
  
  
  
}
