<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/admin-trans" />
<c:url var="ProductURL" value="/admin-trans" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List of products</title>

<style>
.list__check {
	display: none;
}
</style>


</head>
<body>
	<div class="main-content">
		<form action="<c:url value='/admin-product'/>" id="formSubmit"
			method="get">
			<div class="main-content-inner">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a></li>
						<li><input id="myInput" type="text" placeholder="Search.."></li>
					</ul>
					<!-- /.breadcrumb -->
				</div>
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<c:if test="${not empty messageResponse}">
								<div class="alert alert-${alert}">${messageResponse}</div>
							</c:if>
							<div class="widget-box table-filter">
								<div class="table-btn-controls">
									<div class="pull-right tableTools-container">
										<div class="dt-buttons btn-overlap btn-group">
							
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
						</div>
						<div class="row">
							<div class="col-xs-12">
								<div class="row">
									<table class="table">
										<thead>
											<tr>
												<th>Check</th>
												<th>ID</th>
												<th>OrderID</th>
												<th>UserID</th>
												<th>Name</th>
												<th>Phone</th>
												<th>Email</th>
												<th>Amount</th>
												<th>Payment</th>
												<th>Payment Info</th>
												<th>Created</th>
												<th>Total Bill</th>
											</tr>
										</thead>
										<tbody id="myTable">
											<c:forEach var="item" items="${model.list}">
												<tr>
													<td><input type="checkbox"
														id="checkbox_${item.transId}" value="${item.transId}"></td>
													<td>${item.transId}</td>
													<td>${item.orderId}</td>
													<td>${item.userId}</td>
													<td>${item.userName}</td>
													<td>${item.userPhone}</td>
													<td>${item.userMail}</td>
													<td>${item.amount}</td>
													<td>${item.payment}</td>
													<td>${item.paymentInfo}</td>
													<td>${item.created}</td>
													<td>${item.totalBill}</td>
													
												</tr>
											</c:forEach>
										</tbody>
									</table>
									
									<script>
										$(document).ready(function(){
 												$("#myInput").on("keyup", function() {
    											var value = $(this).val().toLowerCase();
   												$("#myTable tr").filter(function() {
      											$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    													});
  												});
											});
									</script>
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>

	<!-- /.main-content -->
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
							window.location.href = "${ProductURL}?type=list&maxPageItem=6&page=1&message=delete_success";
						},
						error : function(error) {
							window.location.href = "${ProductURL}?type=list&maxPageItem=6&page=1&message=error_system";
						}
					});
		}
		
		 
	</script>
</body>
</html>