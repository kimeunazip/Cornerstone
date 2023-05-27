<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp" %>
<%
	System.out.println("detailBoard.jsp");
%>
${resultData }
		<title>게시글 상세화면 - detailBoard.jsp</title>
		<style type="text/css">
			#pwdChk{visibility:hidden;}
			#boardPwdBut{margin-botom:8px;}
			.table-height{height:200px;}
			.table-height .text-vertical{vertical-aling:middle;}
		</style>
		<script>
			let buttonCheck = "";
		
			$(function(){
				
				//1. 수정버튼 클릭 시
				$("#updateForm").click(function(){
					//get방식 - location.href = "/board/updateForm.do";
					
					//post방식
					/* $("#f_data").attr({
						"method" : "post",
						"action" : "/board/updateForm.do"
					});
					$("#f_data").submit(); */
					
					$("#pwdChk").css("visibility","visible");
					$("#msg").text("작성시 입력한 비밀번호를 입력해 주세요.").css("color","#000099");
					buttonCheck = "updateButton";
				});	
				
				//2. 삭제버튼 클릭 시
				$("#boardDelete").click(function(){
					 //post방식
					/*$("#f_data").attr({
						"method" : "post",
						"action" : "/board/deleteBoard.do"
					});
					$("#f_data").submit(); */
					$("#pwdChk").css("visibility","visible");
					$("#msg").text("작성시 입력한 비밀번호를 입력해 주세요.").css("color","#000099");
					buttonCheck = "deleteButton";
				});
				
				//+ 비밀번호 확인 버튼 클릭 시
				$("#pwdBut").click(function(){
					boardPwdConfirm();
				});
				
				$("#pwdButCancel").click(function(){
					$("pwdChk").css("visiblity","hidden");
					buttonCheck="";
				});
				
				//3. 답변버튼 클릭 시
				$("#boardReply").click(function(){
					$("#f_data").attr({
						"method":"post",
						"action":"/board/replyForm.do"
						});
					$("#f_data").submit();
				});
				//4. 목록버튼 클릭 시
				$("#boardListBtn").click(function(){
					location.href = "/board/getBoardList.do";
				});
			});
			
			function boardPwdConfirm(){
				if(!chkData("#pw","비밀번호를")) return;
				else{
					$.ajax({
							url : "/board/passwdCheck.do",
							type: "post",
							data:$("#f_pwd").serialize(),
							dataType: "text",
							error: function(){alert("시스템 오류 발생");},
							success: function(resultData){
							let goUrl = "";
							if(resultData == 0){
								$("#msg").text("비밀번호가 일치하지 않습니다.").css("color","red");
								$("#pw").select();
							}else if(resultData == 1){
								$("#msg").text("");
								console.log("비밀번호 일치");
								
								if(buttonCheck =="updateButton"){
									
									goUrl="/board/updateForm.do";
									$("#f_data").attr("action",goUrl);
									$("#f_data").submit();
									
								}else if(buttonCheck =="deleteButton"){
									
									if(confirm("정말 삭제하시겠습니까?")){
										
										goUrl = "/board/deleteBoard.do";
										$("#f_data").attr("action",goUrl);
										$("#f_data").submit();
									}
								}
							}
						}
					});
				}
			}
		</script>
	</head>
	<body>
		<div class="container">
	
			<div class="text-center">
					<h3>게시글 상세화면</h3>
			</div>
			
			<form name="f_data" id="f_data" method="post" >
				<input type="hidden" name="num" id="num" value="${detail.num }" >
			</form>
			
			<!--비밀번호 확인 버튼 및 버튼 추가 시작  -->
			<div class="row text-center" id="boardPwdBtn">
				<div class="col-md-9 text-left" id="pwdChk">
					<form name="f_pwd" id="f_pwd" class="form-inline" >
						<input type="hidden" name="num2" id="num2" value="${detail.num }" >
						<label for="password" id="f_pwd">비밀번호 : </label>
						<input type="password" name="pw" id="pw" class="form-control" />
						
						<button type="button" class="btn btn-default btn-sm" id="pwdBut" >확인</button>
						<button type="button" class="btn btn-default btn-sm" id="pwdButCancel" >취소</button>
						<span id="msg"></span>
					</form>				
				</div>
				
				<div class="col-md-3 text-right">
					<button type="button" class="btn btn-primary btn-sm" id="updateForm" >수정</button>
					<button type="button" class="btn btn-primary btn-sm" id="boardDelete" >삭제</button>
					<button type="button" class="btn btn-primary btn-sm" id="boardReply" >답변</button>
					<button type="button" class="btn btn-primary btn-sm" id="boardListBtn" >목록</button>
				</div>
			</div><!--#boardPwdBtn  -->
			
			<!--비밀번호 확인 버튼 및 버튼 추가 종료  -->
			
			<!--상세정보 보여주기 시작  -->
			<div class="text-center">
				<table class="table table-board">
					<tbody>
						<tr>
							<td class="col-md-3">글번호</td>
						
							<td class="col-md-3 text-left">${detail.num }<label>(조회수 : ${detail.readcnt })</label></td>
							<td class="col-md-3">작성일</td>
							<td class="col-md-3 text-left">${detail.writeday }</td>
						</tr>
						<tr>
							<td class="col-md-3">작성자</td>
							<td colspan="3" class="col-md-9 text-left">${detail.author }</td>
						</tr>
						<tr>
							<td class="col-md-3">글제목</td>
							<td colspan="3" class="col-md-9 text-left">${detail.title }</td>
						</tr>
						<tr>
							<td class="col-md-3">글내용</td>
							<td colspan="3" class="col-md-9 text-left">${detail.content }</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!--상세정보 보여주기 종료  -->
		</div><!--.container  -->
	</body>
</html>