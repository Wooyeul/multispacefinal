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
		<h1>관리자 1:1 쪽지 보내기</h1>
	</div>
	<form action="admin_writing_message.do" class="form-group" method="POST" name="frm">
		<input type="hidden" name="send_user_id" value="admin" />
		받는 사람 : <input type="text" name="receive_user_id" size="30" /> <br>
		<br> 쪽지 내용:
		<textarea name="msg_content" rows="10" cols="60"></textarea>
		<br> <input class="btn btn-success" type="submit" value="메시지 보내기" />
		<input type="button"class="btn btn-success" id="cancel" value="취소하기"/>
	</form>

</body>
</html>