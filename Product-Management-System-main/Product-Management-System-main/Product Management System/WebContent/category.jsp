<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dbutil.DButil" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="icon" href="url_logo.png">
<title>ADD CATEGORY</title>
<style>

	.cat_form{
		border: 1px solid blue;
		width:70%;
	}
	.cat_form img{
		height:100%;
		width:100%;
		margin-bottom:30px;
	}
	.cat_form form{
		margin-bottom:30px;
		margin-left:10px;
	}
	.cat_form form .cat_input{
		font-size:20px;
		border: 1px solid blue;
		width: 75%;
		border-radius:4px;
	}
	.cat_form form .cat_submit{
		font-size:20px;
		font-weight:bold;
		color:white;
		background-color:#0066cc;
		border:1px solid white;
		border-radius:5px;
		padding:3px 5px;
	}
	
	.cat_table{
		width: 90%;
	}
	.cat_table, tr, th, td{
		overflow-x:auto;
		border:1px solid black;
		text-align:center;
	}
	.cat_table tr:nth-child(even){
		background-color: #f2f2f2;
	}
	.cat_table th{
	background-color:#001a4d;
	color: #fff;
	padding: 5px 3px;
	}
	.cat_table tr .edit{
	background-color:#208000;
	border-radius:10px;
	border:1px solid #fff;
	color: #fff;
	margin:4px 0;
	}
	.cat_table tr .del{
	background-color:#e60000;
	border-radius:10px;
	border:1px solid #fff;
	color: #fff;
	margin:4px 0;
	}
	
</style>
</head>
<body>


<%
response.setIntHeader("refresh",40);
if(session.getAttribute("userEmail")!=null){
	%>
	<jsp:include page="header.jsp" />  
	
<div class="container">
	<div class="row" style="padding-top:30px;">
		<div class="col-sm-4">
			<center>
				<div class="cat_form thumbinal">
					<img src="cat_form.jpg" alt="cat_form.jpg">
					<form action="cat_validation.jsp" method="POST">
						<input type = "text" name="category" placeholder = "add category" required class="cat_input">
						<input type = "submit" value="ADD" name="cat_submit" class="cat_submit">
					</form>
				</div>
			</center>
		</div>
		<div class="col-sm-8">
			
			<%
			DButil connection = new DButil();
			Statement statement = connection.dbconnection().createStatement();
			
			String pro_qry = "select id from profile where email='"+session.getAttribute("userEmail")+"'";
			ResultSet pro_result = statement.executeQuery(pro_qry);
			while(pro_result.next()){
				String userId = pro_result.getString("id");
				session.setAttribute("userId", userId);
			}
			
			String catTbl = "Select * from category where user_id='"+session.getAttribute("userId")+"'";
			ResultSet cat_result = statement.executeQuery(catTbl);
			%>
			<center>
			<h3 style="font-weight:bold; font-family:Times New Roman;">CATEGORY DETAILS</h3>
			<hr>
			<table class="cat_table">
				<tr class="success">
					<th>SL. No</th>
					<th>CATEGORY ID</th>
					<th>CATEGORY</th>
					<th colspan="2">OPERATIONS</th>
				</tr>
			<%
			int x=1;
			while(cat_result.next()){
				%>
				<tr>
				<td><%= x+"." %></td>
				<td><%= cat_result.getString("cat_id") %></td>
				<td><%= cat_result.getString("category") %></td>
				<td><form action="action.jsp" method="get">
					<button type="submit" name="editBtn" class="edit" value="<%=cat_result.getString("cat_id")%>"><span class="glyphicon glyphicon-edit">Edit</span></button>
				</form></td>
				<td><form action="action.jsp" method="get">
					<button type="submit" name="delBtn" class="del" value="<%=cat_result.getString("cat_id")%>"><span class="glyphicon glyphicon-trash">Delete</span></button>
				</form></td>
				</tr>
				<%	x++;
			}
			%>
			</table>
			</center>
		</div>
	</div>
</div>
<%
session.removeAttribute("userId");%>
<jsp:include page="footer.jsp" />
<%}else{
	%>
	<script>alert("SESSION TIMEOUT");window.location="login.jsp"</script>
	<% } %>
</body>
</html>