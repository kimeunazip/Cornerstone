<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp" %>
<%
	System.out.println("updateForm.jsp");
%>
		<title>게시글 수정화면 - updateForm.jsp</title>
		<script type="text/javascript">
			$(function(){
				let msg = "${errorMsg}";
				if(msg != ""){
					alert(msg);
				}
				
				$("#boardUpdate").click(function(){
					
					if(!chkData("#title","제목을")) return;
					else if(!chkData("#content","작성할 내용을")) return;
					else{
						$("#f_updateForm").attr({
							"method" : "post",
							"action" : "/board/updateBoard.do"
						});
						$("#f_updateForm").submit();
					}
				});
				
				$("#boardListBtn").click(function(){
					location.href="/board/getBoardList.do";
				});
				
			});
		</script>
		<style>
			#content{
				resize:none;
			}
		</style>
	</head>
	<body>
		<div class="container">
		
			<div class="text-center">
				<h3>게시글 수정화면</h3>
			</div>
			
			<div class="text-center">
			
				<form class="form-horizontal" name="f_updateForm" id="f_updateForm">
				
					<!--글번호 hidden -->
					<input type="hidden" name="num" value="${updateData.num }" >
					<!--글번호 hidden -->
					
					<table class="table table-borderd">
						<tr>
							<td class="text-center">글번호</td>
							<td class="text-left">${updateData.num }<span>(조회수 : ${updateData.readcnt })</span></td>
							<td class="text-center">작성일</td>
							<td class="text-left">${updateData.writeday }</td>
						</tr>
						<tr>
							<td class="text-center">작성자</td>
							<td colspan="3" class="text-left">${updateData.author }</td>
						</tr>
						<tr>
							<td class="text-center">글제목</td>
							<td colspan="3" class="text-left">
								<input type="text" id="title" name="title"  value="${updateData.title }" />
							</td>
						</tr>
						<tr>
							<td class="text-center">글내용</td>
							<td colspan="3" class="text-left">
								<textarea name="content" id="content" class="form-control" rows="8">${updateData.content }</textarea>
							</td>
						</tr>
						<tr>
							<td class="text-center">비밀번호</td>
							<td colspan="3" class="text-left">
								<input type="password" id="passwd" name="passwd" class="form-control" placeholder="새로운 비밀번호 입력" />
							</td>
						</tr>
					</table>
				</form>
			</div>
			
			<div class="text-right">
				<button type="button" class="btn btn-primary" id="boardUpdate">수정</button>
				<button type="button" class="btn btn-primary" id="boardListBtn">목록</button>
			</div>
			
		</div><!--.container  -->
			
		
			<!--상세정보 보여주기 시작  -->
			<!--<div class="text-center">
				<table class="table table-board">
					<tbody>
						<tr>
							<td class="col-md-3">글번호</td>
							<td class="col-md-3 text-left">${updateData.num }<label>(조회수 : ${updateData.readcnt })</label></td>
							<td class="col-md-3">작성일</td>
							<td class="col-md-3 text-left">${updateData.writeday }</td>
						</tr>
						<tr>
							<td class="col-md-3">작성자</td>
							<td colspan="3" class="col-md-9 text-left">${updateData.author }</td>
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
			</div> -->
			<!--상세정보 보여주기 종료  -->
			 
	</body>
</html>