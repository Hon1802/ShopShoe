package com.ShoeShopProject.dao.impl;

import java.util.List;

import javax.inject.Inject;

import com.ShoeShopProject.dao.iOrdersDAO;
import com.ShoeShopProject.mapper.OrdersMapper;
import com.ShoeShopProject.model.OrdersModel;
import com.ShoeShopProject.model.ProductModel;
import com.ShoeShopProject.service.iProductService;

public class OrdersDAO extends AbstractDAO<OrdersModel> implements iOrdersDAO {
	@Inject
	private iProductService productService;
	@Override
	public List<OrdersModel> findOrderByUserId(Integer id) {
		String sql="SELECT a.id, c.image_pd, c.name, b.size, c.price, a.qty, b.idProducts, a.product_id, c.price*a.qty as TT"
				+ "  FROM orders a inner join product b "
				+ "inner join products c "
				+ "where iduser=? and a.product_id=b.idProduct and b.idProducts=c.idProducts and status=0";
		return query(sql, new OrdersMapper(), id);
	}

	@Override
	public OrdersModel findOne(Integer id) {
		String sql="Select * from orders where id=?";
		List<OrdersModel>orders= query(sql, new OrdersMapper(), id);
		return orders.isEmpty()? null: orders.get(0);
	}

	@Override
	public Integer insert(OrdersModel orders) {
		String sql="insert into orders(iduser, product_id, qty, note, status) "
				+ "values(?, ?, ?, null, 0)" ;
		ProductModel productModel=productService.findOne(orders.getProductId());
		if (productModel.getQty()>=orders.getQty())
		{
			return insert(sql, orders.getUserId(), orders.getProductId(), orders.getQty());			
		}
		else return null;
	}

	@Override
	public void update(OrdersModel orders) {
		String sql = "update orders set qty=?, status=? where id=?";
		update(sql, orders.getQty(), orders.getStatus(), orders.getOrderId());
		
	}

	@Override
	public void delete(Integer id) {
		String sql="delete from orders where id=?";
		update(sql, id);
		
	}

	@Override
	public List<OrdersModel> findAll() {
		String sql="select * from orders";
		return query(sql, new OrdersMapper());
	}


	@Override
	public List<OrdersModel> getTotalBill(Integer userid) {
		String sql="SELECT a.id, c.image_pd, c.name, b.size, a.qty, b.idProducts, a.product_id, c.price*a.qty as price, sum(c.price*a.qty) as TT"
				+ "		FROM orders a inner join product b "
				+ "		inner join products c "
				+ "		where iduser=? and a.product_id=b.idProduct and b.idProducts=c.idProducts and status=0";
		return query(sql, new OrdersMapper(), userid);
	}

	
		
}
