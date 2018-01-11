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
			<th>Ŭ����ȣ</th>
			<th>���̵�</th>
			<th>Ŭ���̸�</th>
			<th>����</th>
			<th>����</th>
			<th>�̹���</th>
			<th>�ִ��ο�</th>
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