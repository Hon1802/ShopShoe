<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-product" />
<c:url var="ProductURL" value="/admin-product" />

<html>
<head>
<title>Edit product</title>
</head>
<body>

	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs" id="breadcrumbs">
				<script type="text/javascript">
					try {
						ace.settings.check('breadcrumbs', 'fixed')
					} catch (e) {
					}
				</script>
				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a>
					</li>
					<li class="active">Insert new size</li>
				</ul>
				<!-- /.breadcrumb -->
			</div>
			
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
						<c:if test="${not empty messageResponse}">
							<div class="alert alert-${alert}">${messageResponse}</div>
						</c:if>
						<form  action="<c:url value="/admin-stock?type=insert&productsId=${model.productId}"/>" id="formSubmit"  method="post">
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right">Size: </label>
								<div class="col-sm-9">
									<input type="number" class="form-control" id="size"
										name="size" placeholder="New size" />
								</div>
							</div>
							<br /> <br /> 
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right">Amount</label>
								<div class="col-sm-9">
									<input type="number" class="form-control" id="qty"
										name="qty" placeholder="Product's Amount" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-12">									
										<button type="submit" class="btn btn-primary">Add new</button>								
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
