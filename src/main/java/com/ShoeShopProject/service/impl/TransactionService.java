package com.ShoeShopProject.service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.ShoeShopProject.dao.iTransactionDAO;
import com.ShoeShopProject.model.OrdersModel;
import com.ShoeShopProject.model.TransactionModel;
import com.ShoeShopProject.paging.Pageble;
import com.ShoeShopProject.service.iTransactionService;

public class TransactionService implements iTransactionService{

	@Inject
	private iTransactionDAO transDAO;
	@Override
	public List<TransactionModel> findAll(Pageble pageble) {
		
		return transDAO.findAll(pageble);
	}
	
	@Override
	public Integer getTotalItem() {
		return transDAO.getTotalItem();
	}
	
	@Override
	public void delete(Integer[] ids) {
		for (Integer id: ids)
			{
				transDAO.delete(id);
			}
			
	}

	@Override
	public List<TransactionModel> listRevenueByDate() {
		return transDAO.listRevenueByDate();
	}

	@Override
	public void insert(List<OrdersModel> list, TransactionModel transModel) {
		for (OrdersModel model: list) {
			transModel.setOrderId(model.getOrderId());
			transModel.setAmount(model.getQty());
			transModel.setPayment("PayPal");
			transModel.setPaymentInfo("sb-dv8zd22183004@personal.example.com");			
			transModel.setCreated(new Timestamp(System.currentTimeMillis()));
			transDAO.insert(transModel);
		}
		
	}
		

}
