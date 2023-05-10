package vo;

import java.sql.Timestamp;

public class OrderListVO {
	private int orderlist_idx,orderlist_status,product_idx,product_amount,user_idx,product_price;
	private String orderlist_addr,orderlist_phonenumber;
	private Timestamp orderlist_date;
	public String getOrderlist_phonenumber() {
		return orderlist_phonenumber;
	}
	public void setOrderlist_phonenumber(String orderlist_phonenumber) {
		this.orderlist_phonenumber = orderlist_phonenumber;
	}
	
	public Timestamp getOrderlist_date() {
		return orderlist_date;
	}
	public void setOrderlist_date(Timestamp orderlist_date) {
		this.orderlist_date = orderlist_date;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	
	public int getOrderlist_idx() {
		return orderlist_idx;
	}
	public void setOrderlist_idx(int orderlist_idx) {
		this.orderlist_idx = orderlist_idx;
	}
	public int getOrderlist_status() {
		return orderlist_status;
	}
	public void setOrderlist_status(int orderlist_status) {
		this.orderlist_status = orderlist_status;
	}
	public int getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}
	public int getProduct_amount() {
		return product_amount;
	}
	public void setProduct_amount(int product_amount) {
		this.product_amount = product_amount;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getOrderlist_addr() {
		return orderlist_addr;
	}
	public void setOrderlist_addr(String orderlist_addr) {
		this.orderlist_addr = orderlist_addr;
	}
	

}
