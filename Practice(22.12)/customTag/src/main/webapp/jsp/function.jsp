<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		<title>function.jsp</title>
	</head>
	<body>
		<h1 class="wheat">JSPL function Tag </h1>
		
		<c:set var="str1" value="test String" />
		<c:set var="str2" value="<a href='${contextPath }/jsp/request.html'>여기</a>를 클릭해서 이동" />
		
		<p>str1 : ${str1 }</p>
		<p>str2 : ${str2 }</p>
		<p>str2 : ${fn:escapeXml(str2) }</p>
		<!-- -------------------------------------------------------------->
		<c:if test="${fn:contains(str1,'test') }">
			<p>text 문자열이 해당 데이터에 포함됨</p>
		</c:if>
		
		<!-- -------------------------------------------------------------->
		<p>indexOf(str1,'t') : ${fn:indexOf(str1,'t') }</p>
		<P>length(str2) : ${fn:length(str2) }</P>
		<!-- -------------------------------------------------------------->
		<c:set var="spStr" value="${fn:split(str1,' ') }" />
		<p>
			After fn:split(str1,' ') :
			
				<c:forEach var="data" items="${spstr }" varStatus="status" >
					${status.count }.${data } <br />
				</c:forEach>
		</p>
		
	</body>
</html>