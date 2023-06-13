package com.ShoeShopProject.service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.ShoeShopProject.dao.iProductDAO;
import com.ShoeShopProject.dao.iProductsDAO;
import com.ShoeShopProject.model.ProductsModel;
import com.ShoeShopProject.paging.Pageble;
import com.ShoeShopProject.service.iProductsService;

public class ProductsService implements iProductsService{
	@Inject
	private iProductsDAO productsDAO;
	
	@Inject
	private iProductDAO productDAO;
	@Override
	public List<ProductsModel> findProductById(Integer id) {
		return productsDAO.findProductById(id);
	}

	@Override
	public ProductsModel Insert(ProductsModel product) {
		product.setCreated(new Timestamp(System.currentTimeMillis()));
		product.setView(0);
		Integer productId=productsDAO.insert(product);
		return productsDAO.findOne(productId);
	}

	@Override
	public ProductsModel update(ProductsModel product) {
		ProductsModel oldproduct=productsDAO.findOne(product.getProductId());
		product.setCreated(oldproduct.getCreated());
		product.setView(oldproduct.getView());
		productsDAO.update(product);
		return productsDAO.findOne(product.getProductId());
	}

	@Override
	public void delete(Integer[] ids) {
		for (Integer id: ids)
		{
			productDAO.deleteByProductsId(id);
			productsDAO.delete(id);
		}
		
	}

	@Override
	public List<ProductsModel> findAll(Pageble pageble) {
		return productsDAO.findAll(pageble);
	}

	@Override
	public Integer getTotalItem() {
		return productsDAO.getTotalItem();
	}

	@Override
	public ProductsModel findOne(Integer id) {
		return productsDAO.findOne(id);
	}

	@Override
	public Integer countItemEachProduct(Integer id) {
		return productDAO.countItemEachProduct(id);
	}

	@Override
	public List<ProductsModel> findProductsByCategory(Pageble pageble, String cate) {
		return productsDAO.findProductByCategory(pageble, cate);
	}

	@Override
	public Integer getTotalItemByCategory(String cate) {
		return productsDAO.getTotalItemByCategory(cate);
	}

	@Override
	public List<ProductsModel> SearchByName(String name) {
		return productsDAO.SearchByName(name);
	}

}
