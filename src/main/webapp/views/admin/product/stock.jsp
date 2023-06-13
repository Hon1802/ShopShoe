<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/admin-stock" />
<c:url var="ProductURL" value="/admin-product" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Stock</title>
</head>
<body>
	<div class="main-content">
			<div class="main-content-inner">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a></li>
					</ul>
					<div class="page-content">
						<div class="row">
							<div class="col-xs-12">
							<c:if test="${not empty messageResponse}">
							<div class="alert alert-${alert}">${messageResponse}</div>
						</c:if>
								<div class="row">
									<p style="font-size: 20px">Product Name:
										${model2.productName}</p>
									<p style="font-size: 20px">Amount: ${itemAmount}</p>
									<div class="widget-box table-filter">
								<div class="table-btn-controls">
									<div class="pull-right tableTools-container">
										<div class="dt-buttons btn-overlap btn-group">
											<a flag="info"
												class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
												data-toggle="tooltip" title='Add new size'
												href='<c:url value="/admin-stock?type=insert&productId=${model.productId}"/>'> <span>
													<i class="fa fa-plus-circle bigger-110 purple"></i>
											</span>
											</a>
											<button id="btnDelete" type="button"
												class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
												data-toggle="tooltip" title='Delete product'>
												<span> <i class="fa fa-trash-o bigger-110 pink"></i>
												</span>
											</button>

										</div>
									</div>
								</div>
							</div>
									<table class="table">
										<thead>
											<tr>
												<th><input type="checkbox" id="checkAll"></th>
												<th>ID</th>
												<th>Size</th>
												<th>Amount</th>
											
												<th>Update<th>
											</tr>
										</thead>
										<tbody>
										
										<c:forEach var="item" items="${list}">
											<tr>
												<td><input type="checkbox"
													id="checkbox_${item.productId}" value="${item.productId}"></td>
												<td>${item.productId}</td>
												<td>${item.size}</td>
												<td>${item.qty}</td>
												<form action="<c:url value='/admin-stock'/>" id="formSubmit"
												method="get"	>
					
												<td>
												<c:url var="editURL" value="/admin-product">
														<c:param name="type" value="editStock"/>
														<c:param name="productId" value="${item.productId}"/>
														<c:param name="productsId" value="${model2.productId}"/>
												</c:url>
												<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
													 title="Update amount" href='${editURL}'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
												</a>
												</td>
												</form>
											</tr>
											</c:forEach>
											</form>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		
	</div>
	<script>
		$("#btnDelete").click(function() {
			var data = {};
			var ids = $('tbody input[type=checkbox]:checked').map(function() {
				return $(this).val();
			}).get();
			data['ids'] = ids;
			deleteProduct(data);
		});
		function deleteProduct(data) {
			$.ajax({
						url : '${APIurl}',
						type : 'DELETE',
						contentType : 'application/json',
						data : JSON.stringify(data),
						success : function(result) {
							window.location.href = "${ProductURL}?type=import&productId="+${model.productId}+"&message=delete_success";
						},
						error : function(error) {
							window.location.href = "${ProductURL}?type=import&"+${model.productId}+"&message=error_system";
						}
					});
		}
		
		 
	</script>
</body>
</html>