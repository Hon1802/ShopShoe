package com.ShoeShopProject.dao.impl;

import java.util.List;

import com.ShoeShopProject.dao.iProductDAO;
import com.ShoeShopProject.mapper.ProductMapper;
import com.ShoeShopProject.model.ProductModel;

public class ProductDAO  extends AbstractDAO<ProductModel> implements iProductDAO{

	@Override
	public Integer countItemEachProduct(Integer id) {
		String sql= "Select sum(qty) as SL from product where idProducts=? "
				+ "group by idProducts";
		return count(sql, id);
		}

	@Override
	public List<ProductModel> findProductByProductsId(Integer id) {
		String sql= "Select *, count(*) as SL from product where idProducts=? group by idProduct";
		return query(sql, new ProductMapper(), id);
	}

	@Override
	public Integer insert(ProductModel product) {
		String sql="Insert into product(idProducts, size, qty) values(?, ?, ?)";
		return insert(sql,product.getProductsId(), product.getSize(), product.getQty());
	}

	

	@Override
	public void delete(Integer id) {
		String sql="delete from product where idProduct=?";
		update(sql, id);
	}

	@Override
	public void updateAmount(Integer amount, Integer id) {
		String sql="Update product set qty=? where idProduct=?";
		update(sql, amount, id);
		
	}

	@Override
	public ProductModel findOne(Integer id) {
		String sql = "Select *, count(*) as SL from product where idProduct =? group by idProduct";
		List<ProductModel>products=query(sql,new ProductMapper(), id);
		return products.isEmpty()? null: products.get(0);	
	}

	@Override
	public void deleteByProductsId(Integer id) {
		String sql="delete from product where idProducts=?";
		update(sql, id);
	}

}
