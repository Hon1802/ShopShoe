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
import com.ShoeShopProject.model.ProductModel;
import com.ShoeShopProject.model.ProductsModel;
import com.ShoeShopProject.paging.PageRequest;
import com.ShoeShopProject.paging.Pageble;
import com.ShoeShopProject.service.iProductService;
import com.ShoeShopProject.service.iProductsService;
import com.ShoeShopProject.sort.Sorter;
import com.ShoeShopProject.utils.FormUtil;
import com.ShoeShopProject.utils.MessageUtil;
@WebServlet(urlPatterns = { "/product" })
public class ProductController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Inject
	private iProductsService productsService;
	@Inject
	private iProductService productService;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductsModel model = FormUtil.toModel(ProductsModel.class, request);
		model.setManufacturer(request.getParameter("manufacturer"));
		String view="";
		if (model.getType().equals(SystemConstant.SHOW) && model.getManufacturer().equals("Nike")) {
			Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem(),
					new Sorter(model.getSortName(), model.getSortBy()));
			model.setList(productsService.findProductsByCategory(pageble, model.getManufacturer()));
			model.setTotalItem(productsService.getTotalItemByCategory(model.getManufacturer()));
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));	
			request.setAttribute(SystemConstant.MODEL, model);
			view="/views/web/show_product_Nike.jsp";
		}
		else if (model.getType().equals(SystemConstant.SHOW) && model.getManufacturer().equals("Adidas"))
		{
			Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem(),
					new Sorter(model.getSortName(), model.getSortBy()));
			model.setList(productsService.findProductsByCategory(pageble, model.getManufacturer()));
			model.setTotalItem(productsService.getTotalItemByCategory(model.getManufacturer()));
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));	
			request.setAttribute(SystemConstant.MODEL, model);
			view="/views/web/show_product_Adidas.jsp";
		}
		else if (model.getType().equals(SystemConstant.SHOW))
		{
			Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem(),
					new Sorter(model.getSortName(), model.getSortBy()));
			model.setList(productsService.findAll(pageble));
			model.setTotalItem(productsService.getTotalItemByCategory(model.getManufacturer()));
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));	
			request.setAttribute(SystemConstant.MODEL, model);
			view="/views/web/shop.jsp";
		}
		else if (model.getType().equals(SystemConstant.DETAIL)){
			model=productsService.findOne(model.getProductId());
			List<ProductModel>listSize=productService.findProductByProductsId(model.getProductId());
			request.setAttribute(SystemConstant.LIST, listSize);
			view="/views/web/product.jsp";
		}
		MessageUtil.showMessage(request);
		request.setAttribute(SystemConstant.MODEL, model);
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
