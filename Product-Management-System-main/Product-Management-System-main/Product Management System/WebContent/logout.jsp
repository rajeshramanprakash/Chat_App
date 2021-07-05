<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String logout = request.getParameter("logout");
	out.println("This page will redirect to the login page after click ok button.....!");
	if(logout!=null){
		session.invalidate();
		%>
			<script>alert("LOGOUT SUCCESSFULLY")</script>
			<script>window.location="login.jsp"</script>
		<%
	}
	%>
</body>
</html>