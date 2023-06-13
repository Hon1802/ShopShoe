package com.ShoeShopProject.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.ShoeShopProject.model.ProductsModel;

public class ProductsMapper implements  RowMapper<ProductsModel>{

	@Override
	public ProductsModel mapRow(ResultSet rs) {
		try {
		    ProductsModel product = new ProductsModel();
			product.setProductId(rs.getInt("idProducts"));
			product.setProductName(rs.getString("name"));
			product.setProductImage(rs.getString("image_pd"));
			product.setPrice(rs.getInt("price"));
			product.setDesciption(rs.getString("description"));
			product.setMadeIn(rs.getString("madein"));
			product.setCreated(rs.getTimestamp("created"));
			product.setManufacturer(rs.getString("manufacturer"));
			product.setView(rs.getInt("vieww"));
			product.setDiscount(rs.getInt("discount"));
			product.setGender(rs.getString("gender"));
			return product;
			}
			catch (SQLException e)
			{
				return null;
			}
	}
	
}
