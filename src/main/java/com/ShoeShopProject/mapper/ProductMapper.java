package com.ShoeShopProject.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.ShoeShopProject.model.ProductModel;

public class ProductMapper implements RowMapper<ProductModel> {

	@Override
	public ProductModel mapRow(ResultSet rs) {
		try {
			ProductModel product = new ProductModel();
			product.setProductId(rs.getInt("idProduct"));
			product.setSize(rs.getInt("size"));
			product.setProductsId(rs.getInt("idProducts"));
			product.setQty(rs.getInt("qty"));
			product.setCount(rs.getInt("SL"));
			return product;
		} catch (SQLException e) {
			return null;
		}
	}
	

}
