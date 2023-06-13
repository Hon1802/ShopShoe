package com.ShoeShopProject.dao;

import java.util.List;

import com.ShoeShopProject.model.ProductModel;

public interface iProductDAO extends GenericDAO<ProductModel> {
	Integer countItemEachProduct(Integer id);
	List<ProductModel> findProductByProductsId(Integer id);
	Integer insert(ProductModel product);
	void updateAmount(Integer amount, Integer id);
	void delete(Integer id);
	void deleteByProductsId(Integer id);
	ProductModel findOne(Integer id);
	
}
