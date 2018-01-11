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
<h1>판매자 리스트</h1> 
<table border="1">
	<tr>
		<td>사업자 번호</td>
		<td>유저 ID</td>
		<td>호스트 이름</td>
		<td>호스트 계좌 번호</td>
		<td>주소</td>
		<td>판매자 공간</td>
		<td>사용자로 강등</td>
		<td>탈퇴 시키기</td>
	</tr>
	<jl:forEach var="vo" items="${ls}">
		<tr> 
			<td>${vo.crn}</td>
			<td><a href="admin_host_user_check.do?user_id=${vo.user_id}">${vo.user_id}</a></td>
			<td>${vo.host_name}</td>
			<td>${vo.host_account}</td>
			<td>${vo.zipcode}</td>
			<td><a href="admin_host_spaces.do?crn=${vo.crn}&host_name=${vo.host_name}">판매자 공간 확인 하기</a></td>
			<td><a href="admin_host_user_downgrade_write.do?crn=${vo.crn}&user_id=${vo.user_id}">강등시키기</a></td>
			<td><a href="admin_user_del_write.do?crn=${vo.crn}&user_id=${vo.user_id}">탈퇴시키기</a></td>
		</tr>
	</jl:forEach>
</table>

</body>
</html>