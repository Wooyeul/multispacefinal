<%@ page contentType="text/html;charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
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
		<h1>���� ���� ������</h1>
	</div>
	
	<table border="1">
		<tr>
			<td>���� ���� ID</td>
			<td>���� ����</td>
			<td>�ۼ� �ð�</td>
			<td>���� Ȯ��</td>
		</tr>
		<jl:forEach var="vo" items="${ls}">
		<tr>
			<td>${vo.send_user_id }</td>
			<jl:set var = "string1" value = "${vo.msg_content}"/>
			<jl:choose>
				<jl:when test="${fn:length(string1) > 10}">
      				<jl:set var = "string2" value = "${fn:substring(string1, 1, 10)}" />
					<td>${string2}&nbsp;<a href="#">�ڼ��� ����</a></td>
				</jl:when>
				<jl:when test="${fn:length(string1) <= 10}">
					<td>${vo.msg_content}</td>
				</jl:when>
			</jl:choose>
			
			<td>${vo.the_time }</td>
			<jl:choose>
				<jl:when test="${vo.view_count == 0}">
					<td>���� ����</td>
				</jl:when>
				<jl:when test="${vo.view_count >= 1}">
					<td>����</td>
			</jl:when>
			</jl:choose>
		</tr>
		</jl:forEach>
	</table>

</body>
</html>