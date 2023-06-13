package com.ShoeShopProject.controller.admin;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ShoeShopProject.model.ProductsModel;
import com.ShoeShopProject.constant.SystemConstant;
import com.ShoeShopProject.model.ProductModel;
import com.ShoeShopProject.service.iProductService;
import com.ShoeShopProject.utils.FormUtil;
import com.ShoeShopProject.utils.HttpUtil;
import com.ShoeShopProject.utils.MessageUtil;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet(urlPatterns = { "/admin-stock" })
public class StockController extends HttpServlet {
	/**
	 * 
	 */
	@Inject
	private iProductService productService;
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductModel model = FormUtil.toModel(ProductModel.class, request);
		String view = "";
		if (model.getType().equals(SystemConstant.INSERT)) {

			view = "/views/admin/stock/insert.jsp";

		} 
		
		request.setAttribute(SystemConstant.MODEL, model);
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductModel model = FormUtil.toModel(ProductModel.class, request);	
		if (model.getType().equals(SystemConstant.INSERT)) {
			if (model.getProductsId() != null) {
				if (request.getParameter("size") != null) {
					model.setSize(Integer.parseInt(request.getParameter("size")));
				}
				if (request.getParameter("qty") != null) {
					model.setQty(Integer.parseInt(request.getParameter("qty")));
				}
				productService.Insert(model);
				response.sendRedirect(request.getContextPath()+"/admin-product?type=import&productId="+model.getProductsId()+"&message=insert_success");
			} else {
				System.out.print("null");
			}
		}
		else if (model.getType().equals(SystemConstant.UPDATE_STOCK)) {
			if (model.getProductId() != null) {
				if (request.getParameter("qty") != null) {
					productService.update(Integer.parseInt(request.getParameter("qty")), model.getProductId());
					response.sendRedirect(request.getContextPath()+"/admin-product?type=import&productId="+model.getProductsId()+"&message=update_success");
				}
				else {
					System.out.print("null");
				}
			}
			
		}
		MessageUtil.showMessage(request);
	}
	protected void doDelete(HttpServletRequest request,  HttpServletResponse response) throws ServletException, IOException 
	{	
		ObjectMapper mapper = new ObjectMapper();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		ProductModel productModel =  HttpUtil.of(request.getReader()).toModel(ProductModel.class);
		productService.delete(productModel.getIds());
		mapper.writeValue(response.getOutputStream(), "{}");
	}
}
