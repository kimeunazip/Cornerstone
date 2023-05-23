<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<%
	System.out.println("left.jsp입니다.");
%>
<c:set var="uri" value='${requestScope["javax.servlet.forward.request_uri"]}' />
	
	<!-- left -->
         <ul class="nav nav-sidebar">
			<li><a href="#">관리자 메뉴</a></li>
			<li <c:if test="${fn:containsIgnoreCase(uri, '/admin/board')}">class="active"</c:if>>
				<a href="/admin/board/adminBoardList">게시판 관리</a>
			</li>
			<li <c:if test="${fn:containsIgnoreCase(uri, '/admin/member')}">class="active"</c:if>>
				<a href="#memberList">회원 관리</a>
			</li>
		</ul>
    <!-- left -->
