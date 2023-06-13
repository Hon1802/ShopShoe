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
					<li class="active">Edit product</li>
				</ul>
				<!-- /.breadcrumb -->
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
						<c:if test="${not empty messageResponse}">
							<div class="alert alert-${alert}">${messageResponse}</div>
						</c:if>
						<form  id="formSubmit" >
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right">Type</label>
								<div class="col-sm-9">
									<select class="form-control" id="manufacturer"
										name="manufacturer">
										<c:if test="${empty model.manufacturer}">
											<option value="">Choose Shoe's Type</option>
											<option value="Nike">Nike</option>
											<option value="Adidas">Adidas</option>
										</c:if>
										<c:if test="${not empty model.manufacturer}">
											<c:forEach var="item" items="${manufacturers}">
												<option value="${item}"
													<c:if test="${item == model.manufacturer}">selected="selected"
                                                </c:if>>
													${item}</option>
											</c:forEach>
										</c:if>
									</select>
								</div>
							</div>
							<br /> <br />
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right">Product
									Name</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="productName"
										name="productName" value="${model.productName}" />
								</div>
							</div>
							<br /> <br /> 
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right">Description</label>
								<div class="col-sm-9">
									<textarea cols="50" placeholder="input description here"
										rows="6" class="form-control" id="desciption"
										name="desciption" >${model.desciption}</textarea>
								</div>
							</div>
							</br> </br> </br> </br> </br> <br /> <br /> <label
								class="col-sm-3 control-label no-padding-right">Made in</label>
							<div class="col-sm-9">
								<select class="form-control" id="madeIn" name="madeIn">
									<c:if test="${empty model.madeIn}">
										<option value="">Choose a country</option>
										<option value="VietNam">Viet Nam</option>
										<option value="Japan">Japan</option>
										<option value="China">China</option>
										<option value="Indonesia">Indonesia</option>
										<option value="India">India</option>
										<option value="Korea">Korea</option>
										<option value="Singapore">Singapore</option>
									</c:if>
									<c:if test="${not empty model.madeIn}">
										<c:forEach var="item" items="${countries}">
											<option value="${item}"
												<c:if test="${item == model.madeIn}">selected="selected"
                                              </c:if>>
												${item}</option>
										</c:forEach>
									</c:if>
								</select>
							</div>
							</br> <br /> <br /> <label
								class="col-sm-3 control-label no-padding-right">Gender</label>
							<div class="col-sm-9">
								<select class="form-control" id="gender" name="gender">
									<c:if test="${empty model.gender}">
										<option value="">Choose gender</option>
										<option value="Male">Male</option>
										<option value="Female">Female</option>
									</c:if>
									<c:if test="${not empty model.gender}">
										<c:forEach var="item" items="${genders}">
											<option value="${item}"
												<c:if test="${item == model.gender}">selected="selected"
                                              </c:if>>
												${item}</option>
										</c:forEach>
									</c:if>
								</select>
							</div>
							</br> <br /> <br /> <label
								class="col-sm-3 control-label no-padding-right">Price</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="price" name="price"
									value="${model.price}" />
							</div>
							</br> <br /> <br /> <label
								class="col-sm-3 control-label no-padding-right">Discount</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="discount"
									name="discount" value="${model.discount}" />
							</div>
							</br>
							<div class="form-group">
								<div class="col-sm-12">
									<c:if test="${not empty model.productId}">
										<input type="button"
											class="btn btn-white btn-warning btn-bold"
											value="Edit Product" id="btnAddOrUpdateProduct" />
									</c:if>
									<c:if test="${empty model.productId}">
										<input type="button"
											class="btn btn-white btn-warning btn-bold"
											value="Add New Product" id="btnAddOrUpdateProduct" />
									</c:if>
								</div>
							</div>
							<input type="hidden" value="${model.productId}" id="productId"
								name="productId" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
		$('#btnAddOrUpdateProduct').click(function(e) {
			e.preventDefault();
			var data = {};
			var formData = $('#formSubmit').serializeArray();
			$.each(formData, function(i, v) {
				data["" + v.name + ""] = v.value;
			});

			var id = $('#productId').val();
			if (id == "") {
				addProduct(data);
			} else {
				updateProduct(data);
			}
		});
		function addProduct(data) {
			$.ajax({
				url : '${APIurl}',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					window.location.href = "${ProductURL}?type=edit&productId="+result.productId+"&message=insert_success";
				},
				error : function(error) {
					window.location.href = "${ProductURL}?type=list&maxPageItem=6&page=1&sortName=idProducts&sortBy=desc&message=error_system";
				}
			});
		}
		function updateProduct(data) {
			$.ajax({
				url : '${APIurl}',
				type : 'PUT',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					window.location.href = "${ProductURL}?type=edit&productId="+result.productId+"&message=update_success";
				},
				error : function(error) {
					window.location.href = "${ProductURL}?type=list&maxPageItem=6&page=1&sortName=idProducts&sortBy=desc&message=error_system";
				}
			});
		}
	</script>

</body>
</html>
