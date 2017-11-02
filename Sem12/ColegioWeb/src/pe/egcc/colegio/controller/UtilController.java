package pe.egcc.colegio.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public final class UtilController {
  
  private UtilController() {
  }
  
  public static void forward( HttpServletRequest request,
      HttpServletResponse response, String target) 
          throws ServletException, IOException{
    
    RequestDispatcher rd = request.getRequestDispatcher(target);
    rd.forward(request, response);
    
  }

  public static void setSession(
      HttpServletRequest request, String key, Object object) {
    
    HttpSession session = request.getSession();
    session.setAttribute(key, object);
    
  }

  public static void resetSession(HttpServletRequest request) {
    
    
    HttpSession session = request.getSession();
    session.invalidate();
    
  }
  
}
