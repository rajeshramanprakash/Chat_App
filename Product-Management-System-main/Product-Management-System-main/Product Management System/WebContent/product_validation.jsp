<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="dbutil.DButil" %>
    <%@ page import="java.sql.Statement" %>
    <%@ page import="java.sql.ResultSet" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.Random" %>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

if(session.getAttribute("userEmail")!=null){
	%>
<%
DButil connection = new DButil();

Statement statement = connection.dbconnection().createStatement();

String product_add = request.getParameter("product_add");
if(product_add != null){
	String category = request.getParameter("category");
	String product = request.getParameter("product");
	
	Random random = new Random();
	int num = random.nextInt(1000);
	int num1 = random.nextInt(500);
	int num2 = num+num1;
	String s = String.valueOf(num2);
	
	String id = category+"_"+s;
	
	String pro_qry = "select id from profile where email='"+session.getAttribute("userEmail")+"'";
	ResultSet pro_result = statement.executeQuery(pro_qry);
	while(pro_result.next()){
		String userId = pro_result.getString("id");
		session.setAttribute("userId", userId);
	}
	
	String qry1 = "select * from product where product_name='"+product+"' && user_id='"+session.getAttribute("userId")+"'";
	ResultSet result1 = statement.executeQuery(qry1);
	if(result1.next()){
	%>
		<script type="text/javascript"> alert("Product already existed")</script>
		<script>window.location="product.jsp"</script>

	<%		
	}else{			
		String catIdQry = "select cat_id from category where user_id='"+session.getAttribute("userId")+"' AND category='"+category+"'";
		ResultSet catIdResult = statement.executeQuery(catIdQry);
			while(catIdResult.next()){
				session.setAttribute("cat_id", catIdResult.getString("cat_id"));
			}
		
		String qry = "insert into product(product_id, category, product_name, user_id, cat_id) values('"+id+"', '"+category+"', '"+product+"','"+session.getAttribute("userId")+"', '"+session.getAttribute("cat_id")+"')";
		int qry_result = statement.executeUpdate(qry);
		if(qry_result==1){
	%>
		<script type="text/javascript"> alert("Product successfully inserted")</script>
		<script>window.location="product.jsp"</script>
	<%				
			}else{
	%>
		<script type="text/javascript"> alert("Product not inserted")</script>
		<script>window.location="product.jsp"</script>
	<%				
			}
	}

}
session.removeAttribute("userId");
%>
	<% }else{
	%>
	<script>alert("SESSION TIMEOUT");window.location="login.jsp"</script>
	<% } %>

</body>
</html>