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

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<script>

</script>
</head>
<body>
<h1>개별 유저 상세 정보 수정하기</h1>
<table border="1">
	<tr>
		<td>이름</td>
		<td>유저 ID</td>
		<td>전화번호</td>
		<td>닉네임</td>
		<td>주소</td>
		<td>이메일</td>
	</tr>
	<tr>
		<td>${vo.user_name}</td>
		<td>${vo.user_id}</td>
		<td>${vo.phone}</td>
		<td>${vo.nickname}</td>
		<td>${vo.zipcode}</td>
		<td>${vo.email}</td>
	</tr>
</table>
<br/>
<br/>
<form method="POST" action="admin_user_mod2.do">
		<input type ="hidden" name="user_id" value="${vo.user_id}"></input>
		이름 : <input type="text" name="user_name" value="${vo.user_name}" /> <br/>
		전화번호 : <input type="text" name="phone" value="${vo.phone}" /> <br/>
		닉네임 : <input type="text" name="nickname" value="${vo.nickname}" /> <br/>
		주소 : <input type="text" name="zipcode" value="${vo.zipcode}" /> <br/>
		이메일 : <input type="text" name="email" value="${vo.email}" /> <br/>
	<button type="submit">수정하기</button>
</form>

<form method="POST" action="admin_users.do">
	<button type="submit">취소하기</button>
</form>

</body>
</html>