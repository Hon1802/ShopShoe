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
        <link rel="stylesheet" href="./assets/css/contact.css">
        <!--font-->
        
        <!--icon-->
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body class="about_contain">
        <div class="text-center">
            <h1>GET IN TOUCH</h1>
            <div style="display:flex;">
                <i class='fas fa-phone-alt' style="margin: 5px 16px;"></i>
                <p>Phone: 0xxxxxxxxx</p>
            </div>
            <p style="margin: 5px 16px;" > Email: <span style="color:red;">aaa@gmail.com</span></p>
            
            <div style="display:flex;">
                <i class="fa fa-map-marker" aria-hidden="true" style="margin: 5px 16px;"></i>
                <p style="margin: 5px 16px;">Address: 123 Dien Bien Phu Xa Lo Ha Noi</p>
            </div>
        </div>
        <div class="input-center">
            <form action="#">
                <div style="display:flex; width:90%; justify-content: space-around; margin: -2% 5%;">
                    <div>
                        <label for="yname">Enter your name:</label><br><br>
                        <input type="your_name" id="name" name="name" placeholder="Nguyen Van A" ><br><br>
                        <label for="yname">Enter your email:</label><br><br>
                        <input type="your_email" id="email" name="email" placeholder="...@gmail.com" ><br><br>
                        <label for="yname">Enter your name:</label><br><br>
                        <input type="your_name" id="name" name="name" placeholder="Nguyen Van A" ><br><br>
                        <label for="phone">Enter a phone number:</label><br><br>
                        <input type="tel" id="phone" name="phone" placeholder="123-45-678" pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}"><br><br>
                        <small>Format: 123-45-678</small><br><br>
                    </div>
                    <div>
                        <label for="yname">Enter your message:</label><br><br>
                        <textarea name="Text1" cols="50" rows="16"></textarea>
                    </div>
                </div>
                <input type="submit" style="margin: 5% auto; display: flex; align-items: center;">
            </form>
        </div>
        <!--header-->        
    </body>
    <%@ include file="footer.jsp" %>  
</html>
