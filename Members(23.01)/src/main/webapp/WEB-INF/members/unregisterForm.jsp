<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.members.members.vo.MembersVO"%>
<%
	System.out.println("unregisterForm.jsp입니다.");
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
      	<title>회원탈퇴안내 - unregisterForm.jsp</title>
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
				margin:10% 45%;
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
			.point{
				color:#e58f8f;
			}
			li{
				font-family: Arial, Helvetica, sans-serif;
				font-size: 12px;
				font-weight: bold;
				margin:10px;
				list-style-position: inside;
			}
			
			li::marker {
			  color: #F08282;
			  font-size: 0.9em;
			  font-weight: bold;
			}
			:root {
				accent-color: #F08282; /* checkbox */
			}
			
			#final-check-label{
				margin:20px;
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
			
			$("#unregister-ok").click(function(){
				if(!$("#final-check").is(":checked")) {
					$("#error-msg-area").text("안내사항 확인 동의를 확인해 주세요.")
					return;
				}else{
					alert("탈퇴되었습니다.");
					$("#unregister-form").attr("method", "post");
					$("#unregister-form").attr("action", "/members/unregisterResult.do");
					$("#unregister-form").submit();
				}
				
			});
   		});
   		</script>
   </head>
	<body>
		<div id="main-holder">
           	<div id="sub-holder">
	           	<h2 class="text-center">회원탈퇴안내</h2>
	        	<form id="unregister-form">
	        		<input type="hidden" name="num" value="${deleteData.num }" >
           		</form>
           		<h5>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</h5>
           		<ul>
           			<li>사용하고 계신 아이디(<span class="point">${deleteData.id}</span>)는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</li>
					<li>탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.</li>
           			<li>탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.
					<li>삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.</li>
           		</ul>
           		<label id="final-check-label">
           			<input type="checkbox" id="final-check" name="" />
           			<b>안내 사항을 모두 확인하였으며, 이에 동의합니다.</b>
           		</label>
        	</div>
        	<div>
        		<label class="error-msg" id="error-msg-area" ></label>
        	</div>
        	<div id="button-holder">
	            <button type="button" id= "unregister-ok" class ="btn">회원탈퇴</button>
            </div>
        </div>
	</body>
</html>