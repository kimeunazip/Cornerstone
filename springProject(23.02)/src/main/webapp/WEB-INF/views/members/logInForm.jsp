<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<%@ taglib prefix="tiles" uri = "http://tiles.apache.org/tags-tiles" %>
<%
	System.out.println("admiLogInForm.jsp입니다.");
%>
		<title>로그인 화면 - logInForm.jsp</title>
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
			
			#login-form {
			  align-self: flex-start;
			  display: grid;
			  justify-items: center;
			  align-items: center;
			}
			
			.text-center{
				text-align: center;
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
					if(!chkData("#id","id")) return;
					else if (!chkData("#pw","password")) return;
					else {
						$.ajax({
							url : "/members/checkIdPwd",
							type : "post",
							data : $("#login-form").serialize(),
							dataType : "text",
							error : function(){
								$("#error-msg-area").text("ajax error");
							},
							success : function(checkData) {
								let goUrl = "";
								console.log(checkData);
								if (checkData == 0) {
									$("#login-error-msg").css({"opacity":1});
									$("#error-msg-area").text("please check your id/password");
									$("#login-error-msg").text("please check your id/password");
								} else if (checkData == 1) {
									goUrl = "/members/logIn";
									$("#login-form").attr("method", "post");
									$("#login-form").attr("action", goUrl);
									$("#login-form").submit();
								}else{
									$("#login-error-msg").css({"opacity":1});
									$("#error-msg-area").text("system error!");
									$("#login-error-msg").text("system error!");
								}
							}
						});
					}
				});
				
				$("#signup").click(function(){
					location.href="/members/singUpForm";
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
		      <button type="button" class="btn" id="login">Login</button>
		      <button type="button" class="btn" id="signup">Sign Up</button>
		      <a id="admin" href="/members/adminLogInForm">Admin</a>
		    </form>
		  
		</main>
	</body>
</html>