<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<%
	System.out.println("loginResult.jsp입니다.");
%>
		<title>로그인 결과화면 - loginResult.jsp</title>
</head>
		<style type="text/css">
			body{
				display: grid;
				justify-items: center;
			  	align-items: center;
				color:#505050;
				background-color: #3a3a3a;
			}
			
			#main-holder {
				  width: 860px;
				  height: 900px;
				  margin:5px auto;
				  display: grid;
				  justify-items: center;
				  align-items: center;
				  background-color: white;
				  border-radius: 7px;
				  box-shadow: 0px 0px 5px 2px black;
				}
			
			.btn {
			  width: 100%;
			  padding: 7px;
			  margin:5px;
			  border: none;
			  border-radius: 5px;
			  color: white;
			  font-weight: bold;
			  background-color: #3a3a3a;
			  cursor: pointer;
			  outline: none;
			}
		</style>

		<script>
		$(function(){
			
			//내정보관리
			$("#update").click(function(){
				$("#update-form").attr({
					"method" : "post",
					"action" : "/members/membersDetail"
				});
				$("#update-form").submit();
			})
			
			//로그아웃
			$("#logout").click(function(){
				alert("로그아웃되었습니다.");
				location.href="/";
			})
			
			//회원정보관리(관리자)
			$("#admin").click(function(){
				location.href="/members/membersList";
			})
		});
		</script>
	<body>
		<main id="main-holder">
				<form name="update-form" id="update-form">
					<input type="hidden" name="num" id="num" value="${loginData.num}" /> 
					<input type="hidden" name="id" id="id" value="${loginData.id}" /> 
				
			    <h1 id="login-header">Hi, ${loginData.name}</h1>
			    
			    <c:if test= "${loginData.status == 0}">
			       <button type="button" class="btn" id="update">my account</button>
			       <button type="button" class="btn" id="logout">log out</button>
			    </c:if>
			    <c:if test= "${loginData.status == 2}">
			       <button type="button" class="btn" id="admin">members list</button>
			       <button type="button" class="btn" id="logout">log out</button>
			    </c:if>
			  </form>
		  	</main>
	</body>
</html>