<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".space_no").on("click",function(){
			var temp = $(this).attr("abc");
			window.parent.location.href="space_detail.do?space_no="+temp;
		});
	});
</script>
</head>
<body>
	<form name="frm">
	<h3>Review</h3>
	<table border="1">
		<tr>
			<th>리뷰번호</th>
			<th>방번호</th>
			<th>아이디</th>
			<th>제목</th>
			<th>내용</th>
			<th>시간</th>
			<th>별점</th>
			<th>이미지</th>
		</tr>
		<jl:forEach items="${rl}" var="rl">
			<tr>
				<td>${rl.review_no}</td>
				<td>${rl.space_no}</td>
				<td>${rl.user_id}</td>
				<td>${rl.review_title}</td>
				<td>${rl.review_content}</td>
				<td>${rl.the_time}</td>
				<td>${rl.review_score}</td>
				<td><img src="thumbnail/${rl.review_img}" width="100px" class="space_no" abc="${rl.space_no}"/></td>
			</tr>
		</jl:forEach>
	</table>
	</form>

</body>
</html>