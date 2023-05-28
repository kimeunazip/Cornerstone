<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<link rel="shortcut icon" href="../image/icon.png" />
		<link rel="apple-touch-icon" href="../image/icon.png" />
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript">
			function importNaver{
				$("#naver").attr("style","visiblity:visible")
				
			}
		</script>
		<title>c_import.jsp</title>
	</head>
		<h1 class='wheat'>JSTL Core Tag : import</h1>
		<!--------------------------------------------------- -->
		<div class="target">
			<c:import url="c_forEach_forTokens.jsp" />
			<hr />
		</div>
		<c:import url="c_settarget.jsp" var="target" />
		<!--------------------------------------------------- -->
		<%--<div class="target">
			<c:import url="if.jsp" context="/customTag" >
				 <c:param name="jumsu" value="90" />
				<c:param name="jumsu" value="90" />
				<c:param name="jumsu" value="90" /> 
			</c:import>
			<hr />
		</div>--%>
		<!--------------------------------------------------- -->
		<div class="target">
			${target }
		</div>
		<hr />
		
		<!--------------------------------------------------- -->
		<input type="button" onclick="importNaver()" id="naverBtn" value="import NAVER" />
		<c:import url="https://www.naver.com" var="naver" />
		<div class="naver" id="naver" hidden="hidden"> ${naver } </div>
		<!--------------------------------------------------- -->
</html>