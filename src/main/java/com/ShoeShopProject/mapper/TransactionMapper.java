package com.ShoeShopProject.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.ShoeShopProject.model.ProductsModel;
import com.ShoeShopProject.model.TransactionModel;
import com.ShoeShopProject.model.UserModel;

public class TransactionMapper implements RowMapper<TransactionModel> {

	@Override
	public TransactionModel mapRow(ResultSet rs) {
		try {
		    TransactionModel trans = new TransactionModel();
		    trans.setTransId(rs.getInt("id"));
		    trans.setOrderId(rs.getInt("idorder"));
		    trans.setUserId(rs.getInt("user_id"));
		    trans.setUserName(rs.getString("user_name"));
		    trans.setUserPhone(rs.getString("user_phone"));
		    trans.setUserMail(rs.getString("user_email"));
		    trans.setAmount(rs.getInt("amount"));
		    trans.setPayment(rs.getString("payment"));
		    trans.setPaymentInfo(rs.getString("payment_infor"));
		    trans.setMessage(rs.getString("message"));
		    trans.setCreated(rs.getTimestamp("created"));
		    trans.setTotalBill(rs.getInt("totalBill"));
			return trans;
			}
			catch (SQLException e)
			{
				return null;
			}
	}

}
