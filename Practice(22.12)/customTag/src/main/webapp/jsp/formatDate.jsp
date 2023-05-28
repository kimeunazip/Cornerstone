<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		<link rel="stylesheet" href="../css/custom.css" />
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		<title>formatDate.jsp</title>
	</head>
	<body>
		<h1 class="wheat">formatDate</h1>
		<!---------------------------------------  -->
		<c:set var="now" value="<%= new java.util.Date() %>" />
		
		<!---------------------------------------  -->
		<h2 class="lemon">formatDate type=""</h2>
		<p>
			<fmt:formatDate type="date" value="${now }"/><br />
			<fmt:formatDate type="time" value="${now }"/><br />
			<fmt:formatDate type="both" value="${now }"/><br />
		</p>
		<!---------------------------------------  -->
		<h2 class="lemon">
			formatDate dateStyle=""  /  formatDate timeStyle=""
		 </h2>
		<p>
			<fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${now }"/><br />
			<fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${now }"/><br />
			<fmt:formatDate type="both" dateStyle="long" timeStyle="long" value="${now }"/><br />
		</p>
		<!---------------------------------------  -->
		<h2 class="lemon">formatDate pattern=""</h2>
		<p>
			<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${now }" /><br />
		</p>
		<!---------------------------------------  -->
		<h2 class="lemon">parseDate</h2>
		<p>
			<fmt:parseDate var="date" pattern="yyyy-MM-dd HH:mm:ss" value="2023-01-27 13:00:00" /><br />
			<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm:ss" value="${date }" /><br />
		</p>
			
	</body>
</html>