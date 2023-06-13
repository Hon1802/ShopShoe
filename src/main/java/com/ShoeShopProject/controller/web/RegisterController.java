package com.ShoeShopProject.controller.web;

import java.io.IOException;
import java.util.ResourceBundle;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ShoeShopProject.model.UserModel;
import com.ShoeShopProject.service.iUserService;

@WebServlet(urlPatterns = { "/register" })
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Inject
	private iUserService userService;
	ResourceBundle resourceBundle = ResourceBundle.getBundle("message");

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action != null && action.equals("register")) {
			UserModel user = new UserModel();
			user.setFullName(request.getParameter("fullName"));
			user.setPhone(request.getParameter("phone"));
			String password = request.getParameter("password");
			String conf = request.getParameter("Confpass");
			user.setAddress(request.getParameter("address"));
			user.setRole(0);
			user.setPassword(password);
			user.setEmail(request.getParameter("email"));
			if (conf.equals(password)) {
				request.setAttribute("message", resourceBundle.getString("success_register"));
				request.setAttribute("alert", "success");
				userService.insertUser(user);
				RequestDispatcher rd=request.getRequestDispatcher("/views/web/login.jsp");
				rd.forward(request, response);
			} else  {
				request.setAttribute("message", "Confirm password failed!");
				request.setAttribute("alert", "danger");
				RequestDispatcher rd=request.getRequestDispatcher("/views/web/login.jsp");
				rd.forward(request, response);
			}
		}
		
	}
	protected void doGet(HttpServletRequest request,  HttpServletResponse response) throws ServletException, IOException 
	{ 
		
	}
}
