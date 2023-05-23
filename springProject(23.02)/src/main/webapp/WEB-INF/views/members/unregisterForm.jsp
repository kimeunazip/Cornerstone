<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<%
	System.out.println();
%>
		<title></title>
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
			  margin:10px auto;
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
			.text-center{
				margin:50px;
			}
			
			.point{
				color:#e58f8f;
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
					$("#unregister-form").attr("action", "/members/membersUnresigter");
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
           		<h4>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</h4>
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
        	<div id="button-holder">
	            <button type="button" id= "unregister-ok" class ="btn">회원탈퇴</button>
            </div>
        </div>
	</body>
</html>