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
<title>Insert title here</title>
</head>
<body>
<%
response.setIntHeader("refresh",10);
if(session.getAttribute("userEmail")!=null){
	%>
<%
	DButil connection = new DButil();
	
	Statement statement = connection.dbconnection().createStatement();
	
	/* ---------- Category form ----------- */
	
	String cat_submit = request.getParameter("cat_submit");
	if(cat_submit != null){
		String category = request.getParameter("category");
		
		String pro_qry = "select id from profile where email='"+session.getAttribute("userEmail")+"'";
		ResultSet pro_result = statement.executeQuery(pro_qry);
		while(pro_result.next()){
			String userId = pro_result.getString("id");
			session.setAttribute("userId", userId);
		}
		
		String qry1 = "select * from category where category='"+category+"' && user_id='"+session.getAttribute("userId")+"'";
		ResultSet result = statement.executeQuery(qry1);
		if(result.next()){
			%>
				<script type="text/javascript"> alert("Category is already existed")</script>
				<script>window.location="category.jsp"</script>
			<%
		}else{
			String qry = "insert into category (category, user_id) values('"+category+"','"+session.getAttribute("userId")+"')";
			int result1 = statement.executeUpdate(qry);
			if(result1==1){
		%>
			<script type="text/javascript"> alert("Category uploaded")</script>
			<script>window.location="category.jsp"</script>

		<% 
			}else{
		%>
			<script type="text/javascript"> alert("Category not uploaded")</script>
    		<script>window.location="category.jsp"</script>

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