package pe.egcc.carrito.model;

public class Item {

	private int id;
	private String producto;
	private double precio;
	private int cant;
	private double subtotal;

	public Item() {
	}

	public Item(String producto, double precio, int cant) {
		super();
		this.producto = producto;
		this.precio = precio;
		this.cant = cant;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProducto() {
		return producto;
	}

	public void setProducto(String producto) {
		this.producto = producto;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public int getCant() {
		return cant;
	}

	public void setCant(int cant) {
		this.cant = cant;
	}

	public double getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}

}
