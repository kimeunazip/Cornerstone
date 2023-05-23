<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<%
	System.out.println("searchableList.jsp입니다.");
%>
		<title>페이징+검색기능 게시판 전체조회 - searchableList.jsp</title>
		<style type="text/css">
				.navbar-nav {
			    float: left;
			    width: auto;
			    margin: 0;
		    }
			#boardList-div{
				width:90%;
				 height: 900px;
				 margin:10px auto;
			}
			.b_title{
				cursor:pointer;
			}
			.btn{
			  width: 70px;
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
			.btn-sm{
			  width: 50px;
			  padding: 5px;
			  margin:3px;
			  border: none;
			  border-radius: 3px;
			  color: white;
			  font-weight: bold;
			  background-color: #3a3a3a;
			  cursor: pointer;
			  outline: none;
			}
			#search{
				border: 1px solid lightgrey;
				border-radius: 0.3em;
			    height: 26px;
			}
			footer {
			        position: inherit;
				    text-align: center;
				    margin: 0px;
				    padding: 15px;
				    height: 50px;
				    font-size: 12px;
			}
			.wrapper {
			    height: 900px;
			    width: 70%;
			    margin: 50px auto;
			    }
			ul {
				list-style: none;
				width : 30%;
				display: inline-block;
			}
			
			li {
				float: left;
				margin-left : 5px;
			}
			
			/*페이징*/
			.page_wrap {
				text-align:center;
				font-size:0;
			 }
			.page_nation {
				display:inline-block;
			}
			.page_nation .none {
				display:none;
			}
			.page_nation a {
				display:block;
				margin:0 3px;
				float:left;
				border:1px solid #e6e6e6;
				width:28px;
				height:28px;
				line-height:28px;
				text-align:center;
				background-color:#fff;
				font-size:13px;
				color:#999999;
				text-decoration:none;
			}
			.page_nation .arrow {
				border:1px solid #ccc;
			}
			.page_nation .pprev {
				background:#f8f8f8 url('/resources/images/page_pprev.png') no-repeat center center;
				margin-left:0;
			}
			.page_nation .prev {
				background:#f8f8f8 url('/resources/images/page_prev.png') no-repeat center center;
				margin-right:7px;
			}
			.page_nation .next {
				background:#f8f8f8 url('/resources/images/page_next.png') no-repeat center center;
				margin-left:7px;
			}
			.page_nation .nnext {
				background:#f8f8f8 url('/resources/images/page_nnext.png') no-repeat center center;
				margin-right:0;
			}
			.page_nation a.active {
				background-color:#42454c;
				color:#fff;
				border:1px solid #42454c;
			}
		</style>
		<script type="text/javascript">
			$(function(){
				
				//title click
				$(".b_title").click(function(){
					//form버전도 있다. 그런데 여기선 post방식이 필요없으니,
					location.href="/board/boardDetail?b_num="+$(this).parent("tr").data('num');
				});
				
				$(".b_title").mouseover(function(){
					$(this).css("font-weight","bold");
				});
				
				$(".b_title").mouseout(function(){
					$(this).css("font-weight","normal");
				});
				
				//new
				$("#write-btn").click(function(){
					location.href="/board/writeForm";
				});
				
				//search
			 	$("#search-btn").click(function(){
					if($("#search").val() != "all"){
						if(!chkData("#keyword","keyword")) return;
					}
					console.log($("#pageNum").val());
					$("#pageNum").val('1');
					console.log($("#pageNum").val());
					goSearch();
					
				});
			 	
			 	//검색 카테고리를 변경할 때마다
			 	$("#search").change(function(){
			 		if($("#search").val() == "all"){
			 			$("#keyword").val("전체 데이터를 조회합니다.");
			 		}else if($("#search").val() != "all") {
			 			$("#keyword").val("");
			 			$("#keyword").focus();
			 		}
			 	});
				
				//검색 후
			 	let word="<c:out value='${boardVO.keyword}' />";
			 	let value="";
			 	if(word!=""){
			 		$("#keyword").val("<c:out value='${boardVO.keyword}'/>");
			 		$("#search").val("<c:out value='${boardVO.search}'/>");
			 		//검색범위가 제목이나 작성자일 때 검색단어 색상변경
					if($("#search").val() !='b_content'){  
				 		if($("#search").val() =='b_title'){
				 			value=".red_title";
				 		}else if($("#search").val() =='b_name'){
				 			value=".red_name";
				 		}
				 		/*console.log($("#list tr td .b_title:contains('The')").html());*/
				 		
				 		$(value+":contains('"+word+"')").each(function(){
				 			let regex = new RegExp(word,'gi');
					 		console.log(regex);
					 		console.log($(this).html());
					 		console.log("ddd"+${pageDto.startPage});
							console.log(${pageDto.endPage });
				 			$(this).html($(this).html().replace(regex,"<span class='required'>"+word+"</span>"));
				 		});
					}
			 	}
			 	
			 	//페이징
			 	$(".page_nation a").click(function(e){
			 		e.preventDefault();
			 		$("#search-form").find("input[name='pageNum']").val($(this).attr("href"));
			 		console.log($("#search-form").find("input[name='pageNum']").val());
			 		goSearch();
			 	});
				
			});
			function goSearch(){
				console.log(${pageDto.startPage});
				console.log(${pageDto.endPage });
				if($("#search").val() == "all"){
					$("#keyword").val("");
				}
				$("#search-form").attr({
					"method" : "get",
					"action" : "/board/boardList"
				});
				$("#search-form").submit();
				
			}
			function chkData(item,msg){
				if($(item).val().replace(/\s/g,"")==""){
					alert("please enter your "+msg);
					$(item).val("");
					$(item).focus("");
					return false;
				}else
					return true;
			}
		</script>
	</head>
	<body>
		<div class="wrapper" id="boardList-div">
			<div class="content" id="boardList">
				<h3>Board List</h3>
				<div class="contentBtn text-right">
					<form id="search-form" name="search-form">
						<input type="hidden" id="pageNum" name="pageNum" value="${pageDto.cvo.pageNum}">
						<input type="hidden" id="amount" name="amount" value="${pageDto.cvo.amount}">
						<select id="search" name="search" >
							<option value="all">all</option>
							<option value="b_title">title</option>
							<option value="b_content">contents</option>
							<option value="b_name">author</option>
						</select>
						<input type="text" id="keyword" name="keyword"/>
						<input type="button" class="btn btn-success" id="search-btn" value="search"/>
					</form>
				</div><!--.contentBtn -->
				
				<table summary="게시판 리스트" class="table table-striped board-list-table">
					<thead>
						<tr>
							<th data-value="b_num" class="order col-md-1 text-center">no</th>
							<th data-value="b_thumbnail" class="text-center col-md-1">thumbnail</th>
							<th class="col-md-4 text-center">title</th>
							<th class="col-md-2 text-center">author</th>
							<th data-value="b_date" class="text-center col-md-1">date</th>
							<th data-value="b_hit" class="text-center col-md-1">hit</th>
						</tr>
					</thead>
					<tbody class="table-striped" id="list">
						<c:choose>
							<c:when test="${not empty searchPagingList  }" >
								<c:forEach var="list" items="${searchPagingList  }">
									<tr class="text-center" data-num="${list.b_num }">
										<td>${list.b_num }</td>
										<td>
											<c:if test="${not empty list.b_thumb }">
												<img src="/uploadStorage/board/thumbnail/${list.b_thumb }" width="70px" height="50px"/>
											</c:if>
											<c:if test="${empty list.b_thumb }">
												<img src="/resources/images/no_image.jpg" width="70px" height="50px"/>
											</c:if>
										</td>
										<td class="text-left b_title red_title">${list.b_title }(<span class="reply_count">${list.r_cnt }</span>)</td>
										<td class="text-center b_name red_name" >${list.b_name }</td>
										<td class="text-center" >${list.b_date }</td>
										<td class="text-center" >${list.b_hit }</td>
									</tr>
								</c:forEach>
								
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4" class="text-center">등록된 게시글이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div><!--#boardList  -->
			
			<div class="contentBtn text-right">
				<input type="button" class="btn btn-success" id="write-btn" value="new"/>
			</div>
				
			
			<div class="page_wrap">
			  <div class="page_nation">
			    <a class="arrow pprev" href="${pageDto.startPage}"></a>
			    <c:if test="${pageDto.prev }">
			      	<a class="arrow prev" href="${pageDto.startPage-1}"></a>
			    </c:if>
			
			    <c:forEach var="num" begin="${pageDto.startPage }" end="${pageDto.endPage }">
			      <li class="pagination_button ${pageDto.cvo.pageNum == num? 'active' : ''} ">
			      	<a href="${num }">${num }</a>
			      </li>
			    </c:forEach>
			
			    <c:if test="${pageDto.next }">
			        <a class="arrow next" href="${pageDto.endPage+1}"></a>
			    </c:if>
			    <a class="arrow nnext" href="${pageDto.endPage}"></a>
			  </div>
			</div>
			
		</div><!--#boardList-div -->
		
	</body>
</html>