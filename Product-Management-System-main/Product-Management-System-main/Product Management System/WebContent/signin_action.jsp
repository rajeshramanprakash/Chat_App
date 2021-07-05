<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="dbutil.DButil" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		DButil connection = new DButil();
		Statement statement = connection.dbconnection().createStatement();
	%>
	<%
	/* ----login ---- */
	//String signin = request.Parameter("signin");
	//if(signin!=null){
		String UserEmail = request.Parameter("userEmail");
		
		String UserPasswd = request.Parameter("userPasswd");
		
		out.println(UserEmail);
		out.println(UserPasswd);
		
		//String qry2 = "select * from profile where email='"+UserEmail+"'";
		
		//ResultSet result = statement.executeQuery(qry2);
		//if(result.next()){
			//response.setHeader("Home Page", "Home.jsp");
		//}else{
			%>
				<!-- <script>alert("Email id is not registred. please enter correct email id.")</script> -->
			<%
		//}
	//}
	
	%>
</body>
</html>