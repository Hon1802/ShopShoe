package com.ShoeShopProject.dao;

import java.util.List;

import com.ShoeShopProject.model.ProductsModel;
import com.ShoeShopProject.paging.Pageble;

public interface iProductsDAO extends GenericDAO<ProductsModel>{
	List<ProductsModel> findProductById(Integer id); 
	ProductsModel findOne(Integer id);
	Integer insert(ProductsModel product);
	void update(ProductsModel product);
	void delete(Integer id);
	List<ProductsModel>findAll(Pageble pageable);
	Integer getTotalItem();
	List<ProductsModel> findProductByCategory(Pageble pageble, String cate);
	Integer getTotalItemByCategory(String cate);
	List<ProductsModel>SearchByName(String name);
}
