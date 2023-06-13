package com.ShoeShopProject.service;

import java.util.List;

import com.ShoeShopProject.model.ProductsModel;
import com.ShoeShopProject.paging.Pageble;


public interface iProductsService {
	List<ProductsModel> findProductById(Integer id);
	ProductsModel Insert(ProductsModel product);
	ProductsModel update(ProductsModel product);
	void delete(Integer[] ids);
	List<ProductsModel> findAll(Pageble pageble);
	Integer getTotalItem();
	ProductsModel findOne(Integer id);
	Integer countItemEachProduct(Integer id);
	List<ProductsModel> findProductsByCategory(Pageble pageble, String cate);
	Integer getTotalItemByCategory(String cate);
	List<ProductsModel> SearchByName(String name);
}
