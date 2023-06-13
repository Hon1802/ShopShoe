package com.ShoeShopProject.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.ShoeShopProject.model.OrdersModel;


public class OrdersMapper implements  RowMapper<OrdersModel> {

	@Override
	public OrdersModel mapRow(ResultSet rs) {
		try {
		    OrdersModel order = new OrdersModel();
		    order.setQty(rs.getInt("a.qty"));
		    order.setOrderId(rs.getInt("a.id"));
			order.setProductId(rs.getInt("a.product_id"));
			order.setProductName(rs.getString("c.name"));
			order.setSize(rs.getInt("b.size"));
			order.setPrice(rs.getInt("price"));
			order.setProductsId(rs.getInt("b.idProducts"));
			order.setProductImage(rs.getString("c.image_pd"));
			order.setTotalPrice(rs.getInt("TT"));
			return order;
			}
			catch (SQLException e)
			{
				return null;
			}
	}
}
