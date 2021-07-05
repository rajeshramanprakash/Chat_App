<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dbutil.DButil" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  	<style type="text/css">
  		table{
  			
  		}
  		.profile_cont{
  			border: 1px dotted red;
  			text-align: center;
  		}
  		.detail_cont{
  			border: 1px ridge blue;
  		}
  		.profile_cont img{
  			width: 80%;
  		}
  		table tr th{
  			font-weight: bold;
  			font-size: 1.4vw;
  		}
  		table tr td{
  			font-size: 1vw;
  		}
		@media only screen and (max-width: 600px) {
		  body {
		    background-color: lightblue;
		  }
		}
  	</style>
  	<script type="text/javascript">
  		function myColor(){
  			var max = 0.6;
  			var min = 0.3;
  			var x = Math.floor(Math.random()*10);
  			var y = Math.floor(Math.random()*200);
  			var z = Math.floor(Math.random()*200);
  			var o = Math.random()*(max-min)+min;

  			var bgColor = "rgba("+x+","+y+","+z+","+o+")";
  			var profile_cont = document.getElementById('profile_cont');
  			profile_cont.style.backgroundColor=bgColor;
  		}
  	</script>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-sm-4 profile_cont" id="profile_cont">
			<script type="text/javascript">
				myColor();
			</script>
			<img src="unnamedpic.png">
		</div>
		<div class="col-sm-8 detail_cont">
				<div style="margin-bottom: 5%;">
					INFORMATION <a href="#">#</a>
				</div>
				<%
					DButil connection = new DButil();
					Statement statement = connection.dbconnection().createStatement();
					
					String userInfo = "select * from profile where email='"+session.getAttribute("userEmail")+"'";
					ResultSet RuserInfo =  statement.executeQuery(userInfo);
					while(RuserInfo.next()){
				%>
				<div class="container">
				<table class="table table-bordered">
					<tr class="table-info">
						<th>User Id</th>
						<th>First Name</th>
						<th>Last Name</th>
					</tr>
					<tr class="text-dark">
						<td><%= RuserInfo.getString("id") %></td>
						<td><%= RuserInfo.getString("first_name") %></td>
						<td><%= RuserInfo.getString("last_name") %></td>
					</tr>
					<tr class="table-info">
						<th>Email Address</th>
						<th>Phone Number</th>
						<th>Location</th>
					</tr>
					<tr>
						<td><%= RuserInfo.getString("email") %></td>
						<td><%= RuserInfo.getString("mob_no") %></td>
						<td><%= RuserInfo.getString("location") %></td>
					</tr>
					<tr>
						<th colspan="2" class="table-info">Operation</th>
						<td style="color: red" class="table-warning">EDIT</td>
					</tr>

				</table>

				
				</div>
				<%
					}
				%>
		</div>
	</div>
	<div style="margin-top:30px;"><center><a href="index.jsp">BACK</a></center></div>
	</div>
</body>
</html>