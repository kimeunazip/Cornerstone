<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HttpSession hs = request.getSession();
	String id = (String) hs.getAttribute("id");
%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
      
      <link rel="shortcut icon" href="../img/heart.svg" />
      <link rel="apple-touch-icon" href="../img/heart.svg" />
      <script type="text/javascript" src="../js/jquery-3.6.2.min.js"></script>
      <script type="text/javascript" src="../js/euna`s.js"></script>
      
      <!--[if lt IE 9]>
      <script src="../js/html5shiv.js"></script>
      <![endif]-->
     
      <style type="text/css">
      	.salmon{
      		color:salmon;
      	}
      	a{
      		text-decoration: none;
      		background-color: grey;
      		color:white;
      		
      	}
      	</style>
      	
     	<title>loginResult.jsp</title>
   </head>
	<body>
		<h1>LOGIN SUCCESS!</h1>
		<h2>Welcome,<span class='salmon'><%=id%></span></h2>
		<h2><a href="../jsp/Modify.jsp" >Account Modify</a></h2>
	</body>
</html>