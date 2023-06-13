<%@ include file="header.jsp"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Shop Shoe</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="<c:url value="/views/web/assets/css/base.css"/>">
<link rel="stylesheet"
	href="<c:url value="/views/web/assets/css/home.css"/>">
<!--font-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;700&family=Fasthand&display=swap"
	rel="stylesheet">
<!--icon-->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

	<!--header-->
	<main class="container">
		<div class="box-left"></div>
		
		<div class="con-header">
			<ul class="con-header-ul">
				<li class="form-header con-header-left text-inf">
					<h1>Fashion</h1>
					<h3>Trendy new model</h3>
				</li>
				<li class="form-header con-header-mid text-inf">
					<h1>Luxurious</h1>
					<h3>Show off a trendy look</h3>
				</li>
				<li class="form-header con-header-right text-inf">
					<h1>Belong to you</h1>
					<h3>Born for you</h3>
				</li>
			</ul>
		</div>
		
		<%-- end --%>
		<div class="slide-container active">
                <div class="slide">
                    <div class="content">
                        <span style="font-size: 2rem; color: orangered;">Nike Sport Shoes</span>
                        <h3 style="font-size: 5rem; color: #000;">Nike Blazer Mid '77 Vintage</h3>
                        <p style="font-size: 1.7rem; color: #666; padding: .5rem 0;">
                            In the '70s, Nike was the new shoe on the block. So new in fact, we were still breaking into the basketball scene and testing prototypes on the feet of our local team. Of course, the design improved over the years, but the name stuck. The Nike Blazer Mid '77 Vintage classic since the beginning.
                        </p>
                    </div>
                    <div class="image">
                        <img src="<c:url value="./imgShoes/1.png"/>" class="shoe">
                    </div>
                </div>
            </div>
		<%-- end --%>
		
		<div class="con-mid text-inf">
			<div class="mid-inf">
				<h1>Product portfolio</h1>
				<h3>Warranty 12 months</h3>
			</div>
			<div class="dmsp">
				<ul class="dmsp-ul">
					<li class="dmsp-li">
				
					<a href="<c:url value="/product?type=show&manufacturer=Adidas&page=1&maxPageItem=20&sortName=idProducts&sortBy=desc"/>"
						style="text-decoration: none;"> <img
							src="data:image/png;base64,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">
							<h3>ADIDAS</h3>
					</a></li>
					<li class="dmsp-li">
						<a href="<c:url value="/product?type=show&manufacturer=Nike&page=1&maxPageItem=20&sortName=idProducts&sortBy=desc"/>" style="text-decoration: none;">
						<img
							src="https://bizweb.dktcdn.net/100/225/165/products/39282950-10156752742429114-562732366083129344-n.jpg?v=1617268073993">
							<h3>NIKE</h3>
					</a></li>

				</ul>
			</div>			

			<div class="inf-sp">
				<div class="inf-sp-left">
					<h1>Sophisticated design</h1>
					<h3>Produced with strict process will bring you the best
						quality product</h3>
				</div>
				<div class="inf-sp-right">
					<img
						src="https://media.vneconomy.vn/w800/images/upload/2021/12/14/nike.jpg">
				</div>
			</div>

			<div class="inf-sp-bot">
				<div class="mid-inf">
					<h1>Product</h1>
					<h3>pledge to pay 10 if not genuine</h3>
				</div>
				<div class="spct">
					<ul class="spct-sp-li">
						<c:forEach var="item" items="${spList}">
							<li>
								<div>
									<c:url var="detailURL" value="/product">
										<c:param name="type" value="detail" />
										<c:param name="productId" value="${item.productId}" />
									</c:url>
									<a href="${detailURL}"> <img
										src="<c:url value="/imgShoes/${item.productImage}"/>">
										<p>${item.productName}</p>
										<p style="color: red;">${item.price}</p>
									</a>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="slider-content-btn">
					<i class="fa fa-chevron-left" style="font-size: 36px"></i> <i
						class="fa fa-chevron-right" style="font-size: 36px"></i>
				</div>

			</div>
			<script src="<c:url value="./views/web/assets/func/script.js"/>"></script>
		</div>

	</main>
</body>
<%@ include file="footer.jsp"%>
</html>