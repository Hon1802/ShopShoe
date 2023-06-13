 <%@ include file="header.jsp" %>  
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Shop Shoe</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="<c:url value="/views/web/assets/css/flogin.css"/>">
<!--font-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans&family=Roboto:wght@300;400;500;700&display=swap"
	rel="stylesheet">
<!--icon-->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="" async defer></script>
 <!-- bootstrap -->


</head>
<body>


<!--baner-->
	<main class="main_logiform">
		<div class="loginform" style="margin-top: 50px;">
			<div class="loginform__left ">
				<img
					src="https://images.meesho.com/images/products/89867327/hh4s5_512.jpg"
					alt="logowed">

			</div>
			<div class="loginform__right">
				<div id="for-login">
					
					<div class="loginform__right-header text_left">
						<a>LOGIN</a>
					</div>
					<form action="<c:url value='/login'/>" id="log" method="POST">
					<c:if test="${not empty message}">
						<div id="noti1" class="noti"
							style="position: relative; left: -863px; top: 97px;">
							<div class="alert alert-${alert}">${message}</div>
						</div>
					</c:if>
						<div class="loginform__right-body">
							<input class="inputlogin" placeholder="Email/Phone number"
								name="uname" id="uname" required> <input
								class="inputlogin" placeholder="Password" name="pass" id="pass"
								required type="password">
							<button class="inputlogin" onclick="hamtam()">Login</button>
							<button class="inputlogin" style="color: red;"
								onclick="registerfun()">Register</button>
							<input type="hidden" value="login" name="action" /> <a
								class="textfoget" href="<c:url value='/views/web/forgot.jsp'/>">Forget Password</a>
							<p>OR</p>
							<div class="login3">
								<ul>
									<li><a> <i class='fab fa-facebook-f'
											style='color: blue'></i> facebook
									</a></li>
									<li><a> <i class='fab fa-google-plus-g'
											style='color: red'></i> google
									</a></li>
								</ul>
							</div>
						</div>
					</form>
				</div>
				<div id="for-register">
					<div class="loginform__right-header text_left">
						<a>REGISTER</a>
					</div>
					<form action="<c:url value='/register'/>" id="re" method="POST">
					<c:if test="${not empty message}">
						<div id="noti1" class="noti"
							style="position: relative; left: -863px; top: 97px;">
							<div class="alert alert-${alert}">${message}</div>
						</div>
					</c:if>
						<div class="loginform__right-body">
							<input class="inputregis" placeholder="Full name" name="fullName"
								id="fullName" required> <input class="inputregis"
								placeholder="Email" name="email" id="email" required> <input
								class="inputregis" placeholder="Phone number" name="phone" id="phone"
								required> <input class="inputregis"
								placeholder="Password" name="password" id="password" required>
							<input class="inputregis" placeholder="Confirm password"
								name="Confpass" required id="Confpass""> <input class="inputregis"
								placeholder="Address" name="address" id="address" required>
							<button class="inputregis" style="color: red;" value="register"
								name="action">Register</button>
						</div>
					</form>
				</div>
				<script>
				function registerfun() {
					document.getElementById("for-login").style.display = 'none';
					document.getElementById("for-register").style.display = 'block';
					document.getElementById("noti1").style.display = 'block';
				}
				function registerfun1() {
					document.getElementById("for-login").style.display = 'block';
					document.getElementById("for-register").style.display = 'none';
				}
			</script>
			</div>
		</div>
	</main>
</body>
<%@ include file="footer.jsp" %>  
</html>