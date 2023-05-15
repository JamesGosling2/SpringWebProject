package vo;

import java.util.ArrayList;

public class SearchVO {

	private ArrayList<String> product_type, product_alcohol_degree, product_price, product_sweet_rating,
			product_sourish_rating, product_sparkling_rating, product_bodytaste_rating;

	private String producer_name;

	private String term;

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public String getProducer_name() {
		return producer_name;
	}

	public void setProducer_name(String producer_name) {
		this.producer_name = producer_name;
	}

	public ArrayList<String> getProduct_type() {
		return product_type;
	}

	public void setProduct_type(ArrayList<String> product_type) {
		this.product_type = product_type;
	}

	public ArrayList<String> getProduct_alcohol_degree() {
		return product_alcohol_degree;
	}

	public void setProduct_alcohol_degree(ArrayList<String> product_alcohol_degree) {
		this.product_alcohol_degree = product_alcohol_degree;
	}

	public ArrayList<String> getProduct_price() {
		return product_price;
	}

	public void setProduct_price(ArrayList<String> product_price) {
		this.product_price = product_price;
	}

	public ArrayList<String> getProduct_sweet_rating() {
		return product_sweet_rating;
	}

	public void setProduct_sweet_rating(ArrayList<String> product_sweet_rating) {
		this.product_sweet_rating = product_sweet_rating;
	}

	public ArrayList<String> getProduct_sourish_rating() {
		return product_sourish_rating;
	}

	public void setProduct_sourish_rating(ArrayList<String> product_sourish_rating) {
		this.product_sourish_rating = product_sourish_rating;
	}

	public ArrayList<String> getProduct_bodytaste_rating() {
		return product_bodytaste_rating;
	}

	public void setProduct_bodytaste_rating(ArrayList<String> product_bodytaste_rating) {
		this.product_bodytaste_rating = product_bodytaste_rating;
	}

	public ArrayList<String> getProduct_sparkling_rating() {
		return product_sparkling_rating;
	}

	public void setProduct_sparkling_rating(ArrayList<String> product_sparkling_rating) {
		this.product_sparkling_rating = product_sparkling_rating;
	}

}
