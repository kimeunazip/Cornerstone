<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<%
	System.out.println("updateForm.jsp입니다.");
%>
		<title>회원정보 수정화면 - updateForm.jsp</title>
		<style>
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
			#sub-holder{
			  display: grid;
			  justify-items: center;
			  align-items: center;
			}
			.text-center{
				margin:50px;
			}
			.btn {
			  width: 100px;
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
			#update-table *{
			  margin:5px;
			  
			  border: none;
			  border-radius: 5px;
			  color: #3a3a3a;
			  justify-items: center;
			  align-items: center;
			}
			
			#update-table th{
				width: 100px;
				text-align: left;
			}
			#update-table td{
				width: 300px;
				height: 50px;
				padding:7px;
				border-bottom:0.3px solid #e58f8f;
			}
			.update-input{
				font-size:12px;
				width:100%;
				border:none;
			}
			
			.phone-number{
				width:50px;
				border-bottom:0.3px solid #e58f8f;
			}
			.error-msg{
			  margin:30px;
			  text-align: center;
			  font-size: 12px;
			  font-weight: bold;
			  color: #e58f8f;
			}
		</style>
		<script type="text/javascript">
			function checkExistData(item,msg){
				if($(item).val().replace(/\s/g,"")==""){
					alert(msg+" 입력해 주세요.");
					$(item).focus();
					return false;
				}
				return true;
			}
			function checkPw(item) {
				
				const PwRegExp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,16}$/;
				if(!PwRegExp.test($(item).val())){
					$("#error-msg-area").text("영문 대문자/소문자/숫자 조합, 8~16자로 입력해 주세요.");
					return false;
				}else{
					$("#error-msg-area").text("");
					return true;
				}
					
			}
			//휴대전화번호
			function checkPhone(phoneNumber){
				
					const PhoneRegExp=/^(?:(010-\d{4})|(01[1|6|7|8|9]-\d{3,4}))-(\d{4})$/;
					/*const PhoneRegExp=/^(?:(010-\d{4})|(01[1|6|7|8|9]\d{3,4}))(\d{4})$/;*/

					console.log(PhoneRegExp);
					if(!PhoneRegExp.test(phoneNumber)){
						$("#phone-check-check-area").val("올바른 전화번호를 입력해 주세요.");
						return false;
					}
					else{
						$("#phone-check-check-area").val("인증되었습니다.");
						return true;
					}
				
				}
				function checkPhoneCheck(){
					if(!checkExistData("#phone1", "전화번호를")){
						return false;
					}else if(!checkExistData("#phone2", "전화번호를")){
						return false;
					}else if(!checkExistData("#phone3", "전화번호를")){
						return false;
					}else if($("#phone-check-check-area").val() != "인증되었습니다."){
						alert("휴대전화 인증받기를 확인해 주세요.");	
						return false;
					}
					return true;
				}
				
			
			$(function(){
				
				let phoneNumber = "";
				//전화번호
				$("#phone-check").click(function(){
					$("#phone-check-check").css("display","contents");
					
					phoneNumber = $('.phone-number').eq(0).val()+"-"+
									$('.phone-number').eq(1).val()+"-"+
									$('.phone-number').eq(2).val();
					
					$("#phone").val(phoneNumber);
					console.log($("#phone").val());
					checkPhone(phoneNumber);				
				});
				
				$("#update-ok").click(function(){
					let phoneNumber = $("#phone").val();
					console.log(phoneNumber);
					if(!chkData("#pw", "password")) return;
					else if(!chkData("#phone", "phone number")) return;
					else if(!chkData("#email", "email")) return;
					else if(!chkData("#address", "address")) return;
					else if(!checkPw("#pw")) return;
					else if(!checkPhoneCheck()) return;
					else {
						$.ajax({
							url : "/members/membersUpdate",
							type : "post",
							data : $("#update-form").serialize(),
							dataType : "text",
							error : function(){
								$("#error-msg-area").text("시스템 오류입니다. 잠시후 다시 시도해 주세요.");
							},
							 success : function() {
								 $("#update-form").attr({
									 "method" : "post",
									 "action" : "/members/membersDetail"
								 });
								 $("#update-form").submit();
								}
							/* success : function(checkData) {
								let goUrl = "";
								if (checkData == 0) {
									$("#error-msg-area").text("수정할 회원정보를 다시 확인해 주세요.");
								} else if (checkData == 1) {
									goUrl = "/members/membersDetail";
									$("#update-form").attr("method", "post");
									$("#update-form").attr("action", goUrl);
									$("#update-form").submit();
								}
							} */
						});
					}
				});
				
				$("#unregister").click(function(){
					$("#update-form").attr("method", "post");
					$("#update-form").attr("action", "/members/unregisterForm");
					$("#update-form").submit();
				});
				
				//생년월일 오늘날짜 이후 선택불가
				var now_utc = Date.now() 
				var timeOff = new Date().getTimezoneOffset()*60000; 
				var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
				document.getElementById("birth").setAttribute("max", today);
			});
		</script>
</head>
<body>
<div id="main-holder">
           	<div id="sub-holder">
	           	<h2 class="text-center">회원정보수정</h2>
	        	<form id="update-form">
	        		<input type="hidden" name="num" value="${updateData.num }" >
		           	<table id="update-table">
						<tr>
							<th>회원번호</th>
							<td>${updateData.num }</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>${updateData.name }</td>
						</tr>
						<tr>
							<th>ID</th>
							<td>${updateData.id }</td>
						</tr>
						<tr>
							<th>회원비밀번호</th>
							<td><input type="password" class="update-input" id="pw" name="pw"  maxlength="20" placeholder="영문 대문자/소문자/숫자 조합, 8~16자로 입력해 주세요."/></td>
						</tr>
						<tr>
							<th>휴대전화<span class="point">*</span></th>
							<td>
								<select class="phone-number" id="phone1" name="phone1">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
								<input type="text" class="phone-number" id="phone2" name="phone2"/>
								<input type="text" class="phone-number" id="phone3" name="phone3"/>
								<button type="button" class="btn2" id="phone-check">인증</button>
								<input type="hidden" id="phone" name="phone" />
								
							</td>
						</tr>
						<tr id="phone-check-check" style="display: none;">
							<th>인증번호</th>
							<td>
								<input type="text" class="update-input" id="phone-check-check-area"/>
							</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td><input type="date" class="update-input" id="birth" name="birth" /></td>
						</tr>
						<tr>
							<th>성별</th>
							<td>
								<label>남<input type="radio" id="male" name="gender" value="M"/></label>
								<label>여<input type="radio" id="female" name="gender" value="F"/></label>
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>
								<input type="text" class="update-input" id="email" name="email" value="${updateData.email }" />
							</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>
								<input type="text" class="update-input" id="address" name="address" value="${updateData.address }" />
							</td>
						</tr>
						<tr>
							<th>회원가입일</th>
							<td>${updateData.regdate }</td>
						</tr>
					</table>
           		</form>
        	</div>
        	<div  class="error-msg">
        		<label id="error-msg-area" ></label>
        	</div>
        	<div id="button-holder">
	            <button type="button" id= "update-ok" class ="btn">정보수정</button>
	            <button type="button" id= "unregister" class ="btn">회원탈퇴</button>
            </div>
        </div>
</body>
</html>