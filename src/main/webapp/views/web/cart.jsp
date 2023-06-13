<%@ include file="header.jsp"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<c:url var="APIurl" value="/api-web-trans" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Shop Shoe</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="<c:url value="/views/web/assets/css/cart.css"/>">
<!--font-->

<!--icon-->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!--paging-->
<script
	src="<c:url value='/template/admin/assets/js/jquery.2.1.1.min.js' />"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script
	src="<c:url value='/template/paging/jquery.twbsPagination.js' />"></script>
<link rel="stylesheet"
	href="<c:url value='/template/admin/assets/css/bootstrap.min.css' />" />
<link rel="stylesheet"
	href="<c:url value='/template/admin/font-awesome/4.5.0/css/font-awesome.min.css' />" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
var sum_price = 0;
var total_price = 0;
var t_price = 0;
var t_number = 1;
var t_dis = 0;
var code_dis = 0;
$(document).ready(function()
		{
			$('tr').each(function()
			{
				sum_price = 0;
                $(this).find('.price_pro').each(function()
						{
							var value_price= $(this).text();
							if(value_price.length !==0)
								{                                    	
									t_price = parseFloat(value_price) ;
								}
						});
                $(this).find("#qty").each(function(){
                	t_number = this.value;
                	sum_price = t_price * t_number;                     	
                	
            	}); 
                $(this).find(".price").html(sum_price);
                      
			});
		 	   
			total_price = 0;
            $(this).find('.price').each(function()
					{
						var value_price= $(this).text();
						if(value_price.length !==0)
							{                                    	
							total_price += parseFloat(value_price) ;
							}
					});
            code_dis = 0;
            
            
            $(".bot-cart").find('#total_price').html(total_price);
            
            $('tr').change(function()
    				{
	                    $(this).find('.price_pro').each(function()
								{
									var value_price= $(this).text();
									if(value_price.length !==0)
										{                                    	
											t_price = parseFloat(value_price) ;
										}
								});
	                    $(this).find("#qty").each(function(){
	                    	t_number = this.value;
	                    	sum_price = t_price * t_number; 
	                	}); 
	                    $(this).find(".price").html(sum_price);
	                    total_price =0;
	                    $('tr').find(".price").each(function(){
	                    	var value_price= $(this).text();
							if(value_price.length !==0)
								{                                    	
									total_price += parseFloat(value_price) ;
								}
	                	}); 
	                    $('.bot-cart').find("#coupon_ap").each(function(){
	                    	var value_price = $(this).text();
							if(value_price.length !==0)
								{                                    	
									if(total_price-parseFloat(value_price) >= 0)
										{
											
										total_price-=parseFloat(value_price);
										}
									else{
										total_price = 0;
									}
								}
	                	});
	                    var s= document.getElementById('total_price');
	                    s.value = total_price;
	                    $(".bot-cart").find('#total_price').html(total_price);
    				});
		});
function applycoupon({ valueee = "" })
{
	var total_price = 0;
	console.log(valueee);
	
	$(document).ready(function()
		{
			$(".bot-cart").find('#coupon_ap').html(valueee);
			
	});}
	function confirmInf(){
		document.getElementById("btn_tempp").style.display = 'none';
		document.getElementById("btnconfirm").style.display = 'block';
		document.getElementById("conttt").style.width= '70%';
	}
	function process_confirm(){
		document.getElementById("process_to_check").style.display = 'flex';
	}

</script>

