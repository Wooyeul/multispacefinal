<%@ page language="java" contentType="text/html; charset=euc-kr"
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
	<script type="text/javascript">
		$(document).ready(function(){
			$("#btn").on("click",function(){
				location.href="club_add_page.do";
			});
		});
	</script>
</head>
<body>
	<div class="container">
		<h2>모임 페이지</h2>
		<table>
			<tr>
				<td>번호</td>
				<td>제목</td>
			</tr>
			<jl:forEach  var="vo" items="${pvo}" varStatus="vs">
				<tr>
					<td id="no" align="center">${vo.club_no}</td>
					<td><a href="club_detail.do?club_no=${vo.club_no}">${vo.club_title}</a></td>
				</tr>
			</jl:forEach>
		</table>
		<input id="btn" type="button" value="모임등록"/>
	</div>
</body>
</html>