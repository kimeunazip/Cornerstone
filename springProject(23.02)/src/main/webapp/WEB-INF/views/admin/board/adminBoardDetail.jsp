<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<%
	System.out.println("adminBoardDetail.jsp입니다.");
%>
		<title>관리자페이지 - 게시글 상세화면 - adminBoardDetail.jsp</title>
		<style>
			.wrapper{
				height:900px;
			    width: 70%;
			    margin: 50px auto;
			}
			#detail-div{
				height:900px;
			    width: 90%;
			    margin: 5px auto;
			}
			.btn{
			  width: 70px;
			  padding: 7px;
			  border: none;
			  border-radius: 5px;
			  color: white;
			  font-weight: bold;
			  background-color: #3a3a3a;
			  cursor: pointer;
			  outline: none;
			}
			.board_title {
				font-weight : 700;
				font-size : 22pt;
				margin : 10pt;
			}
			.board_info_box {
				color : #6B6B6B;
				margin : 20px;
			}
			
			.board_author {
				font-size : 10pt;
				margin-right : 10pt;
			}
			
			.board_date {
				font-size : 10pt;
			}
			
			.board_hit{
				font-size : 10pt;
				color:salmon;
			}
			.board_content {
				color : #444343;
				font-size : 12pt;
				height: 300px;
				overflow: auto;
				margin-top:10px;
				padding-top:30px;
				
			}
			.board_detail{
				margin: 30px 0px;
			}
			.contentBtn{
				margin-top:20px;
			}
			.mb-3{
				margin-top:30px;
			}
			#content-textarea{
				resize: none;
				height: 35px;
			}
			#comment-btn{
				background: url( "/resources/images/comment-icon.png" ) no-repeat;
				border: none;
		        width: 32px;
		        height: 32px;
		        cursor: pointer;
		        background-size: contain;
			}
			.board_file{
				display:flex;
				align-content:center;
				justify-content: center;
			}
			#b_file{
				width: 250px;
		        height: 250px;
			}
		</style>
		<script>
			$(function(){
				
				//비밀번호 입력시 enter기능 제거
				$("#b_pwd").bind("keydown",function(event){
					if(event.keyCode == 13){
						event.preventDefault();
					}
				});
				
				let pwdCheck = 0;
				$("#pwd-check").css('visibility', 'hidden');

				
				
				$("#delete-btn").click(function(){					
					$.ajax({
						url : "/board/replyCnt",
						type : "post",
						data : "b_num="+$("#b_num").val(),
						dataType : "text",
						error : function(){
							alert("ajax error!");
						},
						success : function(resultData) {
							if (resultData == 0) {
								if(confirm("정말 삭제하시겠습니까?")){
									$("#detail-form").attr({
										"method":"post",
										"action" : "/admin/board/adminBoardDelete"
									});
									$("#detail-form").submit();
								}
							}else{
								
								if(confirm("댓글이 존재합니다 .그래도 삭제하시겠습니까?")){
									$("#detail-form").attr({
										"method":"post",
										"action" : "/admin/board/adminBoardDelete"
									});
									$("#detail-form").submit();
								}
							}
						}
					});
				});
				
				//list
				$("#list-btn").click(function(){
					location.href="/admin/board/boardList"
				});
				
			});
		</script>
	</head>
	<body>
		<div class="wrapper">
			<div id="detail-div">
				<div class="board_title board_detail text-center">${detail.b_title}</div>
				<div class="board_info_box board_detail text-right">
					<span class="board_author board_detail">${detail.b_name}</span><span class="board_date">${detail.b_date}</span>
					<span class="board_hit board_detail">(${detail.b_hit} hit)</span>
				</div>
				<div class="board_file">
					<c:if test="${not empty detail.b_file }">
						<img id="b_file" src="/uploadStorage/board/${detail.b_file}"  />
					</c:if>
				</div>
				
				<div class="board_content">${detail.b_content}</div>
				<div class="contentBtn text-right">
					<button type="button" class="btn btn-success" id="delete-btn">delete</button>
					<button type="button" class="btn btn-success" id="list-btn">list</button>
				</div>
				
				<div class="contentBtn text-right" id="pwd-check">
					<form id="detail-form">
						<input type="hidden" id="b_num" name="b_num" value="${detail.b_num}" />
						<input type="hidden" name="b_file" value="${detail.b_file }" />
						<input type="hidden" name="b_thumb" value="${detail.b_thumb }" />
						
						<input type="password" id="b_pwd" name="b_pwd"/>
						<button type="button" class="btn btn-success" id="ok-btn">ok</button>
						<button type="button" class="btn btn-success" id="cancel-btn">cancel</button>
					</form>
				</div>
				
				<div class="card my-4">
				<%-- <h5 class="card-header">Leave a Comment:</h5>
					<jsp:include page="reply.jsp" />
				</div> --%>
				</div>
			</div>
		</div>
	</body>
</html>