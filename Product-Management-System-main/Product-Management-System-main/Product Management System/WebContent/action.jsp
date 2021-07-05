<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dbutil.DButil" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validation</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<%
		DButil connection = new DButil();
		Statement statement = connection.dbconnection().createStatement();
	%>

	<%
	/* ----login ---- */
	String signin = request.getParameter("signin");
	if(signin!=null){
		String UserEmail = request.getParameter("userEmail");
		
		String UserPasswd = request.getParameter("userPasswd");
		
		String qry2 = "select * from profile where email='"+UserEmail+"'";
		
		ResultSet result = statement.executeQuery(qry2);
		if(result.next()){
			String qry3 = "select * from profile where passwd='"+UserPasswd+"'";
			ResultSet result3 = statement.executeQuery(qry3);
			if(result3.next()){
				session.setAttribute("userEmail",""+UserEmail+"");
				%>
					<script>window.location='index.jsp'</script>
				<%
			}else{
				%>
					<script>alert("Please inter correct password.")</script>
					<script>window.location='login.jsp'</script>
				<%
			}
		}else{
			%>
				<script>alert("Email id is not registred. please enter correct email id.")</script>
				<script>window.location='login.jsp'</script>
			<%
		}
	}
	
	%>
	
	<%
	/* ---- Registration ---- */
	
	String signup = request.getParameter("signup");
	if(signup!=null){
		String fname = request.getParameter("fname");
	
		String lname = request.getParameter("lname");
	
		String email = request.getParameter("email");
		
		String phno = request.getParameter("phoneNo");
		
		String pswd = request.getParameter("paswd");
		
		String location = request.getParameter("location");
		
		
			String qry1 = "select * from profile where email='"+email+"'";
			ResultSet result1 = statement.executeQuery(qry1);
			if(result1.next()){
				%>
					<script>alert("This email id is already registred.")</script>
					<script>window.location='Reg.jsp'</script>
				<%
			}else{
				String sql = "insert into profile(first_name, last_name, email, mob_no, passwd, location) values('"+fname+"', '"+lname+"', '"+email+"', '"+phno+"', '"+pswd+"', '"+location+"')";
				int result2 = statement.executeUpdate(sql);
				if(result2==1){
				%>
					<script>alert("Your registration is successful.")</script>
					<script>window.location='login.jsp'</script>
				<%
				}else{
					out.println("Something went wrong.");
				}
			}
	}
	
	/* ----------------edit category-----------------------*/
	String catId = request.getParameter("editBtn");
	if(catId!=null){
		
		String pro_qry = "select id from profile where email='"+session.getAttribute("userEmail")+"'";
		ResultSet pro_result = statement.executeQuery(pro_qry);
		while(pro_result.next()){
			String userId = pro_result.getString("id");
			session.setAttribute("userId", userId);
		}
		
		String editQry = "select * from category where user_id='"+session.getAttribute("userId")+"' && cat_id='"+catId+"'";
		ResultSet resultEdit = statement.executeQuery(editQry);
		%>
		<table class="table table-bordered table-hover">
			<tr>
				<th>CATEGORY ID</th>
				<th>CATEGORY</th>
				<th><span class="glyphicon glyphicon-edit"></span></th>
			</tr>
		<%
		while(resultEdit.next()){
			%>
			<form method="get">
			<tr>
				<td><%= resultEdit.getString("cat_id") %></td>
				<input type="hidden" name="id" value="<%= resultEdit.getString("cat_id") %>">
				<td><input type="text" name="category" value="<%= resultEdit.getString("category") %>"></td>
				<td class="success"><button type="submit" name="updateBtn">UPDATE</button></td>
			</tr>
			</form>
			<%
		}
		%>
		</table>
		<%
	}
	%>
	<%
	
	/*----------------update category------------------------*/
	
	String updateBtn = request.getParameter("updateBtn");
	if(updateBtn!=null){
		String qry1 = "select * from category where category='"+request.getParameter("category")+"' && user_id='"+session.getAttribute("userId")+"'";
		ResultSet result = statement.executeQuery(qry1);
		if(result.next()){
			%>
				<script type="text/javascript"> alert("Category is already existed")</script>
				<script>window.location="category.jsp"</script>
			<%
		}else{
			String catUpdate = "update category set category = '"+request.getParameter("category")+"' where user_id='"+session.getAttribute("userId")+"' AND cat_id='"+request.getParameter("id")+"'";
			int resultUpdate = statement.executeUpdate(catUpdate);
			if(resultUpdate==1){
				%>
				<script>alert("Updated successfully"); window.location="category.jsp"</script>
				<%
			}else{
				%>
				<script>alert("Not Updated")</script>
				<%			
			}
		}
	}
	%>
	<%
	/*-----------------------------Delete Category ---------------------------------------*/
	String delBtn = request.getParameter("delBtn");
	if(delBtn!=null){
		String pro_qry = "select id from profile where email='"+session.getAttribute("userEmail")+"'";
		ResultSet pro_result = statement.executeQuery(pro_qry);
		while(pro_result.next()){
			String userId = pro_result.getString("id");
			session.setAttribute("userId", userId);
		}
		String delQry = "delete from category where cat_id='"+request.getParameter("delBtn")+"' AND user_id='"+session.getAttribute("userId")+"'";
		int resultDel = statement.executeUpdate(delQry);
		if(resultDel==1){
			%>
			<script>alert("Category is deleted successfully");window.location="category.jsp"</script>
			<%
		}else{
			%>
			<script>alert("Category Not Deleted!")</script>
			<%			
		}
	}
	%>
	<%
	/*----------------------------edit product----------------------------------------*/
	String producteditBtn = request.getParameter("proeditBtn");
	if(producteditBtn!=null){
		String pro_qry = "select id from profile where email='"+session.getAttribute("userEmail")+"'";
		ResultSet pro_result = statement.executeQuery(pro_qry);
		while(pro_result.next()){
			String userId = pro_result.getString("id");
			session.setAttribute("userId", userId);
		}
		String updateQry = "select * from product where product_id='"+request.getParameter("proeditBtn")+"' AND user_id='"+session.getAttribute("userId")+"'";
		ResultSet updateResult = statement.executeQuery(updateQry);
		%>
		<table class="table table-bordered table-hover">
			<tr class="success">
				<th>Sr. No.</th>
				<th>Product Id</th>
				<th>Product Name</th>
				<th>Category</th>
				<th></th>
			</tr>
		<%
			int x=1;
			while(updateResult.next()){
				%>
				<tr>
				<form method="post">
					<td><%= x %></td>
					<td><%= updateResult.getString("product_id") %></td>
					<input type="hidden" value="<%= updateResult.getString("product_id") %>" name="product_id">
					<td><input type=text name="product_name" value='<%= updateResult.getString("product_name") %>'></td>
					<td><%= updateResult.getString("category") %></td>
					<input type="hidden" name="category" value='<%= updateResult.getString("category") %>'>
					<td><form action="action.jsp" method="get">
					<button type="submit" name="newProeditBtn" value="btnClickd">UPDATE</button></td>
				</form>
				</tr>
				<% x++;
			}
		%>
		</table>
		<%
	}
	%>
	<%
	/*--------------------------------------update product-------------------------------------------*/
	String newProeditBtn = request.getParameter("newProeditBtn");
	if(newProeditBtn!=null){
		String pro_qry = "select id from profile where email='"+session.getAttribute("userEmail")+"'";
		ResultSet pro_result = statement.executeQuery(pro_qry);
		while(pro_result.next()){
			String userId = pro_result.getString("id");
			session.setAttribute("userId", userId);
		}
		String updatePro = "update product set product_name='"+request.getParameter("product_name")+"' where product_id='"+request.getParameter("product_id")+"' AND user_id='"+session.getAttribute("userId")+"'";
		int updateProResult = statement.executeUpdate(updatePro);
		if(updateProResult==1){
			%>
			<script>alert("Updated successfully"); window.location="product.jsp"</script>
			<%
		}else{
			%>
			<script>alert("Not Updated")</script>
			<%			
		}
	}
	%>
		<%
	/*-----------------------------Delete product ---------------------------------------*/
	String prodelBtn = request.getParameter("prodelBtn");
	if(prodelBtn!=null){
		String pro_qry = "select id from profile where email='"+session.getAttribute("userEmail")+"'";
		ResultSet pro_result = statement.executeQuery(pro_qry);
		while(pro_result.next()){
			String userId = pro_result.getString("id");
			session.setAttribute("userId", userId);
		}
		String delQry = "delete from product where product_id='"+request.getParameter("prodelBtn")+"' AND user_id='"+session.getAttribute("userId")+"'";
		int resultDel = statement.executeUpdate(delQry);
		if(resultDel==1){
			%>
			<script>alert("Product is deleted successfully");window.location="product.jsp"</script>
			<%
		}else{
			%>
			<script>alert("Category Not Deleted!")</script>
			<%			
		}
	}
	%>
</body>
</html>