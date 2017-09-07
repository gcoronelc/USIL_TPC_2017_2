package pe.egcc.renta.model;

public class RentaModel {

	// INPUT
	private String curso; // Nombre del curso
	private double precio; // Precio
	private int horas; // Horas
	private int cantAlu; // Cantidad Alumnos
	private double pagoHora; // Pago por Hora al Profesor

	// OUTPUT
	private double ingresos; // Ingresos
	private double gastos; // Gastos
	private double renta; // Rentabilidad

	public RentaModel() {
	}

	public RentaModel(String curso, double precio, int horas, int cantAlu, double pagoHora) {
		super();
		this.curso = curso;
		this.precio = precio;
		this.horas = horas;
		this.cantAlu = cantAlu;
		this.pagoHora = pagoHora;
	}

	public String getCurso() {
		return curso;
	}

	public void setCurso(String curso) {
		this.curso = curso;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public int getHoras() {
		return horas;
	}

	public void setHoras(int horas) {
		this.horas = horas;
	}

	public int getCantAlu() {
		return cantAlu;
	}

	public void setCantAlu(int cantAlu) {
		this.cantAlu = cantAlu;
	}

	public double getPagoHora() {
		return pagoHora;
	}

	public void setPagoHora(double pagoHora) {
		this.pagoHora = pagoHora;
	}

	public double getIngresos() {
		return ingresos;
	}

	public void setIngresos(double ingresos) {
		this.ingresos = ingresos;
	}

	public double getGastos() {
		return gastos;
	}

	public void setGastos(double gastos) {
		this.gastos = gastos;
	}

	public double getRenta() {
		return renta;
	}

	public void setRenta(double renta) {
		this.renta = renta;
	}

}
