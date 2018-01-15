<%@ page contentType="text/html;charset=utf-8" pageEncoding="euc-kr"%><%@
taglib
	prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

.form-group {
	text-align: center;
}

.jumbotron {
	text-align: center;
}

.btn {
	text-align: center;
}


</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script>
	$(document).ready(function(){
		$("#cancel").on("click",function(){
			document.frm.method="POST";
			document.frm.action="admin_o2oQnA.do";
			document.frm.submit();
		});
		$("#cancels").on("click",function(){
			document.frm.method="POST";
			document.frm.action="admin_o2oQnA.do";
			document.frm.submit();
		});
	});

</script>
</head>
<body>
	<div class="jumbotron" style="background-color: orange">
		<h1>1:1 문의내용들</h1>
	</div>
	<table border="1">
		<tr>
			<td>제목</td>
			<td>고객님 이메일</td>
			<td>문의 타입</td>
			<td>문의 시간</td>
			<td>답변 내용</td>
		</tr>
		<jl:forEach var="vo" items="${ls}">
		<tr>
			<td><a href="admin_o2oQnA_read.do?o2o_no=${vo.o2o_no}">${vo.o2o_title}</a></td>
			<td>${vo.o2o_email}</td>
			<td>${vo.o2o_type}</td>
			<td>${vo.the_time}</td>
			<td>없음</td>
		</tr>
		</jl:forEach>
	</table>

</body>
</html>