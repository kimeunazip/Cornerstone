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
		<title>formatNumber.jsp</title>
	</head>
	<body>
		<h1 class="wheat">formatNumber</h1>
		<p>
			<c:set var="price" value="10000" />
			<fmt:formatNumber value="${price }" type="number" var="numberType" /><br />
			
			<label>숫자 : ${numberType }</label> <br />
			<label>통화 : <fmt:formatNumber value="${price }" type="currency" currencySymbol="$" /></label><br/>
			
			<c:set var="price" value="0.85" />
			<label>퍼센트 : <fmt:formatNumber value="${price }" type="percent" groupingUsed="false"/></label><br/>
			
			<c:set var="price" value="10000" />
			<label>패턴 : <fmt:formatNumber value="${price }" pattern="00000000.00"/></label><br/>
		</p>
		<!---------------------------------------  -->
		<p>
			<fmt:formatNumber value="4578.8743" type="number" maxIntegerDigits="3" /><br />
			<fmt:formatNumber value="2" type="number" minIntegerDigits="2" groupingUsed="false" /><br />
			<fmt:formatNumber value="4578.8743" type="number" maxFractionDigits="2" /><br />
			<fmt:formatNumber value="4578" type="number" minFractionDigits="1" /><br />
		</p>
		<!---------------------------------------  -->
		<h1 class="wheat">parseNumber</h1>
		<p>
			<fmt:parseNumber value="1,234.56" pattern="000,000.00" var="num1"/><br />
			<fmt:parseNumber value="123" var="num2"/><br />
			<fmt:formatNumber value="${num1 +num2 }" type="number" /><br />
		</p>
		<!---------------------------------------  -->
	</body>
</html>