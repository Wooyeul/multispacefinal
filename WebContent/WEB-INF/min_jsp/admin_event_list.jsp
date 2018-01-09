<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">

		<!-- Main component for a primary marketing message or call to action -->
		<div class="jumbotron">
			<h1>Multi Event</h1>
		</div>

	</div>
	
	<br/>
	
	<table border="1" cellspacing="0" cellpadding="8">
	
		<jl:forEach var="vo" items="${rl}">
			<tr>
				<td>${vo.eve_no}</td>
				<td><a href="admin_event_read.do?eve_no=${vo.eve_no}"><img src="thumbnail/${vo.eve_thumb_img}" height="100" width="100"/></a></td>
				<td>
					<a href="admin_event_read.do?eve_no=${vo.eve_no}">${vo.eve_title}</a>
				</td>
				<td>${vo.the_time} </td>
			</tr>
		</jl:forEach>
	</table>
		
		
	<br/>
	<form action="event_add.do" method="GET">
		<input type="submit" value="이벤트 등록">
	</form>
	
</body>
</html>