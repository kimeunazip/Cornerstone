<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/common.jsp" %>
<%
	System.out.println("getBoardList.jsp");
%>
		<title>목록보기 - getBoardList.jsp</title>
		
		<script type="text/javascript">
			$(function(){
				//글쓰기버튼
				$("#writeForm").click(function(){
					console.log("#writeForm 클릭");
					location.href="/board/insertForm.do";
				});
				
				//상세
				$(".goDetail").click(function(){
					let num = $(this).parents("tr").attr("data-num");
					//get방식  = "/board/detailBoard.do?num="+num;
					
					//post방식 = form을 만들어줘야한다.
					$("#num").val(num); //hidden input태그의 값을 여기서 설정해준다.
					$("#detailForm").attr({
						"method" : "post",
						"action" : "/board/detailBoard.do"
					});
					$("#detailForm").submit();
				
				})
				$(".goDetail").hover(
					function(){
						$(this).css("cursor","pointer");
						$(this).css("font-weight","bold");
					},
					function(){
						console.log("dd");
						$(this).css("font-weight","normal");
				});
				
				//검색버튼 클릭 시
				if('${param.keyword}' !=""){
					
					$("#keyword").val('${param.keyword}');
					$("#search").val('${param.search}');
	
				}//이 코드가 없으면 검색어입력칸에 유지되지않는다.
				
				$("#keyword").bind("keydown",function(event){
					if(event.keyCode == 13){
						event.preventDefault();  //enter가 들어왔을때 action에 url이 없으므로 기능구현이 안된다. 
						$("#searchData").click(); 
					}
				});
				
				$("#searchData").click(function(){
					console.log("111");
					if($("#search").val() != "all"){
						console.log("22");
						if(!chkData("#keyword","검색어를")){
							console.log("44");
							return;
						}
					}else if($("#search").val() == "all"){
						console.log("33");
						$("#keyword").val("");
					}
					
					$("#f_search").attr({
						"method" : "post",
						"action" : "/board/getBoardList.do"
					});
					$("#f_search").submit();
				});
			});
		</script>
	</head>
	<!------------------------------------------------------------  -->
	<body>
		<div class="container">
			<div class="text-center">
				<h3>게시판 리스트</h3>
			</div><!--.text-center  -->
			
			<form name="detailFrom" id="detailForm">
				<input type="hidden" name="num" id="num" />
			</form>
			<!------------ 검색기능 시작------------------  -->
			<div id="boardSearch" class="text-right">
				<form id="f_search" name="f_search" class="form-inline">
					<div class="form-group">
						<select id="search" name="search" class="form-control">
							<option value="" disabled="disabled" >검색조건</option>
							<option value="all">전체</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="author">작성자</option>
						</select>
						<input type="text" name="keyword" id="keyword" class = "form-control" placeholder="검색어를 입력하세요." />
						<button type="button" id="searchData" class="btn btn-primary">검색</button>
					</div>
				</form>
			</div>
	
			<!------------ 검색기능 종료------------------  -->
			
			<!------------ 리스트 시작------------------  -->
			<div id="boardList">
				<table summary="게시판 리스트" class="table">
					<thead>
						<tr>
							<th class="col-md-1 text-center">번호</th>
							<th class="col-md-6 text-center">제목</th>
							<th class="col-md-2 text-center">작성자</th>
							<th class="col-md-2 text-center">날짜</th>
							<th class="col-md-1 text-center">조회수</th>
						</tr>
					</thead>
					<tbody>
					
						<c:choose>
							<c:when test="${not empty list }" >
								<c:forEach var="vo" items="${list }">
									<tr class="text-center" data-num="${vo.num }">
										<td>${vo.num }</td>
										
  										<!--<td class="text-left"><span class="goDetail">${vo.title }</span></td>-->
										<td class="text-left">
											<c:if test ="${vo.repStep>0 }" >
												<c:forEach begin="1" end="${vo.repIndent}">
													&nbsp;&nbsp;&nbsp;
												</c:forEach>
												
												<img src="/image/re.gif" />
											</c:if>
											
											<span class="goDetail">${vo.title }</span>
										
										</td>
										
										<td>${vo.author }</td>
										<td>${vo.writeday }</td>
										<td>${vo.readcnt }</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="5" class="text-center">등록된 게시물이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div><!--.boardList  -->
			<div class="contentBtn text-right">
				<button type="button" id="writeForm" class="btn btn-primary btn-sm">글쓰기</button>
			</div><!--.contentBtn  -->
		</div><!--.container  -->
	</body>
</html>