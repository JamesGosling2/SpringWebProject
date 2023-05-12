package vo;

import java.util.Comparator;
import java.util.List;

public class CartVO {
	
	private String name, id;
	private int cost;
	private boolean isPaid = false;
	private List<OrderListVO> cart;
	
	public void sortCart(Comparator<OrderListVO> comparator) {
		cart.sort(comparator);
	}
	
	public void setPaid(boolean isPaid) {
		this.isPaid = isPaid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public boolean getIsPaid() {
		return isPaid;
	}

	public void setIsPaid(boolean isPaid) {
		this.isPaid = isPaid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public List<OrderListVO> getCart() {
		return cart;
	}

	public void setCart(List<OrderListVO> cart) {
		this.cart = cart;
	}

}
