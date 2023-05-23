<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri = "http://tiles.apache.org/tags-tiles" %>
<%
	System.out.println("mainLayout.jsp입니다.");
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="/resources/images/icon.png" />
	<link rel="apple-touch-icon" href="/resources/images/icon.png" />
	<link rel="apple-touch-icon" href="/resource/images/icon.png" />
	<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="/resources/include/js/common.js"></script>
	
    <!-- Bootstrap core CSS -->
    <link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/resources/include/dist/css/sticky-footer-navbar.css" rel="stylesheet">
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="/resources/include/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/resources/include/assets/js/ie-emulation-modes-warning.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	   <style>
		  	.footer{
		  		position: inherit;
		  		text-align: center;
		  		margin: 0px;
		  		padding:15px;
		  		height: 50px;
		  		font-size: 12px;
		  	}
		  	p{
		  		margin 10px;
		  	}
	  </style>
  </head>
 
  <body>
    <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
      <tiles:insertAttribute name="header" />
    </nav>

    <!-- Begin page content -->
    <div class="contentLayout container">
     <tiles:insertAttribute name="mainBody" />
    </div>

    <footer class="footer">
      <tiles:insertAttribute name="footer" />
    </footer>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
    <script src="/resources/include/dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/include/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
