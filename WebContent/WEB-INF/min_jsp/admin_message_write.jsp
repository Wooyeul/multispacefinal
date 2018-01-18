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
	
	// ID �ߺ� üũ. ID ���� �� ���� �õ�
	var flag = 0;
	var user_id;
	$("#primary_id").on("click",function(){
		user_id = $("#send_user_id").val();
		var url ="overlap.do?user_id="+user_id;
		ajaxGet(url,function(rt){
			if(rt==1){
				$("#lblContent").text("ID�� �����մϴ�. ���������Ⱑ �����մϴ�.");
				$("#repleModal").modal("show");
				flag = 1;
			} else if(user_id==""){
				$("#lblContent").text("���̵� �Է��ϼ���");
				$("#repleModal").modal("show");
			} else if( rt == 0){
				$("#lblContent").text("ID�� �������� �ʾ� ���� �����Ⱑ �Ұ��� �մϴ�.");
				$("#repleModal").modal("show");
				$("#user_id").val("");
			} 
		});
	});
	$("#basic_mobody").html("<h4>�޼��� ������ �Ϸ� �Ǿ����ϴ�.<h4>");
	$("#m_submit").on("click",function(){
		$("#text_modal").modal("show");
		$("#text_modal_yes").on("click",function(){
			$("#text_modal").modal("hide");
			var user_id_check = $("#receive_user_id").val();
			var send_user_id = $("#send_user_id").val();
			var msg_content = $("#msg_content").val();			
			if(user_id_check==""){
				$("#lblContent").text("���̵� �Է��ϰ� �ߺ��˻� ���ּ���.");
				$("#repleModal").modal("show");
			} else if(flag==0){
				$("#lblContent").text("���̵� üũ ���ּ���.");
				$("#repleModal").modal("show");
			} else {
				var wrting_url = "admin_writing_message.do?send_user_id="+send_user_id 
				+"&receive_user_id="+user_id_check +"&msg_content="+msg_content;		
				ajaxGet(wrting_url,function(rt){ });	
				$("#basic_modal").modal("show");
				$("#basic_modal_yes").on("click",function(){
					$("#text_modal").modal('hide');
					location.reload();
				});
			}
		});			
	});
	$("#btnClose").on("click",function(){
		$("#repleModal").modal("hide");
	});
	$("#text_modal_no").on("click",function(){
		$("#text_modal").modal('hide');
	});
	

});

</script>
</head>
<body>
	<div class="jumbotron" style="background-color: orange">
		<h1>������ 1:1 ���� ������</h1>
	</div>
	<form action="admin_writing_message.do" class="form-group" method="POST" name="frm">
		<input type="hidden" name="send_user_id" value="admin" id="send_user_id"/>
		�޴� ��� : <input type="text" id="receive_user_id" name="receive_user_id" size="30" /> 
					<input type="button" id="primary_id" value="ID ���� ���� Ȯ��" />
					<div id="dvname"></div>
					
					<br> 
		<br> ���� ����:
		<textarea id="msg_content" name="msg_content" rows="10" cols="60"></textarea>
		<br> <input id="m_submit" class="btn btn-success" type="button" value="�޽��� ������" />
		<input type="button"class="btn btn-success" id="cancel" value="����ϱ�"/>
	</form>
	
	<form id="ck_total">
		<div id="repleModal" class="modal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
							<label id="lblContent"></label><br/>
							<button type="button" class="btn btn-primary btn-sm" id="btnClose" data-dismiss="modal">�ݱ�</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	
<!-- �޼��� ���� �κ� ��� -->	
<div id="text_modal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div id="text_mohead" class="modal-header"align="center"><h4>�޼��� ������</h4></div>
			<div id="text_mobody" class="modal-body" align="center">
				<h4>�޼����� �����ڽ��ϱ�?</h4>
			</div>
			<div id="text_ft" class="modal-footer">
				<button type='button' class='btn btn-default' to-delete="delete_${vs.count}"  id='text_modal_yes'>Ȯ��</button>
				<button type='button' class='btn btn-primary' id='text_modal_no'>���</button>
			</div>
		</div>
	</div>
</div>
<!-- �޼��� ���� �Ϸ� �κ� ���-->
<div id="basic_modal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div id="basic_mobody" class="modal-body" align="center">
			</div>
			<div id="basic_ft" class="modal-footer">
				<button type='button' class='btn btn-default' id='basic_modal_yes'>�ݱ�</button>
			</div>
		</div>
	</div>
</div>
	
	
</body>
</html>