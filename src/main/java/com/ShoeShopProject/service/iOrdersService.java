package com.ShoeShopProject.service;

import java.util.List;

import com.ShoeShopProject.model.OrdersModel;

public interface iOrdersService  {
	List<OrdersModel> findOrderByUserId(Integer id);
	 OrdersModel findOne(Integer id);
	 OrdersModel insert(OrdersModel orders);
	 OrdersModel update(OrdersModel orders);
	 void delete(Integer id);
	 List<OrdersModel> findAll();
	 Integer getTotalBill(Integer userId);
}
