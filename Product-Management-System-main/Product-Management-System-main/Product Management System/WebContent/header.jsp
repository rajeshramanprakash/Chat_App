<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="dbutil.DButil" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&display=swap" rel="stylesheet">


<title>Header</title>
<style>
#nb {
background-color:gray;
background-repeat: no-repeat;
height:110px;
}

#nb a {
color:#FFA07A;

}
.outSideProName{
	font-size:3vw;
	padding-top:45px;
	font-family: 'Abril Fatface', cursive;
}
.proName{
	display: none;
}

.topLogoCont{
	margin-bottom: 0px;
}
ul li a{
	font-size:18px;
}
ul li button{
margin-top:12px;
}
@media screen and (max-width: 620px){
	a.outSideProName{
		display: none;
	}
	ul li button{
		padding:0 20px;
	}
}
@media screen and (max-width: 620px) {
  .proName {
  	font-size: 5vw;
    color: white;
    display: inline;
  }
  }
 @media screen and (max-width: 300px) {
  .proName {
  	font-size: 16px;
    color: white;
    display: inline;
  }
  }
</style>
</head>
<body>
	<nav class="navbar topLogoCont" id="nb">
	<span><a class="navbar-brand" href="#"><img src="logo.png" alt="logo.png" height="80px" width="150px"></a></span>
	<span><a class="navbar-brand outSideProName" href="#">Product Management System</a></span>
	</nav>
<nav class="navbar navbar-inverse">
	<a class="navbar-brand proName" href="#">Product Management System</a>
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="index.jsp">Home</a></li>
        <li><a href="category.jsp">Category</a></li>
      	<li><a href="product.jsp">Product</a></li>
      	<li><a href="all_products.jsp">Product Details</a></li>
      </ul>
      	<%
		if(session.getAttribute("userEmail")!=null){
			/*------------------------------------------------------*/
			DButil connection = new DButil();
			Statement statement = connection.dbconnection().createStatement();
			/*------------------------------------------------------*/
			%>
      <ul class="nav navbar-nav navbar-right">
      <form method="post" action="logout.jsp">
        <li><button type="submit" name="logout"><span class="glyphicon glyphicon-log-out"></span> logout</button></li>
        </form>
      </ul>
      <%
		}else{
			%>
				<script>alert("SESSION TIMEOUT")</script>
				<script>window.location="login.jsp"</script>
			<%
		}
	%>
    </div>
  </div>
</nav>
</body>
</html>