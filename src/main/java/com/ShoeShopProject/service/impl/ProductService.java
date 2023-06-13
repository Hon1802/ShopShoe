package com.ShoeShopProject.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.ShoeShopProject.dao.iProductDAO;
import com.ShoeShopProject.model.ProductModel;
import com.ShoeShopProject.service.iProductService;

public class ProductService implements iProductService {
	@Inject
	private iProductDAO productDAO;

	@Override
	public List<ProductModel> findProductByProductsId(Integer id) {
		
		return productDAO.findProductByProductsId(id);
	}

	@Override
	public ProductModel Insert(ProductModel product) {
		// TODO Auto-generated method stub
		Integer productId=productDAO.insert(product);
		return productDAO.findOne(productId);
	}

	@Override
	public void update(Integer amount, Integer id) {
		productDAO.updateAmount(amount, id);
	}

	@Override
	public void delete(Integer[] ids) {
		for (Integer id: ids)
		{
			productDAO.delete(id);
		}		
		
	}

	@Override
	public ProductModel findOne(Integer id) {
		return productDAO.findOne(id);
	}

	@Override
	public void deleteByProductsId(Integer id) {
		productDAO.deleteByProductsId(id);		
	}
	

}
