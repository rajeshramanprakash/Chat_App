<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Footer</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
	
	.footer_ul{
		list-style-type: none;
  		margin: 0;
  		padding: 0;
  		overflow: hidden;
		display:flex;
		justify-content:center;  
		background-color:#f1f1f1;	
		height:50px;	
	}
	.ul_li{
		margin:15px 0px;
		border-right:1px solid #fff;
	}
	.ul_li:last-child{
		border:none;
	}
	.ul_li a{
		font-size:18px;
		padding:0px 10px;
  		transform: translate(-50%, -50%);
	}
	.ul_li a:hover{
		color:#fff;
		text-decoration:none;
	}
	@media screen and (max-width: 400px){
		.ul_li a{
			font-size:14px;
		}
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

  
	<div class="row" style="margin-top:40px;">
		<hr>
		
		<center>
			<img src="logo.png" height="50px" width="80px">
			<p><b>Product Management System</b></p>
		</center>
	</div>
	<div class="row">
      		<ul class="footer_ul">
		        <li class="ul_li"><a href="index.jsp">Home</a></li>
		        <li class="ul_li"><a href="category.jsp">Category</a></li>
		      	<li class="ul_li"><a href="product.jsp">Product</a></li>
		      	<li class="ul_li"><a href="all_products.jsp">Product Details</a></li>
		    </ul>
  		</div>
	<div class="row" style="background-color: #d9d9d9; padding:5px 0px;">
		<center>
			<p>Site Developed and uploaded by Students of NSTI Bangalore </p>
		</center>
	</div>
	<div class="row" style="background-color: #bfbfbf; padding: 10px 0px; color: #00004d;">
		<div class="col-sm-4">
			
  					<div id = "showtime" style="font-size:15px;text-align:center;padding-left:3px;"></div>
  					
		</div>
		<div class="col-sm-4"><center>Copyright &#169; | 2020 - All Right Reserved</center></div>
		<div class="col-sm-4"><center>Developed by Sayanti & Rakesh & Neeraj & Vishnu</center></div>
	</div>
	<script type="text/javascript">
		var realdate = new Date();

		// date setting.......

		var day = realdate.getUTCDay();
		var date = realdate.getUTCDate();
		var month = realdate.getUTCMonth();
		var year = realdate.getUTCFullYear();

		// Universal Coordinated Time(UTC) is the time set by the world time standard.....

		var days = ["Sun ","Mon ","Tue ","Wed ","Thu ","Fri ","Sat "];
		var months = ["Jan ", "Feb ", "Mar ", "Apr ", "May ", "Jun ", "Jul ", "Aug ", "Sep ", "Oct ", "Nov ", "Dec "];
		//document.getElementById("showdate").innerHTML = (", "+days[day] + ", " + months[month] + date  + ", " + year);

	
		// time setting.......

		var autosec = setInterval(clock,1000);
		function clock()
		{
			var realdate = new Date();
			var time = realdate.toLocaleTimeString();
			document.getElementById("showtime").innerHTML = (time+", "+days[day] + ", " + months[month] + date  + ", " + year);
		}
	</script>

</div>
</body>
</html>
