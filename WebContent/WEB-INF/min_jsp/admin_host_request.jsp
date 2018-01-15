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
<h1>판매자 신청 리스트</h1>
<table border="1">
	<tr>
		<td>유저 ID</td>
		<td>호스트 이름</td>
		<td>신청 정보 확인하기</td>
		<td>참고사항(거절 사항)</td>
	</tr>
	
	<jl:forEach var="vo" items="${ls}">
		<tr>
			<td><a href="admin_host_user_check.do?user_id=${vo.user_id}">${vo.user_id}</a></td>
			<td>${vo.host_name}</td>
			<td><a href="admin_host_request_view.do?crn=${vo.crn}">정보 확인 하기</a></td>
			<td>${vo.etc}</td>
		</tr>
	</jl:forEach>
</table>

</body>
</html>