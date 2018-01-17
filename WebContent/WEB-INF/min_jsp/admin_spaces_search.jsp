<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
table {
	text-align: center;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<script>

</script>
</head>
<body>
	<div class="jumbotron" style="background-color: orange">
		<h1>공간 모음</h1> 
	</div> 
	 
	검색할 것을 선택해주세요.
	<form id="textsearch" action="admin_spaces_search.do" method="post">
		
		<select name="option">
			<option value="crn">사업자 등록번호</option>
			<option value="space_title">공간 이름</option>
			<option value="space_content">공간 내용</option>
			<option value="open_time">오픈 시간</option>
			<option value="close_time">클로즈 시간</option>
			<option value="price">가격</option>
			<option value="max_people">최대 인원</option>
			<option value="min_people">최소 인원</option>
			<option value="space_call">공간 전화 번호</option>
			<option value="zipcode">주소</option>
			<option value="s_category_no">공간 카테고리</option>
			<option value="l_category_no">장소 카테고리</option>
			<option value="the_time">생성일</option>
		</select>
		&nbsp;<input type="text" name="content">
		<input type="checkbox" name="re" value="Y">상세 검색 할려면 체크&nbsp;<br>
		<input type="submit" value="검색">
	</form>
	
	<br>
	<br>
	<br>
	<br>
		<table border="1">
		<tr>
			<td>사업자 등록 번호</td>
			<td>공간 이름</td>
			<td>공간 내용</td>
			<td>공간 썸브네일 이미지</td>
			<td>오픈 시간</td>
			<td>클로즈 시간</td>
			<td>가격</td>
			<td>최대 인원</td>
			<td>최소 인원</td>
			<td>공간 번호</td>
			<td>주소</td>
			<td>공간 카테고리</td>
			<td>장소 카테고리</td>
			<td>생성일</td>
			<td>삭제하기</td>
		</tr>
		<jl:forEach var="vo" items="${ls}">
			<tr>
				<td><a href="admin_space_crn_check.do?crn=${vo.crn}">${vo.crn}</a></td>
				<td>${vo.space_title}</td>
				<td>${vo.space_content}</td>
				<td><a href="space_detail.do?space_no=${vo.space_no}"><img src="thumbnail/${vo.space_thumb_img}" style="width:128px;height:128px;"></img></a></td>
				<td>${vo.open_time}</td>
				<td>${vo.close_time}</td>
				<td>${vo.price}</td>
				<td>${vo.max_people}</td>
				<td>${vo.min_people}</td>
				<td>${vo.space_call}</td>
				<td>${vo.zipcode}</td>
				<td>${vo.s_category_no}</td>
				<td>${vo.l_category_no}</td>
				<td>${vo.the_time}</td>
				<td><a href="admin_space_remove.do?space_no=${vo.space_no}">삭제</a></td>
			</tr>
		</jl:forEach>
	</table>
	
<form id="form_search" action="admin_spaces_search.do">
	<input type="hidden" name="pg" value="" id="pg">
</form>

	<ul class="pagination pagination-sm">
			<jl:if test="${pz.hasPrevPagination }">
				<li><a class="page" href="admin_spaces_search.do?pg=${pz.paginationStart-1}">&lt;</a></li>
			</jl:if>
				<jl:if test="${pz.hasPrevPage }">
					<li><a class="page" href="admin_spaces_search.do?pg=${pz.curPagination-1 }">&lt;</a></li>
				</jl:if>
				<jl:forEach begin="${pz.paginationStart }" end="${pz.paginationEnd }" step="1" varStatus="vs">
					<jl:choose>
						<jl:when test="${vs.index!=pz.curPagination }">
							<li><a class="page" href="admin_spaces_search.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:when>
						<jl:otherwise>
							<li class="active"><a class="page" href="admin_spaces_search.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:otherwise>
					</jl:choose>
				</jl:forEach>
				<jl:if test="${pz.hasNextPage }">
					<li><a class="page" href="admin_spaces_search.do?pg=${pz.curPagination+1}">&gt;</a></li>
				</jl:if>
			<jl:if test="${pz.hasNextPagination }">
				<li><a class="page" href="admin_spaces_search.do?pg=${pz.paginationEnd+1 }">&gt;&gt;</a></li>
			</jl:if>
		</ul>

</body>
</html>