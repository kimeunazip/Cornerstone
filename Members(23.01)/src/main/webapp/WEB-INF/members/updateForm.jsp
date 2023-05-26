<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.members.members.vo.MembersVO"%>
<%
	System.out.println("updateForm.jsp입니다.");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<link rel="shortcut icon" href="/image/icon.png" />
		<link rel="apple-touch-icon" href="/image/icon.png" />
		<!-- <link rel="stylesheet" href="/include/css/members.css" /> -->
		<script type="text/javascript" src="/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/include/js/common.js"></script>
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		<title>회원정보수정 - updateForm.jsp</title>
		<style>
			html {height: 100%;}
				
			body {
			  height: 100%;
			  margin: 0;
			  font-family: Arial, Helvetica, sans-serif;
			  display: grid;
			  justify-items: center;
			  align-items: center;
			  background-color: #3a3a3a;
			}
			
			#main-holder {
			  width: 70%;
			  height: 90%;
			  background-color: white;
			  border-radius: 7px;
			  box-shadow: 0px 0px 5px 2px black;
			}
			#sub-holder{
			  display: grid;
			  justify-items: center;
			  align-items: center;
			}
			#button-holder{
				width:60%;
				margin:10% 38%;
			}
			.text-center{
				margin:50px;
			}
			.btn {
			  width: 20%;
			  padding: 7px;
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
				height: 30px;
				padding:7px;
				border-bottom:0.3px solid #e58f8f;
			}
			.update-input{
				font-size:12px;
				width:100%;
				border:none;
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
				console.log(phoneNumber);
				const PhoneRegExp=/^(?:(010\d{4})|(01[1|6|7|8|9]\d{3,4}))(\d{4})$/;
	
				if(!PhoneRegExp.test(phoneNumber)){
					$("#error-msg-area").text("올바른 전화번호를 입력해 주세요.");
					return false;
				}
				else{
					$("#error-msg-area").text("");
					return true;
				}
				
			}
			$(function(){
				
				
				$("#update-ok").click(function(){
					let phoneNumber = $("#phone").val();
					console.log(phoneNumber);
					if(!chkData("#pw", "비밀번호를")) return;
					else if(!chkData("#phone", "연락처를")) return;
					else if(!chkData("#email", "이메일을")) return;
					else if(!chkData("#address", "주소를")) return;
					else if(!checkPw("#pw")) return;
					else if(!checkPhone(phoneNumber)) return;
					else {
						$.ajax({
							url : "/members/updateMembers.do",
							type : "post",
							data : $("#update-form").serialize(),
							dataType : "text",
							error : function(){
								$("#error-msg-area").text("시스템 오류입니다. 잠시후 다시 시도해 주세요.");
							},
							success : function(resultData) {
								let goUrl = "";
								if (resultData == 0) {
									$("#error-msg-area").text("수정할 회원정보를 다시 확인해 주세요.");
								} else if (resultData == 1) {
									goUrl = "/members/detailMembers.do";
									$("#update-form").attr("method", "post");
									$("#update-form").attr("action", goUrl);
									$("#update-form").submit();
								}
							}
						});
					}
				});
				
				$("#unregister").click(function(){
					$("#update-form").attr("method", "post");
					$("#update-form").attr("action", "/members/unregisterForm.do");
					$("#update-form").submit();
				});
				
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
							<th>전화번호</th>
							<td>
								<input type="text" class="update-input" id="phone" name="phone" value="${updateData.phone }" />
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