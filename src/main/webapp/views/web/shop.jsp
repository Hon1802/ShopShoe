<%@ include file="header.jsp"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="searchAPI" value="/search"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Shop Shoe</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="<c:url value="/views/web/assets/css/show_product.css"/>">
<!--font-->

<!--icon-->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!--paging-->
 	<script src="<c:url value='/template/admin/assets/js/jquery.2.1.1.min.js' />"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="<c:url value='/template/paging/jquery.twbsPagination.js' />"></script>
	<link rel="stylesheet" href="<c:url value='/template/admin/assets/css/bootstrap.min.css' />" />
    <link rel="stylesheet" href="<c:url value='/template/admin/font-awesome/4.5.0/css/font-awesome.min.css' />" />
    
    
    
</head>
<body>
	<main class="container">
	<form action="<c:url value='/product'/>" id="formSubmit" method="get">
		<div class="container__main">
			<div class="product_view">
				<div class="show-top">
					<div class="text-right">show 1-20 product from 100 result</div>
					<div class="tab-select text-right">
						<ul>
							<li class="tab-item" onclick="viewproduct()">Trend</li>
							<li class="tab-item" onclick="">New</li>
							<li class="tab-item" onclick="">Hot-sell</li>

						</ul>
					</div>
				</div>
				
				<div class="show_product">
					<ul id="shooo" class="product">
					<c:forEach var="item" items="${model.list}">
						<h1 id="output"></h1>
						<script src="functem.js"></script>
													<li>
								<div>
									<div class="product-top">
									<c:url var="detailURL" value="/product">
										<c:param name="type" value="detail" />
										<c:param name="productId" value="${item.productId}" />
									</c:url>
										<a href="${detailURL}" class="product-thumb"> <img
											src="<c:url value="/imgShoes/${item.productImage}"/>"
											alt="sp1">
										</a>
										<!--buy now-->
										<a href="${detailURL}" class="buy-now"> Buy now </a>
									</div>
									<div class="product-name">${item.productName}</div>
									<div class="product-price">${item.price}</div>
								</div>
							</li>
						</c:forEach>	
					</ul>							
				</div>			
				<ul class="pagination" id="pagination"></ul>
				<input type="hidden" value="" id="page" name="page" /> <input
					type="hidden" value="" id="maxPageItem" name="maxPageItem" /> <input
					type="hidden" value="" id="sortName" name="sortName" /> <input
					type="hidden" value="" id="sortBy" name="sortBy" /> <input
					type="hidden" value="" id="type" name="type" />
					<input type="hidden" value="" id="manufacturer" name="manufacturer" />	
									
			</div>
		</div>
		</form>
	</main>
	
<script>
			var totalPages = ${model.totalPage};
			var currentPage = ${model.page};
			var limit = 20;		
			$(function() {
				window.pagObj = $('#pagination').twbsPagination({
				totalPages : totalPages,
				visiblePages : 6,
				startPage : currentPage,
			    onPageClick : function(event, page) {
				if (currentPage != page) {
					$('#maxPageItem').val(limit);
					$('#page').val(page);
					$('#sortName').val('idProducts');
					$('#sortBy').val('desc');
					$('#type').val('show');
					$('#manufacturer').val('All');
					$('#formSubmit').submit();
				}
			}
		});
	});
			function viewproduct() {
				viewView({
					linkimg : "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/47112d0a-dc23-4b74-876c-b638fecf0af2/air-jordan-1-retro-high-og-shoes-a7Zzxm.png",
					price_pr : "$2000",
					product_name : "name_in here"
				});
			}
</script>
<script>
function searchByName(param){
    var txtSearch = param.value;
    $.ajax({
        url: "${searchAPI}",
        type: "get", //send it through get method
        data: {
            txt: txtSearch
        },
        success: function (data) {
            var row = document.getElementById("shooo");
            row.innerHTML = data;
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}
</script>
</body>
<%@ include file="footer.jsp"%>
</html>
