package almadelsaber.pruebas;

import almadelsaber.service.RegistrarAlumno;

public class Prueba03 {
	public static void main(String[] args) {
		//Datos
		String Apellido = "Mercati";
		String Nombre = "Gabriel";
		String DNI = "76614705";
		String Direccion = "su casa";
		String Telefono = "967352781";
		String Email = "gabriel@hotmail.com";
		
		//Proceso
		RegistrarAlumno service = new RegistrarAlumno();
		int codalu = service.registrarAlu(Apellido, Nombre, DNI, Direccion, Telefono, Email);
		
		//Reporte
		System.out.println("Codigo de Alumno: " + codalu);
		
	}

}
