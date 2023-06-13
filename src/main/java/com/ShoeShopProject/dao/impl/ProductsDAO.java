package com.ShoeShopProject.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.ShoeShopProject.dao.iProductsDAO;
import com.ShoeShopProject.mapper.ProductsMapper;
import com.ShoeShopProject.model.ProductsModel;
import com.ShoeShopProject.paging.Pageble;


public class ProductsDAO extends AbstractDAO<ProductsModel> implements iProductsDAO {

	@Override
	public List<ProductsModel> findProductById(Integer id) {
		String sql = "Select * from products where idProducts =?";
		return query(sql,new ProductsMapper(), id);	
	}

	@Override
	public ProductsModel findOne(Integer id) {
		String sql = "Select * from products where idProducts =?";
		List<ProductsModel>products=query(sql,new ProductsMapper(), id);
		return products.isEmpty()? null: products.get(0);	
	}

	@Override
	public Integer insert(ProductsModel product) {
		StringBuilder sql=new StringBuilder("Insert into products(manufacturer, vieww, "
				+ "discount, image_pd, created, name, price, madein, description, gender)"
				+ " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		return insert(sql.toString() ,product.getManufacturer(), product.getView(), product.getDiscount(),
				product.getProductImage(), product.getCreated() ,product.getProductName(), product.getPrice(),
				product.getMadeIn(), product.getDesciption(), product.getGender());
	}

	@Override
	public void update(ProductsModel product) {
		String sql = "Update products set manufacturer=?, vieww=?, "
				+ "discount=?, image_pd=?, created=?, name=?, price=?"
				+ ", madein=?, description=?, gender=? where idProducts=?";
		update(sql, product.getManufacturer(), product.getView(), product.getDiscount(),
				product.getProductImage(), product.getCreated(), product.getProductName(), product.getPrice(),
				product.getMadeIn(), product.getDesciption(), product.getGender(), product.getProductId());
		
		
	}

	@Override
	public void delete(Integer id) {
		String sql="Delete from products where idProducts=?";
		update(sql, id);
		
	}

	@Override
	public List<ProductsModel> findAll(Pageble pageble) {
		String sql="Select * from products ";
		if (pageble.getSorter() != null && StringUtils.isNotBlank(pageble.getSorter().getSortName()) && StringUtils.isNotBlank(pageble.getSorter().getSortBy())) {
			sql+= " ORDER BY "+pageble.getSorter().getSortName()+" "+pageble.getSorter().getSortBy()+"";
		}
		if (pageble.getOffset() != null && pageble.getLimit() != null) {
			sql+=" LIMIT "+pageble.getOffset()+", "+pageble.getLimit()+"";
		}
		return query(sql.toString(), new ProductsMapper());
	}

	@Override
	public Integer getTotalItem() {
		String sql="Select count(*) from products";
		return count(sql);
	}

	@Override
	public List<ProductsModel> findProductByCategory(Pageble pageble, String cate) {
		String sql="Select * from products where manufacturer=? ";
		if (pageble.getSorter() != null && StringUtils.isNotBlank(pageble.getSorter().getSortName()) && StringUtils.isNotBlank(pageble.getSorter().getSortBy())) {
			sql+= " ORDER BY "+pageble.getSorter().getSortName()+" "+pageble.getSorter().getSortBy()+"";
		}
		if (pageble.getOffset() != null && pageble.getLimit() != null) {
			sql+=" LIMIT "+pageble.getOffset()+", "+pageble.getLimit()+"";
		}
		return query(sql.toString(), new ProductsMapper(), cate);
	}

	@Override
	public Integer getTotalItemByCategory(String cate) {
		String sql="Select count(*) from products where manufacturer=? ";
		return count(sql, cate);
	}

	@Override
	public List<ProductsModel> SearchByName(String name) {
		String sql="select * from products where name like ? ";
		return query(sql, new ProductsMapper(), "%"+name+"%");
	}

	
	
}
