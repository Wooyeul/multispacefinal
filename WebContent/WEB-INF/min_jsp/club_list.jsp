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
		table, tr, td{
			border: 1px solid;
		}
	</style>
</head>
<body>
	<div class="container">
		<table style="width: 1000px">
			<tr>
				<td>번호</td>
				<td>제목</td>
			</tr>
			<jl:forEach  var="pvo" items="${map.vo}" varStatus="vs">
				<tr>
					<td id="no" align="center">${vs.count }</td>
					<td><p onclick="parent.location.href='club_detail.do?club_no=${pvo.club_no}'">${pvo.club_title}</td>
				</tr>
			</jl:forEach>
			
			<%-- <tr>
				<td colspan="2" align="center">
					<!-- 현재 페이지가 1보다 크면 [처음] 하이퍼링크 생성-->
					<jl:if test="${map.boardPager.curPage > 1}">
						<a href="javascript:list('1')">[처음]</a>
					</jl:if>
					<!-- **이전페이지 블록으로 이동 : 현재 선택된 페이지가 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
               		<jl:if test="${map.boardPager.curBlock > 1}">
                    	<a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
                	</jl:if>
                	<!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
	                <jl:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
	                    <!-- **현재페이지이면 하이퍼링크 제거 -->
	                    <jl:choose>
	                        <jl:when test="${num == map.boardPager.curPage}">
	                            <span style="color: red">${num}</span>&nbsp;
	                        </jl:when>
	                        <jl:otherwise>
	                            <a href="javascript:list('${num}')">${num}</a>&nbsp;
	                        </jl:otherwise>
	                    </jl:choose>
	                </jl:forEach>
                	<!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
	                <jl:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
	                    <a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
	                </jl:if>
	                <!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
	                <jl:if test="${map.boardPager.curPage < map.boardPager.totPage}">
	                    <a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
	                </jl:if>
				</td>
			</tr> --%>
		</table>
		<div align="center">
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
	</div>
	
	<!-- 자바스크립트 -->
	<script type="text/javascript">

		function list(page){
			parent.setCurpage(page);
		}
	</script>
</body>
</html>