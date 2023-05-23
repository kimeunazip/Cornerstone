<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<%
	System.out.println("membersDetail.jsp 입니다.");
	
%>
		<title>회원정보 상세화면 - membersDetail.jsp</title>
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
			  width: 30%;
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
			.btn-small{
			  width: 50px;
			  padding: 7px;
			  margin: 5px;
			  border: none;
			  border-radius: 5px;
			  color: white;
			  font-weight: bold;
			  background-color: #3a3a3a;
			  cursor: pointer;
			  outline: none;
			}
			#detail-table, #pw-check{
			  width: 90%;
			  margin:5px;
			  border: none;
			  border-radius: 5px;
			  color: #3a3a3a;
			  display:grid;
			  justify-items: center;
			  align-items: center;
			}
			
			#detail-table *{
			  
			  margin:5px;
			  border: none;
			  border-radius: 5px;
			  color: #3a3a3a;
			  justify-items: center;
			  align-items: center;
			}
			
			#detail-table th{
				width: 100px;
				text-align: left;
			}
			#detail-table td{
				width: 300px;
				height: 30px;
				padding:7px;
				border-bottom:0.3px solid #e58f8f;
			}
			#pw{
				clear:both;
				margin : 5px;
				border:0.5px solid grey;
				border-radius: 7px;
			}
			#pw-label{
				margin-left:20px;
			}
			.error-msg{
			  text-align: right;
			  padding: 5px;
			  margin-left:100px;
			  font-size: 12px;
			  font-weight: bold;
			  color: #e58f8f;
			}
		</style>
		<script type="text/javascript">
			$(function(){
				
				//회원수정 버튼 클릭 시
				$("#update").click(function(){
					$("#pw-check").css('visibility', 'visible')
				});
				
				//비밀번호 확인창
				$("#pw-check-cancel").click(function(){
					$("#pw-check").css('visibility', 'hidden')
				});
				
				$("#pw-check-ok").click(function(){
					if (!chkData("#pw","비밀번호를")) return;
					else {
						$.ajax({
							url : "/members/checkPwd",
							type : "post",
							data : $("#pw-check-form").serialize(),
							dataType : "text",
							error : function(){
								$("#error-msg-area").text("시스템 오류입니다.잠시후 다시 시도해 주세요.");
							},
							success : function(checkData) {
								let goUrl = "";
								if (checkData == 0) {
									$("#error-msg-area").text("비밀번호를 확인해 주세요.");
								} else if (checkData == 1) {
									goUrl = "/members/updateForm";
									$("#pw-check-form").attr("method", "post");
									$("#pw-check-form").attr("action", goUrl);
									$("#pw-check-form").submit();
								}
							}
						});
					}
				});
				
			});
		</script>
</head>
<body>
	<div id="main-holder">
           	<h2 class="text-center">회원정보관리</h2>
			<table id="detail-table">
				<tr>
					<th>회원번호</th>
					<td>${detailData.num }</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${detailData.name }</td>
				</tr>
				<tr>
					<th>ID</th>
					<td>${detailData.id }</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${detailData.phone }</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>${detailData.birth }</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>${detailData.gender }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${detailData.email }</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${detailData.address }</td>
				</tr>
				<tr>
					<th>회원가입일</th>
					<td>${detailData.regdate }</td>
				</tr>
			</table>
					
			<div id="pw-check" style="visibility:hidden;">
				<form name="pw-check-form" id="pw-check-form" class="form-inline" >
					<input type="hidden" name="num" id="num" value="${detailData.num }" />
					<label class="error-msg" id="error-msg-area"></label><br/>
					<label id="pw-label" >비밀번호</label><input type="password" name="pw" id="pw"/>
					<button type="button" class="btn-small" id="pw-check-ok" >확인</button>
					<button type="button" class="btn-small" id="pw-check-cancel" >취소</button>
					<span id="msg"></span>
				</form>
			</div>		
            <button type="button" id= "update" class ="btn">정보수정</button>
		</div>
</body>
</html>