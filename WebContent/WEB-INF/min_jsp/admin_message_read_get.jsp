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
			document.frm.action="admin_message_write.do";
			document.frm.submit();
		});
	});

</script>
</head>
<body>
	<div class="jumbotron" style="background-color: orange">
		<h1>관리자 1:1 받은 쪽지 보관함</h1>
	</div>
	
	<table border="1">
		<tr>
			<td>쪽지 번호</td>
			<td>보낸 유저 ID</td>
			<td>받는 유저 ID</td>
			<td>쪽지 내용</td>
			<td>작성 시간</td>
			<td>수신 확인</td>
		</tr>
		<jl:forEach var="vo" items="${ls}">
		<tr>
			<td>${vo.msg_no}</td>
			<td>${vo.send_user_id }</td>
			<td>${vo.receive_user_id}</td>
			<td>${vo.msg_content}</td>
			<td>${vo.the_time }</td>
			<jl:choose>
				<jl:when test="${vo.view_count == 0}">
					<td>읽지 않음</td>
				</jl:when>
				<jl:when test="${vo.view_count >= 1}">
					<<td>읽음</td>
			</jl:when>
			</jl:choose>
		</tr>
		</jl:forEach>
	</table>

</body>
</html>