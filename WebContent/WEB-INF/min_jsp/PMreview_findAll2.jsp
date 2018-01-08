<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".space_no").on("click",function(){
			var temp = $(this).attr("abc");
			alert(temp);
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<form >
	<h3>Review</h3>
	<table border="1">
		<tr>
			<th>�����ȣ</th>
			<th>���ȣ</th>
			<th>���̵�</th>
			<th>����</th>
			<th>����</th>
			<th>�ð�</th>
			<th>����</th>
			<th>�̹���</th>
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
				<td><img src="img/${rl.review_img}" width="100px" class="space_no" abc="${rl.space_no}"/></td>
			</tr>
		</jl:forEach>
	</table>
	</form>

</body>
</html>