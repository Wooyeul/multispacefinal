<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#cancel").on("click",function(){
				location.href="club_list.do";
			});
		});
	</script>
</head>
<body>
	<form method="post" action="club_add_page_submit.do" enctype="multipart/form-data">
		<label>클럽이름</label><input name="club_name" type="text"><br/>
		<label>제목</label><input name="club_title" type="text"><br/>
		<label>인원</label><input name="max_member"type="number"><br/>
		<label>소개</label><textarea name="club_content" rows="3" cols="24"></textarea><br/>
		<label>사진등록</label><input name="club_thumb_img" type="file"><br/>
		<select name="l_category_no">
			<option>지역선택</option>
			<option value="1">서울</option>
			<option value="2">경기</option>
			<option value="3">인천</option>
			<option value="4">강원</option>
			<option value="5">대전</option>
			<option value="6">세종</option>
			<option value="7">충남</option>
			<option value="8">충북</option>
			<option value="9">부산</option>
			<option value="10">울산</option>
			<option value="11">경남</option>
			<option value="12">경북</option>
			<option value="13">대구</option>
			<option value="14">광주</option>
			<option value="15">전남</option>
			<option value="16">전북</option>
			<option value="17">제주</option>
			<option value="18">전국</option>
		</select>
		<select name="c_category_no">
			<option>분야선택</option>
			<option value="1">공부</option>
			<option value="2">회의</option>
			<option value="3">파티</option>
			<option value="4">레저</option>
			<option value="5">스포츠</option>
			<option value="6">기타</option>
		</select>
		<input name="user_id" type="hidden" value="admin">
		<input type="submit" value="등록하기"><input id="cancel" type="button" value="취소하기">
	</form>
</body>
</html>