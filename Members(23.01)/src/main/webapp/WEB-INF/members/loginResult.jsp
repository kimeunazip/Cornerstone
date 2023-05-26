<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.members.members.vo.MembersVO"%>
<%
	System.out.println("loginResult.jsp입니다.");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<link rel="shortcut icon" href="/image/icon.png" />
		<link rel="apple-touch-icon" href="/image/icon.png" />
		<!-- <link rel="stylesheet" href="/include/css/members.css" /> -->
		<script type="text/javascript" src="/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/include/js/common.js"></script>
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->

    <title>로그인페이지 - loginResult.jsp</title>
	<style type="text/css">
		
			html {
			  height: 100%;
			}
			
			body {
			  height: 100%;
			  margin: 0;
			  font-family: Arial, Helvetica, sans-serif;
			  display: grid;
			  justify-items: center;
			  align-items: center;
			  background-color: #3a3a3a;
			}
			
			#main-holder {
		 	  width: 70%;
			  height: 90%;
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
					"action" : "/members/detailMembers.do"
				});
				$("#update-form").submit();
			})
			
			//로그아웃
			$("#logout").click(function(){
				alert("로그아웃되었습니다.");
				location.href="/members/loginForm.do";
			})
			
			//회원정보관리(관리자)
			$("#admin").click(function(){
				location.href="/members/getMembersList.do";
			})
		});
		</script>
</head>
	<body>
	
		<main id="main-holder">
			<form name="update-form" id="update-form">
				<input type="hidden" name="num" id="num" value="${loginData.num}" /> 
				<input type="hidden" name="id" id="id" value="${loginData.id}" /> 
			
		    <h1 id="login-header">안녕하세요, ${loginData.name} 님</h1>
		    
		    <c:if test= "${loginData.status == 0}">
		       <button type="button" class="btn" id="update">내정보관리</button>
		       <button type="button" class="btn" id="logout">로그아웃</button>
		    </c:if>
		    <c:if test= "${loginData.status == 2}">
		       <button type="button" class="btn" id="admin">회원정보관리</button>
		       <button type="button" class="btn" id="logout">로그아웃</button>
		    </c:if>
		  </form>
	  	</main>
	  	
		
	</body>
</html>