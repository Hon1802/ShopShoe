package com.ShoeShopProject.dao;

import java.util.List;

import com.ShoeShopProject.model.TransactionModel;
import com.ShoeShopProject.paging.Pageble;

public interface iTransactionDAO extends GenericDAO<TransactionModel> {
	List<TransactionModel> findAll(Pageble pageble);
	Integer getTotalItem();
	void delete(Integer id);
	List<TransactionModel> listRevenueByDate();
	Integer insert(TransactionModel trans);
}
