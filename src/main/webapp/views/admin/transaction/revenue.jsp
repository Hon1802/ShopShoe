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
												<th>Date</th>
												<th>Total Bill</th>
											</tr>
										</thead>
										<tbody id="myTable">
											<c:forEach var="item" items="${model.list}">
												<tr>												
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
									<ul class="pagination" id="pagination"></ul>
									<input type="hidden" value="" id="page" name="page" /> <input
										type="hidden" value="" id="maxPageItem" name="maxPageItem" />
									<input type="hidden" value="" id="type" name="type" />
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
		var totalPages = ${model.totalPage};
		var currentPage = ${model.page};
		var limit = 6;
		$(function() {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : totalPages,
				visiblePages : 6,
				startPage : currentPage,
				onPageClick : function(event, page) {
					if (currentPage != page) {
						$('#maxPageItem').val(limit);
						$('#page').val(page);
						$('#type').val('list');
						$('#formSubmit').submit();
					}
				}
			});
		});

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