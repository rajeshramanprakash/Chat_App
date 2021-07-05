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

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
<link rel="icon" href="url_logo.png">
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
		border-radius: 20px 20px 0 0;
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
	.pro_table{
		width: 90%;
	}
	.pro_table, tr, th, td{
		overflow-x:auto;
		border:1px solid black;
		text-align:center;
	}
	.pro_table tr:nth-child(even){
		background-color: #f2f2f2;
	}
	.pro_table th{
	background-color:#001a4d;
	color: #fff;
	padding: 5px 3px;
	}
	.pro_table tr .edit{
	background-color:#208000;
	border-radius:10px;
	border:1px solid #fff;
	color: #fff;
	margin:4px 0;
	}
	.pro_table tr .del{
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
					Statement statement1 = connection.dbconnection().createStatement();
					Statement statement2 = connection.dbconnection().createStatement();
					Statement statement3 = connection.dbconnection().createStatement();

					String pro_qry = "select * from profile where email='"+session.getAttribute("userEmail")+"'";
					ResultSet pro_result = statement1.executeQuery(pro_qry);
					while(pro_result.next()){
						String userId = pro_result.getString("id");
						session.setAttribute("userId", userId);
					}
					
					String qry = "select * from category where user_id='"+session.getAttribute("userId")+"' order by cat_id";
					ResultSet r = statement2.executeQuery(qry);
					while(r.next()){
						//session.setAttribute("proCategory", r.getString("cat_id"));
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
	
	<div class="col-sm-8">	
	<center>
		<div class="products">
		<h3 style="font-weight:bold; font-family:Times New Roman;">PRODUCT DETAILS</h3>
		<hr>
			<table class="pro_table">
				<tr class="success">
					<th>SL. No</th>
					<th>PRODUCT ID</th>
					<th>PRODUCT NAME</th>
					<th>CATEGORY</th>
					<th colspan="2">OPERATIONS</th>
				</tr>
				<%
					int x = 1;
					String productQry = "select * from product where user_id='"+session.getAttribute("userId")+"'";
					ResultSet productResult = statement3.executeQuery(productQry);
					while(productResult.next()){ %>
						<tr>
							<td><%= x %></td>
							<td><%= productResult.getString("product_id") %></td>
							<td><%= productResult.getString("product_name") %></td>
							<td><%= productResult.getString("category") %></td>
							<td><form action="action.jsp" method="get">
								<button type="submit" name="proeditBtn" value="<%=productResult.getString("product_id") %>" class="edit"><span class="glyphicon glyphicon-edit">Edit</span></button>
							</form></td>
							<td><form action="action.jsp" method="get">
								<button type="submit" name="prodelBtn" value="<%=productResult.getString("product_id") %>" class="del"><span class="glyphicon glyphicon-trash">Delete</span></button>
							</form></td>
						</tr>
						<%
						x++;
					}
				%>
			</table>
		</div>
		</center>
	</div>	
	
</div>
	
	<% 
	session.removeAttribute("userId");	%>
	<jsp:include page="footer.jsp" />
<%	
}else{
	%>
	<script>alert("SESSION TIMEOUT");window.location="login.jsp"</script>
	<% } %>

</body>
</html>