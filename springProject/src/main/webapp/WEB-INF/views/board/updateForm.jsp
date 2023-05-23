<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<%
	System.out.println("updateForm.jsp입니다.");
%>
		<title>게시글 수정화면 - updateForm.jsp</title>
		<style>
			.wrapper{
				height:900px;
			    width: 70%;
			    margin: 50px auto;
			}
			#update-form{
				height:700px;
			    width: 90%;
			    margin: 20px auto;
			}
			.board_title {
				font-weight : 700;
				font-size : 22pt;
				margin : 10pt;
			}
			.board_info_box {
				color : #6B6B6B;
				margin : 10pt;
			}
			
			.board_author {
				font-size : 10pt;
				margin-right : 10pt;
			}
			
			.board_date {
				font-size : 10pt;
			}
			.board_content {
				color : #444343;
				font-size : 12pt;
				height: 400px;
				overflow: auto;
			}
			.contentBtn{
				margin-top:20px;
			}
			.mb-3{
				margin-top:30px;
			}
			#update-textarea,#b_title{
				width: 100%;
			    border: 0.3px solid grey;
			    resize: none;
			}
			#update-textarea{
				height: 100%;
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
			function chkForm(item,msg){
				let message = "";
				if($(item).val()==""){
					message = "please enter " +  msg ;
					$(item).alert(message);
					return false;
				}else {
					return true;
				}
			}
			
			$(function(){
				
				
				//submit click
				$("#submit-btn").click(function(){
					
					if(!chkForm("#b_title", "title")) return;
					else if(!chkForm("#b_content", "contents")) return;
					else {
						$("#update-form").attr({
							"method":"post",
							"action" : "/board/boardUpdate",
							"enctype" : "multipart/form-data" 
						});
						$("#update-form").submit();
					}
				});
				
				//cancel click
				$("#cancel-btn").click(function(){
					location.href="/board/boardDetail?b_num="+${update.b_num };
				});
				
			});
		</script>
	</head>
	<body>
		<div class="wrapper">
			<div id="update-div">
			
				<form id="update-form">
				<input type="hidden" id="b_num" name="b_num" value="${update.b_num}" />
				<input type="hidden" id="b_name" name="b_name" value="${update.b_name}" />
				<input type="hidden" id="b_date" name="b_date" value="${update.b_date}" />
				<div class="board_title text-center">
					<input type="text" id="b_title" name="b_title" value="${update.b_title}" />
				</div>
				<div class="board_info_box text-right">
					<span class="board_author">${update.b_name}</span><span class="board_date">${update.b_date}</span>
				</div>
				<div class="board_content">
					<textarea  id="update-textarea" id="b_content" name="b_content" >${update.b_content}</textarea>
				</div>
				<label for="file">file</label>
				<input type="file" name="file" id="file"><!-- name명을 b_file이 아니라 multipart의 file이다. -->
				<div class="board_file">
					<c:if test="${not empty update.b_file }">
						<img id="b_file" src="/uploadStorage/board/${detail.b_file}" width="70px" height="50px"/>
					</c:if>
				</div>
				</form>
				
				<div class="contentBtn text-right">
					<button type="button" class="btn" id="submit-btn">submit</button>
					<button type="button" class="btn" id="cancel-btn">cancel</button>
				</div>
			</div>
		</div>
	</body>
</html>