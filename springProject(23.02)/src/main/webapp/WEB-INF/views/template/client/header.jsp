<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="clientUri" value='${requestScope["javax.servlet.forward.request_uri"]}'/>
<div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/">Board Project</a>
        </div>
        
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav" id="navbar_ul">
            <li class="nav_li <c:if test ="${fn:endsWith(clientUri, '/')}">active</c:if> "><a href="/">Home</a></li>
            <li class="nav_li <c:if test="${fn:containsIgnoreCase(clientUri, '/board')}">active</c:if>"><a  href="/board/boardList">Board</a></li>
            <li class="nav_li <c:if test="${fn:containsIgnoreCase(clientUri, '/members')}">active</c:if>"><a href="/members/logInForm">Sign in</a></li>
            <li class="dropdown nav_li">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li class="divider"></li>
                <li class="dropdown-header">Nav header</li>
                <li><a href="#">Separated link</a></li>
                <li><a href="#">One more separated link</a></li>
              </ul>
            </li>
          </ul>
        </div><!--#navbar -->
</div>