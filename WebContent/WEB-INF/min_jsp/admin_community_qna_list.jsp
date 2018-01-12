<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<style type="text/css">
	.jumbotron{
		text-align:center;
	}
	th, td {
		text-align: center;
	}
	</style>
</head>
<body>
	<div id="i" class="jumbotron panel-primary">
		<h1>QnA</h1>
	</div>
	<table border="1" cellspacing="0" cellpadding="8" class="table table-hover">
		<tr>
			<th width="40">QnA번호</th>
			<th>유저</th>
			<th width="200">제목</th>
			<th>조회수</th>
			<th>날짜</th>
		</tr>
		<jl:forEach var="vo" items="${rl}">
			<tr>
				<td>${vo.com_qna_no}</td>
				<td>${vo.user_id}</td>
				<td><a href="admin_community_qna_read.do?com_qna_no=${vo.com_qna_no}">${vo.com_qna_title}</a></td>
				<td>${vo.view_count}</td>
				<td>${vo.the_time}</td>
			</tr>
		</jl:forEach>
	</table>
		<form action="admin_community_qna_add.do" method="post">
			<input type="submit" value="글쓰기" class="btn btn-success" type="button"/>
		</form>
	<br>
	<br>
	<form id="textsearch" action="admin_community_qna_search.do">
	<select name="commsearch_option">
		<option value="0">선택해주세요</option>
		<option value="1">제목</option>
		<option value="2">내용</option>
		<option value="3">제목 + 내용</option>
		<option value="4">작성자</option>
	</select>
	검색 : <input type="text" name="commsearch_content">
	<input type="submit" value="검색">
</form>
</body>
</html>