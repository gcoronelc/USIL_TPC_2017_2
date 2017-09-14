package pe.egcc.carrito.prueba;

import pe.egcc.carrito.model.Carrito;
import pe.egcc.carrito.model.Item;

public class Prueba01 {

	public static void main(String[] args) {
	
		// Crear el carrito
		Carrito carrito = new Carrito();
		carrito.agregar(new Item("Producto 1", 40, 3));
		carrito.agregar(new Item("Producto 2", 50, 4));
		carrito.agregar(new Item("Producto 3", 60, 6));
		
		
		// Mostrar Carrito
		for(Item item: carrito.getLista()){
			System.out.println(item.getId() 
					+ " - " + item.getProducto() 
					+ " - " + item.getPrecio() 
					+ " - " + item.getCant() 
					+ " - " + item.getSubtotal());
		}
		
		System.out.println("Importe: " + carrito.getImporte());
		System.out.println("Impuesto: " + carrito.getImpuesto());
		System.out.println("Total: " + carrito.getTotal());
		
	}
	
}
