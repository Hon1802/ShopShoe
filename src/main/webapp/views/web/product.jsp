 <%@ include file="/common/taglib.jsp" %>
 <%@ include file="header.jsp" %>  
 <c:url var="APIurl" value="/api-web-orders" />
<c:url var="ProductURL" value="/product" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Shop Shoe</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="<c:url value="/views/web/assets/css/base.css"/>">
        <link rel="stylesheet" href="<c:url value="/views/web/assets/css/product.css"/>">
        <!--font-->
      <link rel="stylesheet" href="<c:url value='/template/admin/assets/css/bootstrap.min.css' />" />
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;700&family=Fasthand&display=swap" rel="stylesheet">
        <!--icon-->
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    	<!--ajax-->
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    	  <script type = "text/javascript">  
			function myfunction() {   
			alert("how are you");  
         			}  
			</script>  
    </head>
    
    <body>
	<form  id="formSubmit" >
        <main class="container">
        		
			<div class="mesage-text">
				<c:if test="${not empty messageResponse}">
						<div class="alert alert-${alert}">${messageResponse}</div>

			</c:if>
			</div>
   				
  	<div class="container-con">
                <div class="con-left">
                    <div class="content-img">                   
                        <a href=""> <img src="<c:url value="/imgShoes/${model.productImage}"/>"></a>
                       
                    </div>                
                </div>
                <div class="slider-content-btn ">
                    <i class="fa fa-chevron-left" style="font-size:36px"></i>
                    <i class="fa fa-chevron-right" style="font-size:36px"></i>
                </div>
                
                <div class="con-right">
                    <h2>${model.productName}</h2>
                    <h3>Product ID: ${model.productId}</h3>
                    <span>Price: ${model.price} VND</span>
                    <p>Made in ${model.madeIn}</p>
                    <div class="size-product">
                    
                    	<!-- size -->
                    	<form action="#">
						  <label for="size" style="margin-right: 54px;">Size :  </label>
						  <select name="productId" id="productId" style="height: 28px;">
						  <c:forEach items = "${list}" var = "item">
						  	<option value="${item.productId}" ><c:out value = "${item.size}"/></option>	                   		
	     					
	     				</c:forEach>
						  </select>
						  <br><br>
						  <!-- <input type="submit" value="Submit"> -->
						  
						</form>
                    	<!-- size -->
	                  
                   	</div>
                    <div class="quality">
                        <p style="font-weight:bold; padding-right:20px;">Quantity</p>
                        <input name="qty" id="qty" class="w-25 pl-1" value="1" min ="0"type="number" style="width:50px">                        
                    </div>
                    <div class="container_product-content-right_button">
                    
                       <input type="button"
								class="btn btn-white btn-warning btn-bold"
								value="Buy product" id="btnAddOrUpdateProduct" />
						
                    </div>
                    <br></br> <br></br>
                     <br></br>  <br></br>
                    
                </div>
            </div>
            <div style=" margin:20px;">
                <span style="color:red; text-decoration:underline; font-size:20px; padding: 0 100px; margin-top:20px;">Dental</span>
            </div>
            <div class="dental">
                <div class="content-dental">
                    <p>${model.desciption}</p>
                </div>
            </div>
            
            <input type="hidden" value="${USERMODEL.userId}" id="userId" name="userId" />
            
           
            <input type="hidden" value="${model.productId}" id="productsId"	name="productsId" />
            <script src="<c:url value="/views/web/assets/func/product.js"/>"></script>
        </main>
        </form>
             <script>
		$('#btnAddOrUpdateProduct').click(function(e) {
			e.preventDefault();
			var data = {};
			var formData = $('#formSubmit').serializeArray();
			$.each(formData, function(i, v) {
				data["" + v.name + ""] = v.value;
			});
				addProduct(data);
		
		});
		function addProduct(data) {
			$.ajax({
				url : '${APIurl}',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					window.location.href = "${ProductURL}?type=detail&productId="+${model.productId}+"&message=add_success";
				},
				error : function(error) {
					
					window.location.href = "${ProductURL}?type=detail&productId="+${model.productId}+"&message=error_system";
					
				}
			});
		}
		</script>
        <!--main-->

</body>
   
     <%@ include file="footer.jsp" %> 
</html>