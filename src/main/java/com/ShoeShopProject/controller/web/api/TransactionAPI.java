package com.ShoeShopProject.controller.web.api;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ShoeShopProject.model.OrdersModel;
import com.ShoeShopProject.model.ProductModel;
import com.ShoeShopProject.model.TransactionModel;
import com.ShoeShopProject.service.iOrdersService;
import com.ShoeShopProject.service.iTransactionService;
import com.ShoeShopProject.utils.HttpUtil;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet(urlPatterns = { "/api-web-trans" })
public class TransactionAPI  extends HttpServlet  {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Inject
	private iOrdersService ordersService;
	@Inject
	private iTransactionService transService;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			ObjectMapper mapper = new ObjectMapper();
			request.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			TransactionModel transModel = HttpUtil.of(request.getReader()).toModel(TransactionModel.class);
			List<OrdersModel> orders=ordersService.findOrderByUserId(transModel.getUserId());
			transModel.setTotalBill(ordersService.getTotalBill(transModel.getUserId()));
			transService.insert(orders, transModel);
			mapper.writeValue(response.getOutputStream(), transModel);
				
	}
}
