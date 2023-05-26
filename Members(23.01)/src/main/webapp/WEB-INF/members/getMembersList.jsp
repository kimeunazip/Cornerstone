<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.members.members.vo.MembersVO"%>
<%
	System.out.println("getMemberList.jsp입니다.");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<link rel="shortcut icon" href="/image/icon.png" />
		<link rel="apple-touch-icon" href="/image/icon.png" />
		<link rel="stylesheet" type="text/css" href="/include/dist/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="/include/dist/css/bootstrap-theme.css"/>
		<!-- <link rel="stylesheet" href="/include/css/members.css" /> -->
		<script type="text/javascript" src="/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/include/js/common.js"></script>
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
    	<title>회원정보관리 - getMemberList.jsp</title>
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
			#main-holder {
		 	  width: 90%;
			  height: 90%;
			  display: grid;
			  justify-items: center;
			  align-items: center;
			  background-color: white;
			  border-radius: 7px;
			  box-shadow: 0px 0px 5px 2px black;
			}
			.table{
				margin:0px;
				width:900px;
			}
    	</style>
		<script>
			$(function(){
				//홈으로
				$("#go-home").click(function(){
					location.href="/members/loginResultControll.do";
				})
			});
		</script>
</head>
	</head>
	<body>
		<div id="main-holder">
			<div class="text-center">
				<h3>회원정보관리</h3>
			</div>
			
			<div id="membersList">
				<table class="table">
					<thead>
						<tr>
							<th class="col-md-1 text-center">번호</th>
							<th class="col-md-2 text-center">이름</th>
							<th class="col-md-2 text-center">아이디</th>
							<th class="col-md-2 text-center">비밀번호</th>
							<th class="col-md-2 text-center">이메일</th>
							<th class="col-md-2 text-center">전화번호</th>
							<th class="col-md-1 text-center">회원유형</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${not empty list }">
								<c:forEach var="vo" items="${list }">
									<tr class="text-center" data-num="${vo.num}">
										<td>${vo.num}</td>
										<td>${vo.name}</td>
										<td>${vo.id}</td>
										<td>${vo.pw}</td>
										<td>${vo.email}</td>
										<td>${vo.phone}</td>
										<td>
											<c:choose>
											    <c:when test="${vo.status eq 0}">
											        일반회원
											    </c:when>
											    <c:when test="${vo.status eq 2}">
											    	관리자
											    </c:when>
											    <c:otherwise>
											        탈퇴회원
											    </c:otherwise>
											</c:choose>												
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="7" class="text-center">회원 정보가 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			
			<div class="contentBtn text-right">
				<button type="button" id="go-home" class="btn">홈으로</button>
			</div>
			
		</div>
	</body>
</html>
