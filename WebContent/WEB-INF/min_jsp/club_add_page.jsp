<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
</head>
<body>
	<div class="container">
		<form method="post" action="club_add_page_submit.do" enctype="multipart/form-data">
			<label>클럽이름</label><input name="club_name" type="text"><br/>
			<label>제목</label><input name="club_title" type="text"><br/>
			<label>인원</label><input name="max_member"type="number"><br/>
			<label>소개</label><textarea name="club_content" rows="3" cols="24"></textarea><br/>
			<label>사진등록</label><input name="club_thumb_img" type="file"><br/>
			<select name="l_category_no">
				<option>지역선택</option>
				<jl:forEach items="${lmap}" var="m">
					<option value="${m.l_category_no}">${m.l_category_name}</option>
				</jl:forEach>
			</select>
			<select name="c_category_no">
				<option>분야선택</option>
				<jl:forEach items="${cmap}" var="c">
					<option value="${c.c_category_no}">${c.c_category_name}</option>
				</jl:forEach>
			</select>
			<input name="user_id" type="hidden" value="${user_id}">
			<input type="submit" value="등록하기"><input id="cancel" type="button" value="취소하기">
		</form>
	</div>
	<!-- 자바스크립트 -->
	<script type="text/javascript">
		$(document).ready(function(){
			$("#cancel").on("click",function(){
				location.href="club_home.do";
			});
		});
	</script>
</body>
</html>