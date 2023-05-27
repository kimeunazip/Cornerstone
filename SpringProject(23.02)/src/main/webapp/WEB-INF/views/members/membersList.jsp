<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<%
	System.out.println("membersList.jsp입니다.");
%>
		<title>회원 리스트 - membersList.jsp</title>
		<style type="text/css">
    	
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
				margin:50px;
		 	  width: 90%;
			  height: 1000px;
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
					location.href="/members/logIn";
				})
			});
		</script>
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