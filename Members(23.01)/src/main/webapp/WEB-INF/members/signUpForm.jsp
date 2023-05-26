<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<link rel="shortcut icon" href="/image/icon.png" />
		<link rel="apple-touch-icon" href="/image/icon.png" />
		<script type="text/javascript" src="/include/js/jquery-1.12.4.min.js"></script>
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		<title>회원가입양식 - singUpForm.jsp</title>
		<style type="text/css">
				html {height: 100%;}
				body{
					display: grid;
					justify-items: center;
				  	align-items: center;
					color:#505050;
					margin:40px;
					font-family: Arial, Helvetica, sans-serif;
					background-color: #3a3a3a;
				}
							
				#main-holder {
				
				  width: 90%;
				  height: 100%;
				  margin:5px;
				  padding:5px;
				  display: grid;
				  justify-items: center;
				  align-items: center;
				  background-color: white;
				  border-radius: 7px;
				  box-shadow: 0px 0px 5px 2px black;
				}
					
				.signup-table{
					width:800px;
					margin:10px;
					width: 70%;
					border-top:1px solid black;
					border-collapse: collapse;
				}			
				.btn {
				  width:130px;
				  height:50px;
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
				.signup-table{
					width:100%;
				}
				#title{
					margin:20px;
					font-size: 30px;
				}
				.text-right{
					text-align: right;
					margin-bottom:0;
				}
				.sub-title{
					font-size: 20px;
					font-weight: bold;
					margin-bottom:30px;
				}
				#signup-form{
					width:80%;
				}
				tr{
					border-bottom: 0.8px solid #DDDDDD;
				}
				th{
					color:black;
					background-color: #F8F8F8;
					padding: 10px;
					width:20%;
					height:50px;
					text-align: left;
					font-weight: normal;
					
				}
				td{
					margin:10px;
					padding: 10px;
					width:400px;
				}
				
				span{
					color:#F08282;
				}
				
				.input-text{
					width:410px;
					height:50px;
					border:0.5px solid grey;
				}
				.phone-number, select{
					width:130px;
					height:50px;
					border:0.5px solid grey;
					text-align: center;
					font-size: 15px;
				}
				
				#signup-submit{
					display:block;
					margin: 20px auto;
					padding:10px;
					width:170px;
					height:70px;
					font-size: 20px;
				}
				:root {
					accent-color: #F08282; /* checkbox */
				   	accent-color: #F08282; /* radio */
				}
				
				.check-area{
					font-size:small;
					color:grey;
				}
		</style>
		<script type="text/javascript">
		$(function(){
			//1. 본인인증 (기능구현X)
			$("#certify-check").click(function(){
				$("#certify-check-area").text("본인인증이 완료되었습니다.");
			});
			
			//2. 아이디
			$("#id-check").click(function(){
				const IdRegExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,16}$/;
			
				if(!checkExistData("#id", "아이디를")){
					$("#id-check-area").text("아이디를 입력해 주세요.");
					return false;
					
				}else if(!IdRegExp.test($("#id").val())){
					$("#id-check-area").text("영문 소문자/숫자 조합, 4~16자로 입력해 주세요.");
					$("#id").focus();
					return false;
					
				}else{
					$.ajax({
			              url : "/members/idCheck.do",
			              type: "post",
			              async:true,
			              data: "id="+$("#id").val(),
			              dataType : "text",
			              error : function(){
								alert("시스템 오류입니다.");
								return false;
							},
			              success:function(result){
			                  if(result == 0) {
			                		$("#id-check-area").text("사용 가능한 아이디입니다.");
									return true;
								}
			                  else{
									$("#id-check-area").text("이미 사용중인 아이디입니다.");
									return false;
								}
			              	}	
			          	});
					}
			});

			//3. 비밀번호
			$("#pw").keyup(function(){
				checkPw();
			});
			
			//4. 비밀번호 확인
			$("#pw-check").keyup(function(){
				if($("#pw-check").val() != $("#pw").val()){
					$("#pw-check-check-area").text("비밀번호가 일치하지않습니다.");
					return false;
				}else{
					$("#pw-check-check-area").text("비밀번호가 일치합니다.");
					return true;	
				}
			});
			
			//5. 이름
			$("#name").keyup(function(){
				const NameRegExp=/^[가-힣]{2,10}$/;
			
				if($("#name").val().replace(/\s/g,"")==""){
					$("#name-check-area").text("올바른 이름을 입력해 주세요.");
					return false;
				}else if(!NameRegExp.test($("#name").val())){
					$("#name-check-area").text("올바른 이름을 입력해 주세요.");
					return false;
				}else{
					$("#name-check-area").text("");
					return true;
				}	
			});
			
			let phoneNumber = "";
			//6. 전화번호
			$("#phone-check").click(function(){
				$("#phone-check-check").css("display","contents");
				
				phoneNumber = $('.phone-number').eq(0).val() + "-"+
								$('.phone-number').eq(1).val()+ "-"+
								$('.phone-number').eq(2).val();
				
				checkPhone(phoneNumber);				
			});
			
			//7. 약관동의
			$("#check-all").click(function() {
				if($("#check-all").is(":checked")) $("input[name=check-required]").prop("checked", true);
				else $("input[name=check-required]").prop("checked", false);
			});
			
			//8.모든 체크 함수가 true일 때 submit
			$("#signup-submit").click(function(){
				
				if(!checkCertify()) return;
				else if(!checkIdcheck())return;
				else if(!checkPwcheck()) return;
				else if(!checkNameCheck()) return;
				else if(!checkPhoneCheck()) return;
				else if(!checkAgree()) return;
				else {
					$("#signup-form").attr({
						"method":"post",
						"action":"/members/signUpMember.do"
					});
					alert("가입이 완료되었습니다. 로그인을 해 주세요.")
					$("#signup-form").submit();
				}
			});
		
});
		

