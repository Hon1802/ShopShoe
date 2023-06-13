package com.ShoeShopProject.model;

import java.sql.Timestamp;
import java.util.List;

public class ProductsModel extends AbstractModel<ProductsModel> {
	private Integer productId;
	private String manufacturer;
	private Integer view;
	private Integer discount;
	private String productImage="";
	private Timestamp created;
	private String productName;
	private Integer price;
	private String madeIn;
	private String desciption;
	private String gender;
	private String genders[]={"Male", "Female"};
	private String manufacturers[]= {"Nike", "Adidas"};
	private String countries[]= {"Viet Nam", "Japan", "China", "Indonesia", "India", "Korea"};

	public String[] getCountries() {
		return countries;
	}
	public void setCountries(String[] countries) {
		this.countries = countries;
	}
	public String[] getGenders() {
		return genders;
	}
	public void setGenders(String[] genders) {
		this.genders = genders;
	}
	public String[] getManufacturers() {
		return manufacturers;
	}
	public void setManufacturers(String[] manufacturers) {
		this.manufacturers = manufacturers;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public Integer getView() {
		return view;
	}
	public void setView(Integer view) {
		this.view = view;
	}
	public Integer getDiscount() {
		return discount;
	}
	public void setDiscount(Integer discount) {
		this.discount = discount;
	}
	public String getProductImage() {
		return productImage;
	}
	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}
	public Timestamp getCreated() {
		return created;
	}
	public void setCreated(Timestamp created) {
		this.created = created;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getMadeIn() {
		return madeIn;
	}
	public void setMadeIn(String madeIn) {
		this.madeIn = madeIn;
	}
	public String getDesciption() {
		return desciption;
	}
	public void setDesciption(String desciption) {
		this.desciption = desciption;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
}
