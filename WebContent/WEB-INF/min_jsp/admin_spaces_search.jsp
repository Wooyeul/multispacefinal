<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
	 
	<form id="textsearch" action="admin_spaces_search.do">
		<select name="search_option">
			<option value="0">검색할 것을 선택해주세요</option>
			<option value="1">사업자 등록번호</option>
			<option value="2">공간 이름</option>
			<option value="3">공간 내용</option>
			<option value="4">오픈 시간</option>
			<option value="5">클로즈 시간</option>
			<option value="6">가격</option>
			<option value="7">최대 인원</option>
			<option value="8">최소 인원</option>
			<option value="9">공간 전화 번호</option>
			<option value="10">주소</option>
			<option value="11">공간 카테고리</option>
			<option value="12">장소 카테고리</option>
			<option value="13">생성일</option>
			<option value="14">공간 이름 + 내용</option>
		</select>
		&nbsp;<input type="text" name="search_content">
		<input type="submit" value="검색">
	</form>
	
	<br>
	<br>
	<form id="textsearch" action="admin_spaces_search2.do">
		<select name="search_option">
			<option value="0">정렬을 선택해주세요</option>
			<option value="1">최신 순</option>
			<option value="2">오래된 순</option>
			<option value="3">비싼 가격 순</option>
			<option value="4">싼 가격 순</option>
		</select>
		<input type="submit" value="전체 정렬하기">
	</form>
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
			<td>삭제 하기</td>
		</tr>
		<jl:forEach var="vo" items="${ls}">
			<tr>
				<td>${vo.crn}</td>
				<td>${vo.space_title}</td>
				<td>${vo.space_content}</td>
				<td><img src="thumbnail/${vo.space_thumb_img}" style="width:128px;height:128px;"></img></td>
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

</body>
</html>