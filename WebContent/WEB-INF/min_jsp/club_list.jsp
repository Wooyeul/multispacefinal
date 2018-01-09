<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>
		table, tr, td{
			border: 1px solid;
		}
	</style>
	<script type="text/javascript" src="/js/club/club_list.js"></script>
</head>
<body>
	<div class="container">
		<table style="width: 1000px">
			<tr>
				<td>번호</td>
				<td>제목</td>
			</tr>
			<jl:forEach  var="pvo" items="${vo}" varStatus="vs">
				<tr>
					<td id="no" align="center">${pvo.club_no}</td>
					<td><a href="club_detail.do?club_no=${pvo.club_no}">${pvo.club_title}</a></td>
				</tr>
			</jl:forEach>
		</table>
	</div>
</body>
</html>