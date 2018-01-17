<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="common.js"></script>
<script>
	$(document).ready(function(){
		$("#cancel").on("click",function(){
			document.frm.method="POST";
			document.frm.action="admin_message_write.do";
			document.frm.submit();
		});
		
		var flag = 0;
		var user_id;
		$("#primary_id").on("click",function(){
			user_id = $("#receive_user_id").val();
			var url ="overlap.do?user_id="+user_id;
			
			ajaxGet(url,function(rt){
				if(rt==1){
					$("#lblContent").text("ID가 중복되었습니다. 쪽지보내기가 가능합니다.");
					$("#repleModal").modal("show");
					flag = 1;
				} else if(user_id==""){
					$("#lblContent").text("아이디를 입력하세요");
					$("#repleModal").modal("show");
				} else if( rt == 0){
					$("#lblContent").text("ID가 없어 쪽지 보내기가 불가능 합니다.");
					$("#repleModal").modal("show");
					$("#user_id").val("");
					
				} 
			});
		});
		$("#m_submit").on("click",function(){
			var user_id_check = $("#receive_user_id").val();	
			if(user_id_check==""){
				$("#lblContent").text("아이디를 입력하고 중복검사 해주세요.");
				$("#receive_user_id").val("");
				$("#msg_content").val("");
			}
			$("#repleModal").modal("show");
		});
		$("#btnClose").on("click",function(){
			$("#repleModal").modal("hide");
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
		받는 사람 : <input type="text" id="receive_user_id" name="receive_user_id" size="30" /> 
					<input type="button" id="primary_id" value="ID 존재 여부 확인" />
					<div id="dvname"></div>
					
					<br>
		<br> 쪽지 내용:
		<textarea id="msg_content" name="msg_content" rows="10" cols="60"></textarea>
		<br> <input id="m_submit" class="btn btn-success" type="submit" value="메시지 보내기" />
		<input type="button"class="btn btn-success" id="cancel" value="취소하기"/>
	</form>
	
	<form id="ck_total">
		<div id="repleModal" class="modal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
							<label id="lblContent"></label><br/>
							<button type="button" class="btn btn-primary btn-sm" id="btnClose" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	
</body>
</html>