</head>
<body>
	<main class="main_cartform">
		<div>
			<h2
				style="font-size: 40px; padding: 30px; font-family: 'Fasthand', cursive;">Shopping
				Cart</h2>
		</div>

		<div class="cart-container text-table">
			<table border="1" class="cart-table">
				<thead>
					<tr>
						<td>Number</td>
						<td>Image</td>
						<td>Product</td>
						<td>Size</td>
						<td>Price</td>
						<td>Quantity</td>
						<td>Total</td>
						<td>Remove</td>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="item" items="${list}">
					<tr>
						
						<td ><a >${item.orderId}</a></td>
						<td><img src="<c:url value="/imgShoes/${item.productImage}"/>" alt=""></td>
						<td>
							<h5>${item.productName}</h5>
						</td>
						<td>
							<h5>${item.size}</h5>
						</td>
						<td>
							<h5 class="price_pro">${item.price}</h5>
						</td>
						<td><input class="w-25 pl-1" value="${item.qty}" min="0" type="number"
							style="width: 50px" id="qty"></td>
						<td>
							<h5 class="price"></h5>
						</td>
						<td><a href="<c:url value="/cart?type=edit&userId=${USERMODEL.userId}&orderId=${item.orderId}"/>"><i class="fas fa-trash-alt"></i></a></td>
						
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="bot-cart">
			<div class="coupon">
				<h5 style="color: white; background: #333; padding: 10px 10px;">COUPON</h5>
				<h6 class="text-coupon">Enter your coupon code if you have one.</h6>
				<input class="input_cart" placeholder="coupon code here">
				<button onclick="applycoupon({valueee:'200'})">APPLY COUPON</button>

			</div>
			<div class="cart-total">
				<h5 style="color: white; background: #333; padding: 10px 10px;">CART
					TOTAL</h5>
				<div class="cart-total_top">
					<h6>Coupon</h6>
					<p id="coupon_ap"></p>
				</div>
				<div class="cart-total_bet">
					<h6>Ship</h6>
					<p>$000.0000</p>
				</div>
				<div class="cart-total_bot">
					<h6>total</h6>
					<p id="total_price" value="">100</p>
				</div>
				
				<button class="input_cart" onclick="process_confirm()">Process to checkout</button>		


			</div>
		</div>
		<form  id="formSubmit">
		<div id="process_to_check" class="checkout">
		<div id="conttt" class="container" style="margin-top:0;">
			<div class="p-4" style="width: 96%; text-align: center;">
				<h1>SHIPMENT DETAILS</h1>
				<form action="" class="flex flex-col gap-5 sm:gap-10 mt-4 py-2">
					<div>
						<div class="relative w-full m-10">
							<input label="Họ và Tên"
								class="py-3 px-4 border-b w-full focus:bg-none placeholder-transparent focus:outline-none peer relative"
								id="userName"
								name="userName" value="" /><label
								class="absolute capitalize left-2 -top-2.5 text-sm text-gray-400 transition-all bg-transparent peer-placeholder-shown:top-2.5 peer-focus:-top-2.5 peer-focus:text-sm">Họ
								và Tên</label>
						</div>
					</div>
					<div class="relative w-full m-10">
						<input label="Email"
							class="py-3 px-4 border-b w-full focus:bg-none placeholder-transparent focus:outline-none peer relative"
							name="userMail" id="userMail"/><label
							class="absolute capitalize left-2 -top-2.5 text-sm text-gray-400 transition-all bg-transparent peer-placeholder-shown:top-2.5 peer-focus:-top-2.5 peer-focus:text-sm">Email</label>
					</div>
					<div>
						<div class="relative w-full m-10">
							<input label="Số điện thoại"
								class="py-3 px-4 border-b w-full focus:bg-none placeholder-transparent focus:outline-none peer relative"
								name="userPhone" id="userPhone"/><label
								class="absolute capitalize left-2 -top-2.5 text-sm text-gray-400 transition-all bg-transparent peer-placeholder-shown:top-2.5 peer-focus:-top-2.5 peer-focus:text-sm">Số
								điện thoại</label>
						</div>
					</div>
					<div class="relative w-full m-10">
						<select 
							class="py-3 px-4 border w-full rounded-md placeholder-transparent focus:outline-none peer">
							<option value="default" disabled="" hidden="" selected=""></option>
							<option value='{"id":254,"name":"Hà Nội","jntName":"Hà Nội"}'>
								Hà Nội</option>
							<option
								value='{"id":255,"name":"Hồ Chí Minh","jntName":"Hồ Chí Minh"}'>
								Hồ Chí Minh</option>
							<option value='{"id":312,"name":"Đà Nẵng","jntName":"Đà Nẵng"}'>
								Đà Nẵng</option>
							<option
								value='{"id":280,"name":"Hải Phòng","jntName":"Hải Phòng"}'>
								Hải Phòng</option>
							<option
								value='{"id":270,"name":"Quảng Ninh","jntName":"Quảng Ninh"}'>
								Quảng Ninh</option>
							<option
								value='{"id":267,"name":"Khánh Hòa","jntName":"Khánh Hòa"}'>
								Khánh Hòa</option>
							<option value='{"id":256,"name":"An Giang","jntName":"An Giang"}'>
								An Giang</option>
							<option
								value='{"id":257,"name":"Bà Rịa - Vũng Tàu","jntName":"Bà Rịa – Vũng Tàu"}'>
								Bà Rịa - Vũng Tàu</option>
							<option value='{"id":258,"name":"Bắc Ninh","jntName":"Bắc Ninh"}'>
								Bắc Ninh</option>
							<option
								value='{"id":259,"name":"Bắc Giang","jntName":"Bắc Giang"}'>
								Bắc Giang</option>
							<option
								value='{"id":260,"name":"Bình Dương","jntName":"Bình Dương"}'>
								Bình Dương</option>
							<option
								value='{"id":261,"name":"Bình Định","jntName":"Bình Định"}'>
								Bình Định</option>
							<option
								value='{"id":262,"name":"Bình Phước","jntName":"Bình Phước"}'>
								Bình Phước</option>
							<option
								value='{"id":263,"name":"Bình Thuận","jntName":"Bình Thuận"}'>
								Bình Thuận</option>
							<option value='{"id":264,"name":"Bến Tre","jntName":"Bến Tre"}'>
								Bến Tre</option>
							<option value='{"id":265,"name":"Bắc Cạn","jntName":"Bắc Kạn"}'>
								Bắc Cạn</option>
							<option value='{"id":266,"name":"Cần Thơ","jntName":"Cần Thơ"}'>
								Cần Thơ</option>
							<option
								value='{"id":268,"name":"Thừa Thiên Huế","jntName":"Thừa Thiên – Huế"}'>
								Thừa Thiên Huế</option>
							<option value='{"id":269,"name":"Lào Cai","jntName":"Lào Cai"}'>
								Lào Cai</option>
							<option value='{"id":271,"name":"Đồng Nai","jntName":"Đồng Nai"}'>
								Đồng Nai</option>
							<option value='{"id":272,"name":"Nam Định","jntName":"Nam Định"}'>
								Nam Định</option>
							<option value='{"id":273,"name":"Cà Mau","jntName":"Cà Mau"}'>
								Cà Mau</option>
							<option value='{"id":274,"name":"Cao Bằng","jntName":"Cao Bằng"}'>
								Cao Bằng</option>
							<option value='{"id":275,"name":"Gia Lai","jntName":"Gia Lai"}'>
								Gia Lai</option>
							<option value='{"id":276,"name":"Hà Giang","jntName":"Hà Giang"}'>
								Hà Giang</option>
							<option value='{"id":277,"name":"Hà Nam","jntName":"Hà Nam"}'>
								Hà Nam</option>
							<option value='{"id":278,"name":"Hà Tĩnh","jntName":"Hà Tĩnh"}'>
								Hà Tĩnh</option>
							<option
								value='{"id":279,"name":"Hải Dương","jntName":"Hải Dương"}'>
								Hải Dương</option>
							<option value='{"id":281,"name":"Hòa Bình","jntName":"Hòa Bình"}'>
								Hòa Bình</option>
							<option value='{"id":282,"name":"Hưng Yên","jntName":"Hưng Yên"}'>
								Hưng Yên</option>
							<option
								value='{"id":283,"name":"Kiên Giang","jntName":"Kiên Giang"}'>
								Kiên Giang</option>
							<option value='{"id":284,"name":"Kon Tum","jntName":"Kon Tum"}'>
								Kon Tum</option>
							<option value='{"id":285,"name":"Lai Châu","jntName":"Lai Châu"}'>
								Lai Châu</option>
							<option value='{"id":286,"name":"Lâm Đồng","jntName":"Lâm Đồng"}'>
								Lâm Đồng</option>
							<option value='{"id":287,"name":"Lạng Sơn","jntName":"Lạng Sơn"}'>
								Lạng Sơn</option>
							<option value='{"id":288,"name":"Long An","jntName":"Long An"}'>
								Long An</option>
							<option value='{"id":289,"name":"Nghệ An","jntName":"Nghệ An"}'>
								Nghệ An</option>
							<option
								value='{"id":290,"name":"Ninh Bình","jntName":"Ninh Bình"}'>
								Ninh Bình</option>
							<option
								value='{"id":291,"name":"Ninh Thuận","jntName":"Ninh Thuận"}'>
								Ninh Thuận</option>
							<option value='{"id":292,"name":"Phú Thọ","jntName":"Phú Thọ"}'>
								Phú Thọ</option>
							<option value='{"id":293,"name":"Phú Yên","jntName":"Phú Yên"}'>
								Phú Yên</option>
							<option
								value='{"id":294,"name":"Quảng Bình","jntName":"Quảng Bình"}'>
								Quảng Bình</option>
							<option
								value='{"id":295,"name":"Quảng Nam","jntName":"Quảng Nam"}'>
								Quảng Nam</option>
							<option
								value='{"id":296,"name":"Quảng Ngãi","jntName":"Quảng Ngãi"}'>
								Quảng Ngãi</option>
							<option
								value='{"id":297,"name":"Quảng Trị","jntName":"Quảng Trị"}'>
								Quảng Trị</option>
							<option
								value='{"id":298,"name":"Sóc Trăng","jntName":"Sóc Trăng"}'>
								Sóc Trăng</option>
							<option value='{"id":299,"name":"Sơn La","jntName":"Sơn La"}'>
								Sơn La</option>
							<option value='{"id":300,"name":"Tây Ninh","jntName":"Tây Ninh"}'>
								Tây Ninh</option>
							<option
								value='{"id":301,"name":"Thái Bình","jntName":"Thái Bình"}'>
								Thái Bình</option>
							<option
								value='{"id":302,"name":"Thái Nguyên","jntName":"Thái Nguyên"}'>
								Thái Nguyên</option>
							<option
								value='{"id":303,"name":"Thanh Hóa","jntName":"Thanh Hóa"}'>
								Thanh Hóa</option>
							<option
								value='{"id":304,"name":"Tiền Giang","jntName":"Tiền Giang"}'>
								Tiền Giang</option>
							<option value='{"id":305,"name":"Trà Vinh","jntName":"Trà Vinh"}'>
								Trà Vinh</option>
							<option
								value='{"id":306,"name":"Tuyên Quang","jntName":"Tuyên Quang"}'>
								Tuyên Quang</option>
							<option
								value='{"id":307,"name":"Vĩnh Long","jntName":"Vĩnh Long"}'>
								Vĩnh Long</option>
							<option
								value='{"id":308,"name":"Vĩnh Phúc","jntName":"Vĩnh Phúc"}'>
								Vĩnh Phúc</option>
							<option value='{"id":309,"name":"Yên Bái","jntName":"Yên Bái"}'>
								Yên Bái</option>
							<option value='{"id":310,"name":"Đắc Lắc","jntName":"Đắk Lắk"}'>
								Đắc Lắc</option>
							<option
								value='{"id":311,"name":"Đồng Tháp","jntName":"Đồng Tháp"}'>
								Đồng Tháp</option>
							<option value='{"id":313,"name":"Đắc Nông","jntName":"Đắk Nông"}'>
								Đắc Nông</option>
							<option
								value='{"id":314,"name":"Hậu Giang","jntName":"Hậu Giang"}'>
								Hậu Giang</option>
							<option value='{"id":315,"name":"Bạc Liêu","jntName":"Bạc Liêu"}'>
								Bạc Liêu</option>
							<option
								value='{"id":316,"name":"Điện Biên","jntName":"Điện Biên"}'>
								Điện Biên</option>
						</select><label
							class="absolute capitalize left-2 -top-3 text-base text-gray-400 bg-secondary transition-all peer-placeholder-shown:top-2.5 peer-focus:-top-3 peer-focus:text-sm">Chọn
							tỉnh/ Thành phố</label>
					</div>
					<div class="relative w-full m-10">
						<input label="Số nhà, tên đường"
							class="py-3 px-4 border-b w-full focus:bg-none placeholder-transparent focus:outline-none peer relative"
							 /><label
							class="absolute capitalize left-2 -top-3 text-base text-gray-400 bg-secondary transition-all peer-placeholder-shown:top-2.5 peer-focus:-top-3 peer-focus:text-sm">Quận/
							Huyện</label>
					</div>
					<div class="relative w-full m-10">
						<input label="Số nhà, tên đường"
							class="py-3 px-4 border-b w-full focus:bg-none placeholder-transparent focus:outline-none peer relative"
							/><label
							class="absolute capitalize left-2 -top-3 text-base text-gray-400 bg-secondary transition-all peer-placeholder-shown:top-2.5 peer-focus:-top-3 peer-focus:text-sm">Phường/
							Xã</label>
					</div>
					<div>
						<div class="relative w-full m-10">
							<input label="Số nhà, tên đường"
								class="py-3 px-4 border-b w-full focus:bg-none placeholder-transparent focus:outline-none peer relative"
								 /><label
								class="absolute capitalize left-2 -top-2.5 text-sm text-gray-400 transition-all bg-transparent peer-placeholder-shown:top-2.5 peer-focus:-top-2.5 peer-focus:text-sm">Số
								nhà, tên đường</label>
						</div>
					</div>
					
				</form>
				<div id="btn_tempp">
						<div class="confim m-10">
							<button class=" py-3 px-4 border-b w-full relative upcate" onclick="confirmInf()">
								Confirm
							</button>
						</div>
					</div>				
			</div>
		</div>
		<input type="hidden" value="${USERMODEL.userId}" id="userId"
								name="userId" />
		</form>
		<div id="btnconfirm" class="row-left">
					<div class="method-delivery">
						<p style="font-weight: bold;">Method to delivery</p>
						<div class="content-row-left">
							<input name="method-payment1" type="radio"> <label for="">Fast
								delivery</label>
						</div>
					</div>
					<div class="method-payment">
						<p style="font-weight: bold;">Method to payment</p>
						<p>All transactions are secure and encrypted. Credit card
							information will not be saved.</p>
						<!--<div class="method-payment-left">
                                <input name="method-payment"  type="radio">
                                <label for="">Pay by Paypal</label>
                            </div>
                            <div class="row-img-payment">
                                <img src="https://s6.upanh.pro/2019/09/23/paypal-logo.png">
                            </div>-->

						<div class="method-payment-left">
							<input name="method-payment" type="radio"> <label for="">Pay
								at home (COD)</label>
						</div>
						
						<!--paypal-->
						<p style="font-weight: bold; text-align: center;">Pay with
							Paypal</p>
						<script
							src="https://www.paypal.com/sdk/js?client-id=AUWfXUeBuIo-uiW1c-nYdbCoT77iWdyx93uB08lv0Xikfx3qANnIZLlTEVRCSscSpLGH6n1jHXBeY46X&currency=USD"></script>
						<!-- Set up a container element for the button -->
						
						<div  id="paypal-button-container"></div>
						
						<!--scrip paypal-->
						<script>
						var v1 
							$(document).ready(function()
									{
										$(".bot-cart").find('#total_price').change(function(){
											var data = document.getElementById("total_price");
											var text = document.getElementById("total_price").innerHTML;
											console.log(data);
											console.log(text)
											v1 = parseFloat(text);
											console.log(v1)
										});
											var data = document.getElementById("total_price");
											var text = document.getElementById("total_price").innerHTML;
											console.log(data);
											console.log(text)
											v1 = parseFloat(text);
											console.log(v1)
									});
                                paypal.Buttons({
                                  // Sets up the transaction when a payment button is clicked
                                  createOrder: (data, actions) => {
                                    return actions.order.create({
                                      purchase_units: [{
                                        amount: {
                                          value: v1 // dat tien vo day// in here
                                        }
                                      }]
                                    });
                                  },
                                  // Finalize the transaction after payer approval
                                  onApprove: (data, actions) => {
                                    return actions.order.capture().then(function(orderData) {
                                      // Successful capture! For dev/demo purposes:
                                      console.log('Capture result', orderData, JSON.stringify(orderData, null, 2));
                                      const transaction = orderData.purchase_units[0].payments.captures[0];
                                      alert(`Transaction ${transaction.status}: ${transaction.id}\n\nSee console for all available details`);
                                      // When ready to go live, remove the alert and show a success message within this page. For example:
                                      const element = document.getElementById('paypal-button-container');
                                      element.innerHTML = '<h3>Thank you for your payment!</h3>';
                                      // Or go to another URL:  actions.redirect('thank_you.html');
                                    });
                                  }
                                }).render('#paypal-button-container');
                              </script>

						<script>
                                  createOrder: (data, actions) => {
                                      return actions.order.create({
                                         "purchase_units": [{
                                            "amount": {
                                              "currency_code": "USD",
                                              "value": "100",
                                              "breakdown": {
                                                "item_total": {  /* Required when including the items array */
                                                  "currency_code": "USD",
                                                  "value": "100"
                                                }
                                              }
                                            },
                                            "items": [
                                              {
                                                "name": "First Product Name", /* Shows within upper-right dropdown during payment approval */
                                                "description": "Optional descriptive text..", /* Item details will also be in the completed paypal.com transaction view */
                                                "unit_amount": {
                                                  "currency_code": "USD",
                                                  "value": "50"
                                                },
                                                "quantity": "2"
                                              },
                                            ]
                                          }]
                                      });
                                    },
                              </script>
						<!--scrip paypal-->

					</div>
				</div>
		</div>
	</main>
	<script>
	$('#btn_tempp').click(function(e) {
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
				
			},
			error : function(error) {
				
			}
		});
	}
	</script>
</body>
<%@ include file="footer.jsp"%>
</html>
