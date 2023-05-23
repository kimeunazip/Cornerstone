<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<%
	System.out.println("mainBody.jsp입니다.");
%>
		<title>mainBody.jsp</title>
		<style>
		body{
			display: grid;
			justify-items: center;
		  	align-items: center;
			color:#505050;
			background-color: #3a3a3a;
		}
		body > .container{
			 height: 900px;
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
		.inner {
		  padding: 30px;
		  color:white;
		}
		.cover {
		  padding: 0 20px;
		}
		.cover .btn-lg {
		  padding: 10px 20px;
		  font-weight: bold;
		}
		.mastfoot {
		  color: white; /* IE8 proofing */
		  position: fixed;
	      bottom: 0;
		}
		
		.mastfoot,
	  	.cover-container {
	  	   width: 700px; /* Must be percentage or pixels for horizontal alignment */
	  	}
		</style>
	</head>
	<body>
		  <div class="main-holder">
		      <div class="site-wrapper-inner">
		        <div class="cover-container">
		          <div class="inner cover">
		            <h1 class="cover-heading">Board Project</h1>
		            <p class="lead">Project boards can be used to create customized workflows to suit your needs, like tracking and prioritizing specific feature work, comprehensive roadmaps, or even release checklists.</p>
		            <p class="lead">
		              <a href="/members/logInForm" class="btn btn-lg btn-default">Learn more</a>
		            </p>
		          </div>
		        </div>
		      </div>
	    </div>
	    <a id="admin" href="/admin/login">admin</a>
	</body>
</html>