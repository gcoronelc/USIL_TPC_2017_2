package pe.egcc.calculadora.prueba;

import pe.egcc.calculadora.service.CalculaService;

public class Prueba01 {

  public static void main(String[] args) {
    
    // Datos
    int num1 = 51;
    int num2 = 13;
    
    // Proceso
    CalculaService service = new CalculaService();
    int suma = service.sumar(num1, num2);
    int resta = service.restar(num1, num2);
    int prod = service.multiplicar(num1, num2);
    int cociente = service.dividir(num1, num2);
    int resto = service.resto(num1, num2);
    
    // Reporte
    System.out.println("DATOS");
    System.out.println("Num 1: " + num1);
    System.out.println("Num 2: " + num2);
    System.out.println("RESULTADO");
    System.out.println("Suma: " + suma);
    System.out.println("Resta: " + resta);
    System.out.println("Producto: " + prod);
    System.out.println("Cociente: " + cociente);
    System.out.println("Resto: " + resto);
    
  }
  
}
