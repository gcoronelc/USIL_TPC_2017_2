package pe.egcc.carrito.model;

import java.util.ArrayList;
import java.util.List;

public class Carrito {

	private List<Item> lista;

	private double importe;
	private double impuesto;
	private double total;

	public Carrito() {
		lista = new ArrayList<>();
	}

	public void agregar(Item item) {
		lista.add(item);
	}

	public List<Item> getLista() {
		return lista;
	}

	public double getImporte() {
		return importe;
	}

	public double getImpuesto() {
		return impuesto;
	}

	public double getTotal() {
		return total;
	}

}
