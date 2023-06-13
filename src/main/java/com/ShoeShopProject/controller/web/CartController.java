package com.ShoeShopProject.controller.web;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ShoeShopProject.constant.SystemConstant;
import com.ShoeShopProject.model.OrdersModel;
import com.ShoeShopProject.service.iOrdersService;
import com.ShoeShopProject.utils.FormUtil;

@WebServlet(urlPatterns = { "/cart" })
public class CartController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Inject
	private iOrdersService ordersService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		OrdersModel model = FormUtil.toModel(OrdersModel.class, request);
		String view = "";
		if (model.getType().equals(SystemConstant.SHOW)) {
			List<OrdersModel> orders = ordersService.findOrderByUserId(model.getUserId());
			request.setAttribute(SystemConstant.LIST, orders);
			view = "views/web/cart.jsp";
		}
		else if (model.getType().equals(SystemConstant.EDIT))
		{
			String orderId=request.getParameter("orderId");
			ordersService.delete(Integer.parseInt(orderId));
			view="/cart?type=show&userId="+model.getUserId();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
}
