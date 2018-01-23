<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
p {
	text-align: center;
}

.select {
	float: left;
	padding-right: 5px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<!-- Bootstrap Core CSS -->
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="./Resouces_admin/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="./Resouces_admin/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="./Resouces_admin/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="./Resouces_admin/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="./Resouces_admin/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
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
	<br />

	<p>
		<label> ������ �ϴ��� ���������� </label>
	</p>
	<hr style="border: solid 0.5px black;">
	<br />
	<form action="admin_writing_message.do" class="form-group"
		method="POST" name="frm">
		<input type="hidden" id="send_user_id" name="send_user_id" value="admin" /> 
		<label>�޴»��</label>
		<br />
		<div class="select">
			<input type="text" class="form-control" id="receive_user_id"
				name="receive_user_id" style="width: 300px;" />
		</div>

		<input type="button" class="btn" id="primary_id" value="ID ���� ���� Ȯ��" />


		<br /> <label>��������</label>
		<textarea id="msg_content" name="msg_content" rows="15"
			class="form-control"> </textarea>
		<br> <input id="m_submit" class="btn" type="button"
			value="�޽��� ������" /> <input type="button" class="btn" id="cancel"
			value="����ϱ�" />
	</form>

	<form id="ck_total">
		<div id="repleModal" class="modal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<label id="lblContent"></label><br />
						<button type="button" class="btn btn-primary btn-sm" id="btnClose"
							data-dismiss="modal">�ݱ�</button>
					</div>
				</div>
			</div>
		</div>
	</form>

	<!-- �޼��� ���� �κ� ��� -->
	<div id="text_modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="text_mohead" class="modal-header" align="center">
					<h4>�޼��� ������</h4>
				</div>
				<div id="text_mobody" class="modal-body" align="center">
					<h4>�޼����� �����ڽ��ϱ�?</h4>
				</div>
				<div id="text_ft" class="modal-footer">
					<button type='button' class='btn btn-default'
						to-delete="delete_${vs.count}" id='text_modal_yes'>Ȯ��</button>
					<button type='button' class='btn btn-primary' id='text_modal_no'>���</button>
				</div>
			</div>
		</div>
	</div>

	<!-- �޼��� ���� �Ϸ� �κ� ���-->
	<div id="basic_modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="basic_mobody" class="modal-body" align="center"></div>
				<div id="basic_ft" class="modal-footer">
					<button type='button' class='btn btn-default' id='basic_modal_yes'>�ݱ�</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>