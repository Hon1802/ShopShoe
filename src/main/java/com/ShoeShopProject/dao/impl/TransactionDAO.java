package com.ShoeShopProject.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.ShoeShopProject.dao.iTransactionDAO;
import com.ShoeShopProject.mapper.TransactionMapper;
import com.ShoeShopProject.model.TransactionModel;
import com.ShoeShopProject.paging.Pageble;

public class TransactionDAO extends AbstractDAO<TransactionModel> implements iTransactionDAO {

	@Override
	public List<TransactionModel> findAll(Pageble pageble) {
		String sql="Select * from transactions ";
		if (pageble.getSorter() != null && StringUtils.isNotBlank(pageble.getSorter().getSortName()) && StringUtils.isNotBlank(pageble.getSorter().getSortBy())) {
			sql+= " ORDER BY "+pageble.getSorter().getSortName()+" "+pageble.getSorter().getSortBy()+"";
		}
		if (pageble.getOffset() != null && pageble.getLimit() != null) {
			sql+=" LIMIT "+pageble.getOffset()+", "+pageble.getLimit()+"";
		}
		return query(sql, new TransactionMapper());
	}

	@Override
	public Integer getTotalItem() {
		String sql="Select count(*) from transactions";
		return count(sql);
	}

	@Override
	public void delete(Integer id) {
		String sql="delete from transactions where  id=?";
		update(sql,id);
		
	}

	@Override
	public List<TransactionModel> listRevenueByDate() {
		String sql="Select *, created, sum(totalBill) as totalBill from transactions group by created;";
		return query(sql, new TransactionMapper());
	}

	@Override
	public Integer insert(TransactionModel trans) {
		String sql="insert into transactions(idorder, user_id, user_name, user_phone, "
				+ "user_email, amount, payment, payment_infor, created, totalBill) values(?,?,?,?,?,?,?,?,?,?)";
		return insert(sql,trans.getOrderId(), trans.getUserId(), trans.getUserName(), trans.getUserPhone(), 
				trans.getUserMail(), trans.getAmount(), trans.getPayment(), trans.getPaymentInfo(), trans.getCreated(), trans.getTotalBill());

	}

}
