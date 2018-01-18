<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>
		ul {
		  list-style-type: none;
		  width: 980px;
		}
		 
		h3 {
		  font: bold 20px/1.5 Helvetica, Verdana, sans-serif;
		}
		 
		li img {
			width: 100px;
			height: 100px;
			float: left;
			margin: 0 15px 0 0;
		}
		 
		li p {
		  font: 200 14px/1.5 Georgia, Times New Roman, serif;
		}
		 
		li {
		  padding: 10px;
		  overflow: auto;
		}
		 
		li:hover {
		  background: #eee;
		  cursor: pointer;
		}
		.category {
			border-radius: 15px;
		}
		
	</style>
</head>
<body>
	<div style="width: 1000px; margin: 20px;">
		<ul>
			<jl:forEach  var="pvo" items="${map.vo}" varStatus="vs">
				<li onclick="parent.location.href='club_detail.do?club_no=${pvo.club_no}'">
					<img src="club_img/${pvo.club_thumb_img }">
					<h3>${pvo.club_name}</h3>
					<p>${pvo.club_title}</p>
					<button class="btn btn-default category" disabled="disabled">#${pvo.l_category_name}</button>
					<button class="btn btn-default category" disabled="disabled">#${pvo.c_category_name }</button>
					<button class="btn btn-default category" disabled="disabled">#${pvo.user_count}/${pvo.max_member}명</button>
				</li>
			</jl:forEach>
		</ul>
	</div>
	
	<div align="right">
		<ul class="pagination pagination-sm">
			<!-- 이전 페이지로 이동 : 10페이지 이전으로(블록 이동) -->
			<jl:if test="${map.pz.hasPrevPagination }">
				<li><a class="page" href="javascript:list('${map.pz.paginationStart-1}')">&lt;</a></li>
			</jl:if>
			<!-- 이전 페이지로 이동 : 한페이지 이전으로 -->
			<jl:if test="${map.pz.hasPrevPage }">
				<li><a class="page" href="javascript:list('${map.pz.curPagination-1 }')">&lt;</a></li>
			</jl:if>
				<!-- 페이지 번호 만들기 -->
				<jl:forEach begin="${map.pz.paginationStart }" end="${map.pz.paginationEnd }" step="1" varStatus="vs">
					<jl:choose>
						<jl:when test="${vs.index!=map.pz.curPagination }">
							<li><a class="page" href="javascript:list('${vs.index }')">${vs.index }</a></li>
						</jl:when>
						<jl:otherwise>
							<li class="active"><a class="page" href="javascript:list('${vs.index }')">${vs.index }</a></li>
						</jl:otherwise>
					</jl:choose>
				</jl:forEach>
			<!-- 다음 페이지로 이동 : 한페이지 이동 -->
			<jl:if test="${map.pz.hasNextPage }">
				<li><a class="page" href="javascript:list('${map.pz.curPagination+1}')">&gt;</a></li>
			</jl:if>
			<!-- 다음 페이지로 이동 : 10페이지 이후로(블록 이동) -->
			<jl:if test="${map.pz.hasNextPagination }">
				<li><a class="page" href="javascript:list('${map.pz.paginationEnd+1 }')">&gt;&gt;</a></li>
			</jl:if>
		</ul>
	</div>
	
	<!-- 자바스크립트 -->
	<script type="text/javascript">

		function list(page){
			parent.setCurpage(page);
		}
	</script>
</body>
</html>