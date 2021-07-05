<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dbutil.DButil" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="url_logo.png">
<title>Home</title>
</head>
<body>
<%
response.setIntHeader("refresh",40);
if(session.getAttribute("userEmail")!=null){
	%>
	<jsp:include page="header.jsp" /> 
	<div style="margin-top:30px;"><center><a href="profile.jsp">VIEW PROFILE</a></center></div>
	<%session.removeAttribute("userId"); %>
		<jsp:include page="footer.jsp" />
	
	<%
}else{
	%>
	<script>alert("SESSION TIMEOUT");window.location="login.jsp"</script>
	<% 
}
	%>
	
</body>
</html>