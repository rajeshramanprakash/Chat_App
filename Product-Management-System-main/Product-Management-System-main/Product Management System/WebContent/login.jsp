<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="url_logo.png">
<title>Sign In</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style type="text/css">
		*{
			font-family: 'Times New Roman';
			font-size: 22px;
		}
		.container{
			padding: 10px;
		}
	 	.submitbtn:hover{
	 		color:  white;
	 		background: #0e27e6;
	 	}
	 	.fpaswd, .fpaswd.a{
	 		font-size: 14px;
	 	}
	 	.login-form{
	 		padding-left: 10px;
	 	}
	 	.thumbnail{
	 		background: -webkit-linear-gradient(left, #3931af, #00c6ff);
	 	}
	  </style>
</head>
<body>

	  <script>
  window.watsonAssistantChatOptions = {
      integrationID: "f1f409f8-9d9f-41dc-89a1-5cb87a05b69d", // The ID of this integration.
      region: "eu-gb", // The region your integration is hosted in.
      serviceInstanceID: "e9d0c203-e691-44e2-a3db-0a311dc47783", // The ID of your service instance.
      onLoad: function(instance) { instance.render(); }
    };
  setTimeout(function(){
    const t=document.createElement('script');
    t.src="https://web-chat.global.assistant.watson.appdomain.cloud/loadWatsonAssistantChat.js";
    document.head.appendChild(t);
  });
</script>
	
<%
if(session.getAttribute("userEmail")!=null){
	%>
	 	<script>alert("One user already logged In!");window.location="index.jsp"</script> 
	<%
}
%>

	<div class="container">
		<div class="thumbnail">
			<div class="row container">
				<div class="col-md-4">
					<form method="post" class="login-form" action="action.jsp">
						<div class="form-group">
							<label for="email" style="color: white;">EMAIL : </label>
							<input type="email" id="email" name="userEmail" class="form-control" placeholder="Enter registred Email id. . ." style="font-size: 14px;" required/>
						</div>
						<div class="form-group">
							<label for="password" style="color: white;">PASSWORD : </label>
							<input type="password" id="password" name="userPasswd" class="form-control" placeholder="Password. . ." style="font-size: 14px;" required/>
						</div>
						<button type="submit" name="signin" class="form-control submitbtn" style="font-size: 16px; font-weight: bold; color: white; background: #0062cc;">Sign In</button>
						
						<hr/>
						<span class="fpaswd" style="color: white;"><a href="reg.jsp" style="font-size: 14px; color: yellow; text-decoration: none;">click here</a> for new registration</span>
						<hr/>
						<span class="fpaswd" style="color: white;">*forgot password...<a href="#" style="font-size: 14px; color: yellow; text-decoration: none;">Click Here</a></span>
						<hr/>
					</form>
				</div>
				<div class="col-md-8">
					<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
					  <div class="carousel-indicators">
					    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
					    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
					    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
					  </div>
					  <div class="carousel-inner">
					    <div class="carousel-item active">
					      <img src="img1.jpg" class="d-block img-fluid" width="100%" height="auto" alt="image">
					    </div>
					    <div class="carousel-item">
					      <img src="img1.jpg" class="d-block img-fluid" width="100%" height="100%" alt="image">
					    </div>
					    <div class="carousel-item">
					      <img src="img1.jpg" class="d-block img-fluid" width="100%" height="auto" alt="image">
					    </div>
					  </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<script>
    window.location.hash = "no-back-button";

    // Again because Google Chrome doesn't insert
    // the first hash into the history
    window.location.hash = "Again-No-back-button";

    window.onhashchange = function(){
        window.location.hash = "no-back-button";
    }
</script>
	
</body>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>
</html>
