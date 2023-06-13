package com.ShoeShopProject.controller.web;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDate;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ShoeShopProject.model.UserModel;
import com.ShoeShopProject.service.iUserService;

@WebServlet(urlPatterns = { "/views/web/user" })
public class UserController extends HttpServlet {
	/**
	 * 
	 */
	@Inject 
	private iUserService userService;
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request,  HttpServletResponse response) throws ServletException, IOException 
	{ 	
		
		RequestDispatcher rd=request.getRequestDispatcher("/views/web/index.jsp");
		rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException 
	{
		
	}
}
