<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
	
	<link rel="stylesheet" type="text/css" href="./Resources/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="./Resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="./Resources/css/responsive.css">
	
		
	<script type="text/javascript" src="./Resources/js/jquery.js"></script>
	<script type="text/javascript" src="./Resources/js/main.js"></script>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="./common.js"></script>
	<style type="text/css">
		th,td,tr {
			text-align: center;
		}
		label {
			margin-left:400px;
		}
	</style>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$(".space_no").on("click",function(){
				var temp = $(this).attr("abc");
				
				document.frm.method="POST";
				document.frm.action="space_detail.do?space_no="+temp;
				document.frm.submit();
			});
		});
		function board_list(page){
			$("#cur_page").attr("value",page);
			$("#paging_frm").submit();
		}
	</script> 
<body>
</br>
<label><h3>공간 사진을 클릭하면 해당 공간 페이지로 이동됩니다. 공간의 상세 내용 및 후기를 확인해보세요!</h3></label>
<hr style="border: solid 0.5px black;">
	<table class="table table-hover">
		<tr>
			<th width="80"><h4>방번호</h4></th>
			<th width="200"><h4>제목</h4></th>
			<th width="600"><h4>내용</h4></th>
			<th><h4>공간사진</h4></th>
			<th width="100"><h4>글쓴이</h4></th>
			<th width="200"><h4>작성일</h4></th>
			<th width="50"><h4>별점</h4></th>
			
		</tr>
		
		<jl:forEach items="${rl}" var="rl">
		<tr>
			<td>${rl.space_no}</td>
			<td>${rl.review_title}</td>
			<td>${rl.review_content}</td>
			<td><a href="space_detail.do_no_header.do?space_no=${rl.space_no}"><img src="img/${rl.review_img}" width="100px" class="space_no" abc="${rl.space_no}"/></a></td>
			<td>${rl.user_id}</td>
			<td>${rl.the_time}</td>
			<td>${rl.review_score}</td>
		</tr>
		</jl:forEach>
	</table>
	
	<!-- 페이징 -->
	<div align="center">
		<ul class="pagination pagination-sm">
			<!-- 이전 페이지로 이동 : 10페이지 이전으로(블록 이동) -->
			<jl:if test="${board_pz.hasPrevPagination }">
				<li><a class="page" href="javascript:board_list('${board_pz.paginationStart-1}')">&lt;</a></li>
			</jl:if>
			<!-- 이전 페이지로 이동 : 한페이지 이전으로 -->
			<jl:if test="${board_pz.hasPrevPage }">
				<li><a class="page" href="javascript:board_list('${board_pz.curPagination-1 }')">&lt;</a></li>
			</jl:if>
				<!-- 페이지 번호 만들기 -->
				<jl:forEach begin="${board_pz.paginationStart }" end="${board_pz.paginationEnd }" step="1" varStatus="vs">
					<jl:choose>
						<jl:when test="${vs.index!=board_pz.curPagination }">
							<li><a class="page" href="javascript:board_list('${vs.index }')">${vs.index }</a></li>
						</jl:when>
						<jl:otherwise>
							<li class="active"><a class="page" href="javascript:board_list('${vs.index }')">${vs.index }</a></li>
						</jl:otherwise>
					</jl:choose>
				</jl:forEach>
			<!-- 다음 페이지로 이동 : 한페이지 이동 -->
			<jl:if test="${board_pz.hasNextPage }">
				<li><a class="page" href="javascript:board_list('${board_pz.curPagination+1}')">&gt;</a></li>
			</jl:if>
			<!-- 다음 페이지로 이동 : 10페이지 이후로(블록 이동) -->
			<jl:if test="${board_pz.hasNextPagination }">
				<li><a class="page" href="javascript:board_list('${board_pz.paginationEnd+1 }')">&gt;&gt;</a></li>
			</jl:if>
		</ul>
	</div>
	<!-- 페이징 -->	

<form id="paging_frm" action="community_review_list.do" method="post">
	<input type="hidden" name="cur_page" id="cur_page" value=""/>
</form>
</body>
</html>