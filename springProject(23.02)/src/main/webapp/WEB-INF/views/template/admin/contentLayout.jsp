<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<%@ taglib prefix="tiles" uri = "http://tiles.apache.org/tags-tiles" %>
<%
	System.out.println("admin-contentLayout.jsp입니다.");
%>
		<title>admin-contentLayout.jsp</title>
		<style>
			#mainContents{
				margin:0px;
			}
		</style>
</head>
<body>
	 <nav class="navbar navbar-inverse navbar-fixed-top">
    	<tiles:insertAttribute name="header" />
    </nav>

    <div class="container-fluid">
      <div class="row">
        	<div class="col-sm-3 col-md-2 sidebar">
        		<tiles:insertAttribute name="left" />
      		 </div>
      		 <div id="mainContents" class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        		<tiles:insertAttribute name="sub" />
        		<tiles:insertAttribute name="main" />
      		 </div>
       </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/resources/include/dist/js/bootstrap.min.js"></script>
    <script src="/resources/include/assets/js/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/include/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>