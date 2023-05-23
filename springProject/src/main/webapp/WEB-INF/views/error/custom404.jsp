<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<%
	System.out.println("custom404.jsp 입니다.");
%>
		<title>에러페이지2 - custom404.jsp</title>
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
	<div class="alert alert-warning alert-dismissible fade in" role="alert" id="errorAlert">
		<button type="button" class="close" data-dismiss="alert" aria-label ="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<h4>잘못된 URL을 요청하셨습니다.</h4>
		<p>
			해당 URL은 존재하지 않습니다. 잠시 후 다시 접근해주세요.<br />
		</p>
		<p>
		<button type="button" class="btn alert-warning" id="main">홈으로</button>
		</p>
	</div>
</body>
</html>