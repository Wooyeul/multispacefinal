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
	// �̺�Ʈ ������ ���
	$("#remove_eve").on("click",function(){
		$("#eve_No").val( $(this).attr("eve_no") );
		$("#text_modal").modal("show");
	});
	$("#text_modal_yes").on("click",function(){
		var del_eve_no = $("#eve_No").val();
			location.href = "admin_event_del2.do?eve_no=" + del_eve_no;
		$("#text_modal_modal").modal("hide");
	});
	$("#text_modal_no").on("click",function(){
		$("#text_modal").modal('hide');
	});

});
</script>
</head>
<body>		

	<form method="POST" action="admin_event_mod.do" >
		<label>�̺�Ʈ ����</label><br/><br/>
		<input type="text" name="eve_title" value="${text.eve_title}"  style="width:100%;" class="form-control"/><br/>
		<label>�̺�Ʈ ����</label><br/><br/>
		<pre><input type="text" name="eve_content" class="form-control" style="width:100%; height: 300px;"value="${text.eve_content}"/></pre> <br/>
		<input type="hidden" name="eve_no" value="${text.eve_no}" />
		
		<label>�̺�Ʈ �����</label><br/><br/>
		<img src="thumbnail/${text.eve_thumb_img}" height="100" width="100"/><br/>
		<input type="submit" value="���� �ϱ�" /> &nbsp;&nbsp;
		<%-- <a href="admin_event_del2.do?eve_no=${text.eve_no}">����</a> --%>
		<input type="button" id="remove_eve" eve_no="${text.eve_no}" value="�����ϱ�" />&nbsp;&nbsp;
		<input type="button" value="��� �ϱ�" onclick= "window.location.href='admin_event_list.do'">
	</form>
		
<!-- �̺�Ʈ ������ ��� -->
<div id="text_modal" class="modal fade" role="dialog">
	<input type="hidden" id="eve_No" value="0"/>	
	<div class="modal-dialog">
		<div class="modal-content">
			<div id="text_mohead" class="modal-header"align="center"><h4>�� ����</h4></div>
			<div id="text_mobody" class="modal-body" align="center">
				<h4>���� ���� �Ͻðڽ��ϱ�?</h4>
			</div>
			<div id="text_ft" class="modal-footer">
				<button type='button' class='btn btn-default' to-delete="delete_${vs.count}"  id='text_modal_yes'>Ȯ��</button>
				<button type='button' class='btn btn-primary' id='text_modal_no'>���</button>
			</div>
		</div>
	</div>
</div>
		
		
</body>
</html>