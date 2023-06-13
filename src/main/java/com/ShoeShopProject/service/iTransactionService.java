package com.ShoeShopProject.service;

import java.util.List;

import com.ShoeShopProject.model.OrdersModel;
import com.ShoeShopProject.model.TransactionModel;
import com.ShoeShopProject.paging.Pageble;

public interface iTransactionService {
	List<TransactionModel> findAll(Pageble pageble);
	Integer getTotalItem();
	void delete(Integer[] ids);
	List<TransactionModel> listRevenueByDate();
	void insert(List<OrdersModel>list, TransactionModel transModel);
}
