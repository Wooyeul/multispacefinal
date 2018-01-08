<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"> 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
</head>
<body>

	<div class="container">
		<H1>공간 홈</H1>
		<hr/>
		<a href="space_add.do">공간 등록</a>
		<hr/>
		<table border="1">
		<jl:forEach var="vo" items="${list }">
			<tr>
				<td><a href="space_detail.do?space_no=${vo.space_no }"><img src="thumbnail/${vo.space_thumb_img }"/></a></td>
				<td>${vo.space_no }</td>
				<td>${vo.crn }</td>
			</tr>
			
		</jl:forEach>
		</table>
	</div>
	
</body>
</html>