<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="dbutil.DButil" %>
    <%@ page import="java.sql.Statement" %>
    <%@ page import="java.sql.ResultSet" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>PRODUCT</title>

<style>
	.pro_form{
		width:70%;
		box-shadow:0 0 15px black;
		border-radius:20px;
	}
	.pro_form img{
		height:90%;
		width:90%;
		margin-bottom:10px;
	}
	.pro_form form{
		margin-bottom:30px;
		background-color:skyblue;
		border-radius: 0 0 20px 20px;
	}
	.pro_form form .pro_input{
		border: 1px solid black;
		margin: 10px 0;
	}
	.pro_form form .pro_select{
		border: 1px solid black;
		margin: 20px 0 0 0;
	}
	.pro_form form .pro_submit{
		font-size:20px;
		font-weight:bold;
		color:white;
		background-color:#0066cc;
		border:1px solid white;
		border-radius:5px;
		padding:3px 5px;
		margin-bottom:30px;
	}

</style>
</head>
<body>
<%
response.setIntHeader("refresh",40);
if(session.getAttribute("userEmail")!=null){
	%>
	<div class="row" style="margin-top:30px;">
		<div class="col-sm-4">
			<center>
				<div class="pro_form">
					<img src="pro1.gif">
					<form action="product_validation.jsp" method="POST">
					<label for="category">SELECT YOUR CATEGORY : </label>
						<select name="category" class="pro_select" required>
						<% 
						DButil connection = new DButil();
						Statement statement = connection.dbconnection().createStatement();
						
						String pro_qry = "select id from profile where email='"+session.getAttribute("userEmail")+"'";
						ResultSet pro_result = statement.executeQuery(pro_qry);
						while(pro_result.next()){
							String userId = pro_result.getString("id");
							session.setAttribute("userId", userId);
						}
						
						String qry = "select * from category where user_id='"+session.getAttribute("userId")+"' order by id";
						ResultSet r = statement.executeQuery(qry);
						while(r.next()){
						%>
							<option><%= r.getString("category") %></option>
						<%
						}
						%>
						</select>
						<br>
						<label for="product">ENTER PRODUCT NAME : </label>
						<input type="text" name="product" class="pro_input" required>
						<br>
						<input type="submit" name="product_add" value="ADD PRODUCT" class="pro_submit">
					</form>
				</div>
			</center>
		</div>
		<div class="col-sm-8">demo</div>
	</div>
	<% 
	session.removeAttribute("userId");	
}else{
	%>
	<script>alert("SESSION TIMEOUT");window.location="login.jsp"</script>
	<% } %>

</body>
</html>