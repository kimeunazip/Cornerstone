<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% System.out.println("loginForm.jsp 입니다.");
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
        <title>로그인,회원가입 - loginForm.jsp</title>
		<style type="text/css">
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
			.text-center{
				text-align: center;
			}
			#main-holder {
			  width: 70%;
			  height: 90%;
			  display: grid;
			  justify-items: center;
			  align-items: center;
			  background-color: white;
			  border-radius: 7px;
			  box-shadow: 0px 0px 5px 2px black;
			}
			
			#login-form {
			  align-self: flex-start;
			  display: grid;
			  justify-items: center;
			  align-items: center;
			}
			
			.login-form-field::placeholder {
			  color: #3a3a3a;
			}
			
			.login-form-field {
			  width: 100%;
			  height:50px;
			  font-size:16px;
			  border: none;
			  border-bottom: 1px solid #3a3a3a;
			  margin-bottom: 10px;
			  border-radius: 3px;
			  outline: none;
			  padding: 0px 0px 5px 5px;
			}
			
			.login-form-submit {
			  width: 100%;
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
			.btn{
			  width: 100%;
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
			#login-error-msg-holder {
			  width: 100%;
			  height: 100%;
			  display: grid;
			  justify-items: center;
			  align-items: center;
			}
			
			#login-error-msg {
			  width: 50%;
			  text-align: center;
			  margin: 0;
			  padding: 5px;
			  font-size: 12px;
			  font-weight: bold;
			  color: #e58f8f;
			  opacity: 0;
			}
			
			#error-msg-area {
			  display: block;
			}
			#admin{
				color: #FFFFF1;
				cursor: help;
			}
		</style>
		<script type="text/javascript">
			$(function(){
				$("#login").click(function(){
					if(!chkData("#id","아이디를")) return;
					else if (!chkData("#pw","비밀번호를")) return;
					else {
						$.ajax({
							url : "/members/loginCheck.do",
							type : "post",
							data : $("#login-form").serialize(),
							dataType : "text",
							error : function(){
								$("#error-msg-area").text("시스템 오류입니다.잠시후 다시 시도해 주세요.");
							},
							success : function(resultData) {
								let goUrl = "";
								if (resultData == 0) {
									$("#login-error-msg").css({"opacity":1});
									$("#error-msg-area").text("아이디/비밀번호를 확인해 주세요.");
									$("#login-error-msg").text("아이디/비밀번호를 확인해 주세요.");
								} else if (resultData == 1) {
									goUrl = "/members/loginResultControll.do";
									$("#login-form").attr("method", "post");
									$("#login-form").attr("action", goUrl);
									$("#login-form").submit();
								}
							}
						});
					}
				});
				
				$("#signup").click(function(){
					location.href="/members/singupForm.do";
				});
			});
		</script>
	</head>
 	<body>
 		<main id="main-holder">
		    <h1 id="login-header">환영합니다</h1>
    
		    <div id="login-error-msg-holder">
		      <p id="login-error-msg"> <span id="error-msg-area"></span></p>
		    </div>
		    
		    <form id="login-form">
		      <input type="hidden" name="status" id="status" value="0">
		      <input type="text" name="id" id="id" class="login-form-field" placeholder="ID">
		      <input type="password" name="pw" id="pw" class="login-form-field" placeholder="Password">
		      <button type="button" class="btn" id="login">로그인</button>
		      <button type="button" class="btn" id="signup">회원가입</button>
		      <a id="admin" href="/members/adminLoginForm.do">관리자</a>
		    </form>
		  
		</main>
	</body>
</html>