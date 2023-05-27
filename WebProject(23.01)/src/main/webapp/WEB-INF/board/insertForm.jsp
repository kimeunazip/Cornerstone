<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp" %>
<%
	System.out.println("insertForm.jsp");
%>
		<title>게시판 입력화면 - insertForm.jsp</title>
		
		<style type="text/css">
			.letter{letter-spacing:28px;}
			#content{resize:none;}
		</style>
		<script type="text/javascript">
			$(function(){
				let msg = "${errorMsg}";
				if(msg != ""){
					alert(msg);
				}
				
				$("#boardInsert").click(function(){
					if(!chkData("#author","이름을")) return;
					else if(!chkData("#title","제목을")) return;
					else if(!chkData("#content","작성할 내용을")) return;
					else if(!chkData("#passwd","비밀번호를")) return;
					else{
						$("#f_writeForm").attr({
							"method" : "post",
							"action" : "/board/insertBoard.do"
						});
						$("#f_writeForm").submit();
					}
				});
				
				$("#boardListBtn").click(function(){
					location.href="/board/getBoardList.do";
				});
				
			});
		</script>
	</head>
	<!------------------------------------------------------------------  -->

	<body>
		<div class="container">
		
			<div class="text-center">
				<h3>게시판 입력화면</h3>
			</div><!--.text-center  -->
				
			<form class="form-horizontal" id="f_writeForm">
				<div class="form-group">
					<label for="author" class="col-sm-2 control-label">작 성 자</label>
					<div class="col-sm-10">
						<input type="text" id="author" name="author" class="form-control" placeholder="작성자 입력" />
					</div>
				</div>
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label">글 제 목</label>
					<div class="col-sm-10">
						<input type="text" id="title" name="title" class="form-control"  placeholder="글제목 입력" />
					</div>
				</div>
				<div class="form-group">
					<label for="author" class="col-sm-2 control-label">글 내 용</label>
					<div class="col-sm-10">
						<textarea name="content" id="content" class="form-control" rows="8" ></textarea>
					</div>
				</div>
				<div class="form-group">
					<label for="passwd" class="col-sm-2 control-label">비밀번호</label>
					<div class="col-sm-10">
						<input type="password" id="passwd" name="passwd" class="form-control" maxlength="6" placeholder="비밀번호 입력" />
					</div>
				</div>
			</form>
			<div class="text-right">
				<button type="button" class="btn btn-primary" id="boardInsert">저장</button>
				<button type="button" class="btn btn-primary" id="boardListBtn">목록</button>
			</div>
		</div><!--.container  -->
	</body>
</html>