//공통함수 - 공백,스페이스 제어
function checkExistData(item,msg){
if($(item).val().replace(/\s/g,"")==""){
	alert(msg+" 입력해 주세요.");
	$(item).focus();
	return false;
}
return true;
}

/*
*submit전 모든 입력과 인증이 완료됐는지 확인 후 제출하기 위한 함수들
*/ 

//1. 본인인증
function checkCertify(){
if($("#certify-check-area").text() == "본인인증이 완료되었습니다."){
	return true;
}else{
	alert("본인인증을 확인해 주세요.");	
	return false;
}
}

//2. 아이디
function checkIdcheck(){

if(!checkExistData("#id", "아이디를")){
	return false;
	
}else if($("#id-check-area").text() != "사용 가능한 아이디입니다."){
	alert("아이디 중복확인을 확인해 주세요.");	
	return false;
}
return true; 
}


//3. 비밀번호 
function checkPw() {
const PwRegExp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,16}$/;
if(!PwRegExp.test($("#pw").val())){
	$("#pw-check-area").text("영문 대문자/소문자/숫자 조합, 8~16자로 입력해 주세요.");
	return false;
}
else{
	$("#pw-check-area").text("사용 가능한 비밀번호 입니다.");
	return true;	
}
}
		
function checkPwcheck(){

if(!checkExistData("#pw", "비밀번호를")){
	return false;
}else if($("#pw-check-area").text() != "사용 가능한 비밀번호 입니다."){
	alert("비밀번호를 확인해 주세요.");	
	return false;
}else if($("#pw-check-check-area").text() != "비밀번호가 일치합니다."){
	alert("비밀번호 확인을 확인해 주세요.");
	$("#pw-check-check-area").focus();
	return false;
}
return true; 
}


//5. 이름
function checkNameCheck(){
if(!checkExistData("#name", "이름을")){
	return false;
}else if($("#name-check-area").text() == "올바른 이름을 입력해 주세요."){
	alert("이름을 확인해 주세요.");	
	return false;
}
return true;
}

