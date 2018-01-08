<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>   
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
		<h1>모임 리스트</h1>
	</div>
	<table border="1">
		<tr>
			<td>모임 이름</td>
			<td>모임장 유저 ID</td>
			<td>모임 이미지</td>
			<td>모임 최대 인원</td>
			<td>모임 생성 날짜/시간</td>
			<td>모임 삭제 하기</td>
		</tr>
		<jl:forEach var="vo" items="${ls}">
			<tr>
				<td ><a href="admin_club_detail.do?club_no=${vo.club_no}">${vo.club_name}</a></td>
				<td>${vo.user_id}</td>
				<td><img src="club_thumb_images/${vo.club_thumb_img}" "style="width:128px;height:128px;"/></td>
				<td>${vo.max_member}</td>
				<td>${vo.create_time}</td>
				<td><a href="admin_club_remove.do?club_no=${vo.club_no}">삭제</a></td>
			</tr>
		</jl:forEach>
	</table>
	
</body>
</html>