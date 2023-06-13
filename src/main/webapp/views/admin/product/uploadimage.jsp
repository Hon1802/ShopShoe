<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload Image</title>
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
			</div>
			<form  action="<c:url value="/admin-upload?type=upload&productId=${model.productId}"/>" method="post" enctype="multipart/form-data" id=formSubmit>
				<input type="file" accept="image/jpeg, image/png, image/jpg" name="photo" id=productImage /> <img
					id="display-image"
					style="width: 400px; height: 225px; border: 1px solid black; background-position: center; background-size: cover;"
					src="<c:url value="/imgShoes/${model.productImage}"/>">
				<script>    
					 const image_input = document.querySelector("#productImage");
					 image_input.addEventListener("change", function() {
					 const reader = new FileReader();
					 console.log(reader);
					 reader.addEventListener("load", ()=>{
					 const uploaded_image = reader.result;    	      
					 document.getElementById("display-image").src = uploaded_image ;			
					})
					 reader.readAsDataURL(this.files[0]);
				});
			
			</script>
			<button type="submit" class="btn btn-primary">Upload</button>
			</form>
		</div>
	</div>
</body>
</html>