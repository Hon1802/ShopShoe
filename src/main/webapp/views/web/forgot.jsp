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

<link rel="stylesheet" href="<c:url value="/views/web/assets/css/forgot.css"/>">
<!--font-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;700&display=swap" rel="stylesheet">
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
		<div class="forgotform__right">
                    <div id="for-forgot">                        
                        <div class="forgotform-header text_left"><a>FORGOT PASSWORD</a></div> 
                        
                        <form class="forgotform__right-body" action="<c:url value='/forgotPassword'/>" method="POST">
                            <div class="card-body text_content">
                                <div class="form-group">
                                    <label for="email-for-pass">Enter your email address</label> <input
                                        class="inputforgot" type="text" name="email" id="email-for-pass" required="" placeholder="Enter your email to get password"><small
                                        class="form-text text-muted">Enter the registered email address . Then we'll
                                        email a OTP to this address.</small>
                                </div>
                            </div>
                            <div class="card-footer">
                                <button class="inputforgot ho" type="submit" style="color: white;border-radius: ;background: green; border-radius: 16px; width: 32%;">Get New
                                    Password</button>
                                    <button class="inputforgot ho" style="color: white;border-radius: ;background: red; border-radius: 16px; width: 32%;" type="submit""> Back to
                                        forgot</button>
                            </div>
                        </form>
                </div>  
	</main>
</body>
<%@ include file="footer.jsp" %>  
</html>