package vo;

import java.util.Comparator;
import java.util.List;

public class CartVO {
	
	private String name, id, tid;
	private int cost;
	private int orderlist_status;
	private List<OrderListVO> cart;

	public int getOrderlist_status() {
		return orderlist_status;
	}

	public void setOrderlist_status(int orderlist_status) {
		this.orderlist_status = orderlist_status;
	}
	
	public void sortCart(Comparator<OrderListVO> comparator) {
		cart.sort(comparator);
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

}
