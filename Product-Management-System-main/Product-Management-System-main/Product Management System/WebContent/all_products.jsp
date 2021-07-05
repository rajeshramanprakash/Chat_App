<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dbutil.DButil" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="url_logo.png">
<title>All Products</title>
<style>
	.pro_details_table{
		overflow-x:auto;
	}
	.cat_btn{
		background-color:#00004d;
		padding:5px 10px;
		border-radius:5px;
		font-size:20px;
	}
</style>
</head>
<body>
<%
response.setIntHeader("refresh",40);
if(session.getAttribute("userEmail")!=null){
%>
<jsp:include page="header.jsp" />
<%

	DButil connection = new DButil();
	Statement statement = connection.dbconnection().createStatement();
	Statement statement1 = connection.dbconnection().createStatement();
	String pro_qry = "select id from profile where email='"+session.getAttribute("userEmail")+"'";
	ResultSet pro_result = statement.executeQuery(pro_qry);
	while(pro_result.next()){
		String userId = pro_result.getString("id");
		session.setAttribute("userId", userId);
	}
	
	String fetchCategory = "select * from category where user_id='"+session.getAttribute("userId")+"'";
	ResultSet ResultfetchCat = statement1.executeQuery(fetchCategory);
	int y=1;
		while(ResultfetchCat.next()){
			String cat = ResultfetchCat.getString("category");
			%>
			<center>
			<div class="panel panel-default" style="width:70%;">
			<div class="panel-heading" style="width:100%;">
        		<h4 class="panel-title">
          			<a data-toggle="collapse" data-parent="#accordion" href="#demo<%=y %>" style="color:#fff;" class="cat_btn"><%=cat %></a>
        		</h4>
      		</div>
			
			<%			
			String fetchData = "select * from product where user_id='"+session.getAttribute("userId")+"' and category='"+cat+"'";
			ResultSet ResultfetchData = statement.executeQuery(fetchData);

			int x=1;
			
				%>
				<div id="demo<%=y%>" class="panel-collapse collapse">
				
				<table class="table table-bordered panel-body pro_details_table" style="overflow-x:auto;">
				<tr>
					<th>SL. NO</th>
					<th>PRODUCT ID</th>
					<th>PRODUCT NAME</th>
					<th>CATEGORY</th>
				</tr>
				<%
				while(ResultfetchData.next()){
					%>
						<tr class="table-hover">
							<td><%= x %></td>
							<td><%= ResultfetchData.getString("product_id") %></td>
							<td><%= ResultfetchData.getString("product_name") %></td>
							<td><%= ResultfetchData.getString("category") %></td>
						</tr>
					<% x++;
				}
				%>
				</table>
				</div>
				<%
				y++;
				%>
				</div>
				</center>
				<%
		}
	%>
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