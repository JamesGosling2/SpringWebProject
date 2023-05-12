package vo;

import java.util.List;
import java.util.UUID;

public class CartVO {
	private String name;
	private int cost;
	private UUID id;
	private List<OrderListVO> cart;
	private boolean isPaid;

	public UUID getId() {
		return id;
	}

	public void setId(UUID id) {
		this.id = id;
	}

	public boolean isPaid() {
		return isPaid;
	}

	public void setPaid(boolean isPaid) {
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
