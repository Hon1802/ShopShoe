package com.ShoeShopProject.controller.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ShoeShopProject.model.ProductsModel;
import com.ShoeShopProject.service.iProductsService;
@WebServlet(urlPatterns = { "/search" })
public class SearchController extends HttpServlet {

	/**
	 * 
	 */
	@Inject
	private iProductsService productsService;
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
	    request.setCharacterEncoding("UTF-8");
		String txtSearch=request.getParameter("txt");
		List<ProductsModel> list=productsService.SearchByName(txtSearch);
		PrintWriter out=response.getWriter();
		for (ProductsModel item: list) {
			out.println("<h1 id=\"output\"></h1>\r\n"
					+ "	 <script src=\"functem.js\"></script>"
					+"<li>\r\n"
					+ "				<div>\r\n"
					+ "					<div class=\"product-top\">\r\n"					
					+ "					<a href=\"/ShoeShop/product?type=detail&productId="+item.getProductId()+"\" class=\'product-thumb\'> <img\r\n"
					+ "					src=\"/ShoeShop/imgShoes/"+item.getProductImage()+" \""
					+ "					alt=\"sp1\">\r\n"
					+ "					</a>\r\n"
					+ "					<!--buy now-->\r\n"
					+ "					<a href=\"/ShoeShop/product?type=detail&productId="+item.getProductId()+"\" class=\"buy-now\"> Buy now </a>\r\n"
					+ "					</div>\r\n"
					+ "					<div class=\"product-name\">"+item.getProductName()+"</div>\r\n"
					+ "					<div class=\"product-price\" id=\"price\">"+item.getPrice()+"</div>\r\n"
					+ "					</div>\r\n" 								
					+ "	</li>");
		}
		
	}	

}
