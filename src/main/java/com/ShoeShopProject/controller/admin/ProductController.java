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
import com.ShoeShopProject.model.ProductModel;
import com.ShoeShopProject.model.ProductsModel;
import com.ShoeShopProject.paging.PageRequest;
import com.ShoeShopProject.paging.Pageble;
import com.ShoeShopProject.service.iProductService;
import com.ShoeShopProject.service.iProductsService;
import com.ShoeShopProject.sort.Sorter;
import com.ShoeShopProject.utils.FormUtil;
import com.ShoeShopProject.utils.MessageUtil;


@WebServlet(urlPatterns = { "/admin-product" })
public class ProductController extends HttpServlet {

	/**
	 * 
	 */
	@Inject
	private iProductsService productsService;
	@Inject
	private iProductService productService;
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductsModel model = FormUtil.toModel(ProductsModel.class, request);
		String view="";
		if (model.getType().equals(SystemConstant.LIST)) {
			Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem(),
					new Sorter(model.getSortName(), model.getSortBy()));
			model.setList(productsService.findAll(pageble));
			model.setTotalItem(productsService.getTotalItem());
			model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
			request.setAttribute(SystemConstant.MODEL, model);			
			view="/views/admin/product/list.jsp";
		}
		else if(model.getType().equals(SystemConstant.EDIT)) {
			if (model.getProductId()!=null)
			{	
				model=productsService.findOne(model.getProductId());
			}
			
			String genders[]=model.getGenders();
			String categories[]=model.getManufacturers();
			String countries[]=model.getCountries();
			request.setAttribute("countries", countries);
			request.setAttribute("manufacturers", categories);
			request.setAttribute("genders", genders);
			view="/views/admin/product/edit.jsp";
		}
		else if(model.getType().equals(SystemConstant.IMPORT)) {
			if (model.getProductId()!=null)
			{	
				ProductsModel model2=productsService.findOne(model.getProductId());
				request.setAttribute("model2", model2);
				request.setAttribute("itemAmount",productsService.countItemEachProduct(model.getProductId()));
				request.setAttribute(SystemConstant.LIST, productService.findProductByProductsId(model.getProductId()));
			}
			view="/views/admin/product/stock.jsp";
		}
		else if(model.getType().equals(SystemConstant.UPLOAD))
		{
			if (model.getProductId()!=null)
			{	
				model=productsService.findOne(model.getProductId());
			}
			view="/views/admin/product/uploadimage.jsp";
			view="/admin-upload?type=upload&productId="+model.getProductId();
		}
		else if(model.getType().equals(SystemConstant.UPDATE_STOCK))
		{	
			ProductModel model2 = FormUtil.toModel(ProductModel.class, request);
			model2=productService.findOne(model2.getProductId());
			request.setAttribute("model2", model2);
			view="/views/admin/stock/edit.jsp";
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
