package com.ShoeShopProject.controller.admin;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ShoeShopProject.constant.SystemConstant;
import com.ShoeShopProject.model.TransactionModel;
import com.ShoeShopProject.paging.PageRequest;
import com.ShoeShopProject.paging.Pageble;
import com.ShoeShopProject.service.iTransactionService;
import com.ShoeShopProject.sort.Sorter;
import com.ShoeShopProject.utils.FormUtil;
import com.ShoeShopProject.utils.HttpUtil;
import com.ShoeShopProject.utils.MessageUtil;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet(urlPatterns = { "/admin-trans" })
public class TransactionController extends HttpServlet  {

	/**
	 * 
	 */
	@Inject
	private iTransactionService transService;
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		TransactionModel model = FormUtil.toModel(TransactionModel.class, request);
		String view="";
		if (model.getType().equals(SystemConstant.LIST))
		{
			Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem(),
					new Sorter(model.getSortName(), model.getSortBy()));
			model.setList(transService.findAll(pageble));
			model.setTotalItem(transService.getTotalItem());
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
			view="/views/admin/transaction/list.jsp";
		}
		if (model.getType().equals(SystemConstant.DETAIL)) {
			model.setList(transService.listRevenueByDate());
			view="/views/admin/transaction/revenue.jsp";
		}
		MessageUtil.showMessage(request);
		request.setAttribute(SystemConstant.MODEL, model);
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	protected void doDelete(HttpServletRequest request,  HttpServletResponse response) throws ServletException, IOException 
	{	
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		TransactionModel transModel =  HttpUtil.of(request.getReader()).toModel(TransactionModel.class);
		transService.delete(transModel.getIds());
		mapper.writeValue(response.getOutputStream(), "{}");
	}

}
