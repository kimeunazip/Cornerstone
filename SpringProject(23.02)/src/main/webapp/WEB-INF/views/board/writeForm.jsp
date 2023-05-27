<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<%
	System.out.println("writeForm.jsp입니다.");
%>
		<title>게시글 입력화면 - writeForm.jsp</title>
		<style>
			.contentBtn{
				margin-top:20px;
			}
			.mb-3{
				margin-top:30px;
			}
			#b_content{
				resize: none;
				overflow: visible;
			}
			.wrapper{
				height: 900px;
			    width: 70%;
			    margin: 10px auto;
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
			#b_content{
				height:350px;
			}
			
		</style>
		<script>
			function chkForm(item,msg){
				let message = "";
				if($(item).val().replace(/\s/g,"")==""){
					message = "please enter " +  msg ;
					$(item).attr("placeholder",message);
					return false;
				}else {
					return true;
				}
			}
			
			function chkFile(item){
			/* 	let fileName = $(item).val();
				let index = filName.lastIndexOF(".")
				let Extension = fileName.substring(index+1,fileName.length); */
				let ext = item.val().split('.').pop().toLowerCase();
				if(jQuery.inArray(ext,['gif','png','jpg']) == -1){
					alert("이미지 파일만 업로드할 수 있습니다.");
					item.val("");
					return false;
				}else{
					return true;
				}
			}
			$(function(){
				
				$("#submit-btn").click(function(){
					
					if(!chkForm("#b_title","title"))return;
					else if(!chkForm("#b_name","author"))return;
					else if(!chkForm("#b_content","contents"))return;
					else if(!chkForm("#b_pwd","password"))return;
					else{
						if($("#file").val()!=""){
							if(!chkFile($("#file"))) return;
						}
						//이미지파일만 받기
						$("#write-form").attr({
							"method" : "post",
							"action" : "/board/boardInsert",
							"enctype" : "multipart/form-data" //enctype의 기본값이 application/x...이므로 변경
						});
						$("#write-form").submit();
					}
				});
				
				$("#cancel-btn").click(function(){
					$("#write-form").each(function(){
						this.reset();
					});
					location.href="/board/boardList";
				});
			})
		</script>
	</head>
	<body>
			<div class="wrapper" role="main">
				<h2>New Post</h2>
				<form name="write-form" id="write-form">
					<div class="mb-3">
						<label for="b_title">title</label>
						<input type="text" class="form-control" name="b_title" id="b_title" >
					</div>
	
					<div class="mb-3">
						<label for="b_name">author</label>
						<input type="text" class="form-control" name="b_name" id="b_name">
					</div>
	
					<div class="mb-3">
						<label for="b_content">content</label>
						<textarea class="form-control" rows="5" name="b_content" id="b_content" ></textarea>
					</div>
					
					<div class="mb-3">
						<label for="file">file</label>
						<input type="file" name="file" id="file"><!-- name명을 b_file이 아니라 multipart의 file이다. -->
					</div>
					
					<div class="mb-3">
						<label for="b_pwd">password</label>
						<input type="password" class="form-control" name="b_pwd" id="b_pwd">
					</div>
	
				</form>

				<div class="contentBtn text-right">
					<button type="button" class="btn btn-success" id="submit-btn">submit</button>
					<button type="button" class="btn btn-success" id="cancel-btn">cancel</button>
				</div>
			</div>
		</body>
</html>