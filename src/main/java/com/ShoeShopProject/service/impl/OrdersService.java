package com.ShoeShopProject.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.ShoeShopProject.dao.impl.OrdersDAO;
import com.ShoeShopProject.model.OrdersModel;
import com.ShoeShopProject.service.iOrdersService;

public class OrdersService implements  iOrdersService{

	@Inject
	private OrdersDAO ordersDAO;
	@Override
	public List<OrdersModel> findOrderByUserId(Integer id) {		
		return ordersDAO.findOrderByUserId(id);
	}

	@Override
	public OrdersModel findOne(Integer id) {		
		return ordersDAO.findOne(id);
	}

	@Override
	public OrdersModel insert(OrdersModel orders) {
		Integer orderstId=ordersDAO.insert(orders);
		return ordersDAO.findOne(orderstId);
	}

	@Override
	public OrdersModel update(OrdersModel orders) {
		ordersDAO.update(orders);
		return ordersDAO.findOne(orders.getOrderId());
	}

	@Override
	public void delete(Integer id) {
		ordersDAO.delete(id);	
	}

	@Override
	public List<OrdersModel> findAll() {
		return ordersDAO.findAll();
	}

	@Override
	public Integer getTotalBill(Integer userId) {
		List<OrdersModel>list=ordersDAO.getTotalBill(userId);
		return list.isEmpty()? null: list.get(0).getTotalPrice();
	}
	

}
