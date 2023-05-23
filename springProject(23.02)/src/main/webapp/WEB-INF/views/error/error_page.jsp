<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<%
	System.out.println("error_page.jsp입니다.");
%>
		<title>에러페이지1 - error_page.jsp</title>
		<script type="text/javascript">
			$(function(){
				$("#errorAlert").on("closed.bs.alert",function(){
					location.href="/";
				});
				$("#main").click(function(){
					location.href="/";
				});
			});
		</script>
</head>
<body>

	<!--개발자용  -->
	<h1>개발자용</h1>
	<h4>
		<c:out value="${exception.getMessage() }">
		</c:out>
	</h4>
	
	<ul>
		<c:forEach items="${exception.getStackTrace() }" var="stack">
			<li>
				<c:out value="${stack }"></c:out>
			</li>
		</c:forEach>
	</ul>
	
	<hr />
	<!--사용자용  -->
	<h1>사용자용</h1>
	<div class="alert alert-danger alert-dismissible fade in" role="alert" id="errorAlert">
		<button type="button" class="close" data-dismiss="alert" aria-label ="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<h4>예상치 못한 오류가 발생했습니다.</h4>
		<p>
			일시적인 현상이거나 네트워크 문제일 수 있으니, 잠시 후 다시 시도해 주세요.<br />
			계속 발생하는 경우 홈페이지를 통해 문의해 주세요.<br />
			감사합니다.<br />
		</p>
		<p>
		<button type="button" class="btn btn-danger" id="main">홈으로</button>
		</p>
	</div>
</body>
</html>