package com.ShoeShopProject.dao;

import java.util.List;

import com.ShoeShopProject.model.OrdersModel;
import com.ShoeShopProject.model.ProductsModel;
import com.ShoeShopProject.paging.Pageble;

public interface iOrdersDAO extends GenericDAO<OrdersModel> {
	List<OrdersModel> findOrderByUserId(Integer id);
	OrdersModel findOne(Integer id);
	Integer insert(OrdersModel orders);
	void update(OrdersModel orders);
	void delete(Integer id);
	List<OrdersModel>findAll();
	List<OrdersModel> getTotalBill(Integer userid);
}
