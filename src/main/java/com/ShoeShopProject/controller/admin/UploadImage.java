package com.ShoeShopProject.controller.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.ShoeShopProject.constant.SystemConstant;
import com.ShoeShopProject.model.ProductsModel;
import com.ShoeShopProject.service.iProductsService;
import com.ShoeShopProject.utils.FormUtil;

@WebServlet(urlPatterns = { "/admin-upload" })
public class UploadImage extends HttpServlet {
	/**
	 * 
	 */
	@Inject
	private iProductsService productsService;
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductsModel model = FormUtil.toModel(ProductsModel.class, request);
		if (model.getType().equals(SystemConstant.UPLOAD)) {
			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/product/uploadimage.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!ServletFileUpload.isMultipartContent(request)) {
			System.out.print(false);
		}
		String filename = null;
		// Create a factory for disk-based file items
		DiskFileItemFactory factory = new DiskFileItemFactory();

		// Configure a repository (to ensure a secure temp location is used)
		ServletContext servletContext = this.getServletConfig().getServletContext();
		File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
		factory.setRepository(repository);

		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);

		// Parse the request
		try {
			List<FileItem> items = upload.parseRequest(request);
			if (items.isEmpty()) {
				System.out.print(0);
			}

			Iterator<FileItem> iter = items.iterator();
			// HashMap<String, String> fields = new HashMap<>();
			while (iter.hasNext()) {
				FileItem item = iter.next();
				filename = item.getName();
				if (item.isFormField()) {
					String name = item.getFieldName();
					String value = item.getString();
					System.out.print("name: " + name);
					System.out.print("value: " + value);
				} else {
					filename = item.getName();
					System.out.print("file name: " + filename);
					if (filename == null || filename.equals("null")) {
						break;
					} else {
						Path path = Paths.get(filename);
						String storePath = servletContext.getRealPath("/imgShoes");
						File uploadFile = new File(storePath + "/" + path.getFileName());
						try {
							item.write(uploadFile);
							
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}

					}
				}
			}
			ProductsModel model = FormUtil.toModel(ProductsModel.class, request);							
			if (model.getProductId() != null) {
				model = productsService.findOne(model.getProductId());
			}
			model.setProductImage(filename);
			productsService.update(model);
			

		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/product/uploadimage.jsp");
		rd.forward(request, response);
		
	}

}
