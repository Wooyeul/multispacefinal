<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
</head>
<body>
	<form name="frm">
	<h3>Myclub</h3>
	<table border="1">
		<tr>
			<th>클럽번호</th>
			<th>아이디</th>
			<th>클럽이름</th>
			<th>제목</th>
			<th>내용</th>
			<th>이미지</th>
			<th>최대인원</th>
		</tr>
		<jl:forEach items="${rl}" var="rl">
			<tr>
				<td>${rl.club_no}</td>
				<td><a href="club_community.do?club_no=${rl.club_no}">${rl.user_id}</a></td>
				<td>${rl.club_name}</td>
				<td>${rl.club_title}</td>
				<td>${rl.club_content}</td>
				<td><img src="img/${rl.club_thumb_img}" width="100px" /></td>
				<td>${rl.max_member}</td>
			</tr>
		</jl:forEach>
	</table>
	</form>
	
</body>
</html>