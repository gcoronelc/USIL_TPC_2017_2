package pe.egcc.carrito.model;

import java.text.DecimalFormat;
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
	  // Calcular subtotal
	  item.setSubtotal(item.getPrecio() * item.getCant());
	  // Agregar a la lista
		lista.add(item);
		// Actualizar datos
		actualizarId();
		actualizarCarrito();
	}

	private void actualizarCarrito() {
    total = 0.0;
    lista.stream().forEach(item -> total += item.getSubtotal() );
    total = dosDec(total);
    importe = dosDec( total / 1.18 );
    impuesto = dosDec( total - importe );
  }

  private void actualizarId() {
	  int id = 0;
    for(Item item: lista){
      item.setId(++id);
    }
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
	
	private double dosDec(double numero){
	  numero *= 100;
	  numero = Math.round(numero);
	  numero /= 100;
	  return numero;
	}

  public void eliminar(int id) {
    // Proceso que elimina el item
    for(Item item: lista){
      if(item.getId() == id){
        lista.remove(item);
        break;
      }
    }
    // Actualizar el carrito
    actualizarId();
    actualizarCarrito();
  }

}