//6. 휴대전화
function checkPhone(phoneNumber){

const PhoneRegExp=/^(?:(010-\d{4})|(01[1|6|7|8|9]-\d{3,4}))-(\d{4})$/;

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

//7. 약관동의
function checkAgree(){
if(!$("#check-terms").is(":checked")){
	alert("이용약관동의를 확인해 주세요.");
	return false;
}else if(!$("#check-privacy").is(":checked")){
	alert("개인정보동의를 확인해 주세요.");
	return false;
}else
	return true;
}

		</script>
	</head>
	<body>
		<div id="main-holder">
		
			<div id="title" class="text-center"><h3>회원가입</h3></div> 
			
			<form id="signup-form">
				<!-- -------------------------------------------------------------------------------- -->
				<p class="text-left sub-title">회원구분</p>
				<table class="signup-table" id="classification">
					<tr>
						<th>회원구분</th>
						<td><input type="radio" checked="checked">개인회원</td>
					</tr>
					<tr>
						<th>회원인증</th>
						<td><button type="button" class="btn" id="certify-check">본인인증</button></td>
						<td><span class="check-area" id="certify-check-area"></span> </td>
					</tr>
				</table>
				<!-- -------------------------------------------------------------------------------- -->
				<p class="text-left sub-title">가입정보</p><p class="text-right"><span class="point">*</span>표시는 반드시 입력하셔야 합니다.</p>
				<table class="signup-table" id="information">
					<tr>
						<th>아이디<span class="point">*</span></th>
						<td>
							<input type="text" class="input-text" id="id" name="id" placeholder="영문 소문자/숫자 조합, 4~16자" />
							<button type="button" class="btn" id="id-check">아이디 중복확인</button>
						</td>
						<td>
							<span class="check-area" id="id-check-area"> </span>
						</td>
					</tr>
					<tr>
						<th>비밀번호<span class="point">*</span></th>
						<td><input type="password" class="input-text" id="pw" name="pw" placeholder="영문 대문자/소문자/숫자 조합, 8~16자로 입력해 주세요." /></td>
						<td>
							<span class="check-area" id="pw-check-area"> </span>
						</td>
					</tr>
					<tr>
						<th>비밀번호 확인<span class="point">*</span></th>
						<td><input type="password" class="input-text" id="pw-check" /></td>
						<td>
							<span class="check-area" id="pw-check-check-area"> </span>
						</td>
					</tr>
					<tr>
						<th>이름<span class="point">*</span></th>
						<td><input type="text" class="input-text" id="name" name="name"/></td>
						<td>
							<span class="check-area" id="name-check-area"> </span>
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" class="input-text" id="email" name="email"/></td>
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
							<button type="button" class="btn" id="phone-check">인증번호받기</button>
							
						</td>
					</tr>
					<tr id="phone-check-check" style="display: none;">
						<th>인증번호</th>
						<td>
							<input type="text" class="input-text" id="phone-check-check-area"/>
							<button type="button" class="btn" >확인</button>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
							<input type="text" class="input-text" id="address" name="address"/>
						</td>
					</tr>
				</table>
				<!-- -------------------------------------------------------------------------------- -->
				<p class="text-left sub-title">약관동의</p>
				<table class="signup-table" id="consent">
					<tr>
						<th colspan="2"><label><input type="checkbox" id="check-all" class="check-box" />전체약관에 모두 동의합니다. </label></th>
					</tr>
					<tr>
						<td colspan="2"><label><input type="checkbox" name="check-required" id="check-terms" />[필수] 이용약관 동의</label></td>
					</tr>
					<tr>
						<td colspan="2"><label><input type="checkbox"  name="check-required" id="check-privacy"  />[필수] 개인정보 수집 및 이용 동의</label></td>
					</tr>
					<tr>
						<td colspan="2">
							<label><input type="checkbox" class="check-box" id="check-sms" />SMS</label>
							<label><input type="checkbox" class="check-box" id="check-email" />EMAIL</label>
						</td>
					</tr>
				</table>
				
				<!-- -------------------------------------------------------------------------------- -->
				<button type="button" class="btn" id="signup-submit">회원가입</button>
			</form>
		</div>
	</body>
</html>