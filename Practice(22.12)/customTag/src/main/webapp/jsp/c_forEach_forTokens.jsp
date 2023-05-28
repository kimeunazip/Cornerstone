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
		<link rel="stylesheet" href="../css/custom.css" />
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		<title>c_forEach_forTokens.jsp</title>
	</head>
	<body>
		<h1 class="wheat">JSTL Core Tag : forEach</h1>
		<!--------------------------------------------------- -->
		<h2 class="lemon">1.배열처리</h2>
		<!--------------------------------------------------- -->
		<h2 class="lemon">2.1부터 100까지 합</h2>
		<!--------------------------------------------------- -->
		<h2 class="lemon">3.Map인 sessionScope 처리</h2>
		<!--------------------------------------------------- -->
		<h2 class="lemon">4.ArrayList 원소 반복</h2>
		<!--------------------------------------------------- -->
		<h2 class="lemon">5.2단부터 9단까지 출력</h2>
		<table>
			<c:forEach var="i" begin="1" end="9">
				<tr>
					<c:forEach var="j" begin="2" end="9" >
						<td>${j } * ${i } = ${i*j }</td>
					</c:forEach>
				</tr>
			</c:forEach>
		</table>
		<!--------------------------------------------------- -->
		<h2 class="lemon">6.[Map]</h2>
		<h2 class="lemon">7.[배열]</h2>
		<h2 class="lemon">8.[값을 변화시키면서 반복처리]]</h2>
		<h2 class="lemon">9.구구단</h2>
		<!--------------------------------------------------- -->
		<h1 class="wheat">JSTL Core Tag : forTokens</h1>
	</body>
</html>