<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
table {
	text-align: center;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<script>
$(document).ready(function(){
	// �Ǹ��� ��Ͻ� ���
	$(".host_join").on("click",function(){
		$("#text_modal").modal("show");
	});
	$("#text_modal_yes").on("click",function(){
		var crn = $("#crn").val();
		var user_id = $("#user_id").val();
		var host_name = $("#host_name").val();
		var host_account = $("#host_account").val();
		var zipcode = $("#zipcode").val();
		var etc = $("#etc").val();
		location.href = "admin_host_user_accept.do?crn=" + crn 
			+ "&user_id=" + user_id + "&host_name=" + host_name + "&host_account=" + host_account
			+ "&zipcode=" +zipcode+ "&etc="+etc;
		$("#text_modal_modal").modal("hide");
	});
	$("#text_modal_no").on("click",function(){
		$("#text_modal").modal('hide');
	});
	
	// �Ǹ��� ��û ������ ���
	$(".host_request_refuse").on("click",function(){
		$("#text_modal2").modal("show");
	});
	$("#text_modal_yes2").on("click",function(){
		var host_apply_no = $("#host_apply_no").val();
		location.href = "admin_host_user_remove_request.do?host_apply_no=" + host_apply_no;
		$("#text_modal_modal").modal("hide");
	});
	$("#text_modal_no2").on("click",function(){
		$("#text_modal2").modal('hide');
	});

});
</script>
</head>
<body>
<h1>�Ǹ��� ��û ����</h1>
<table border="1">
	<tr>
		<td>����� ��ȣ</td>
		<td>���� ID</td>
		<td>�Ǹ��� �̸�</td>
		<td>�Ǹ��� ����</td>
		<td>�����ȣ</td>
		<td>�������(���� ����)</td>
	</tr>
	<tr>
		<td>${vo.crn}</td>
		<td>${vo.user_id}</td>
		<td>${vo.host_name}</td>
		<td>${vo.host_account}</td>
		<td>${vo.zipcode}</td>
		<td>${vo.etc}</td>
	</tr>
</table>
<br/>
<form method="post" action="admin_host_user_accept.do">
	<input type="hidden" name="crn" id="crn" value="${vo.crn}"></input>
	<input type="hidden" name="user_id" id="user_id" value="${vo.user_id}"></input>
	<input type="hidden" name="host_name" id="host_name" value="${vo.host_name}"></input>
	<input type="hidden" name="host_account" id="host_account" value="${vo.host_account}"></input>
	<input type="hidden" name="zipcode" id="zipcode" value="${vo.zipcode}"></input>
	<input type="button" class="host_join" value="�Ǹ��� ��� �ϱ�" />
</form>
<br/>
<form method="post" action="admin_host_user_refuse_write.do">
	<input type="hidden" name="host_apply_no" id="host_apply_no" value="${vo.host_apply_no}"></input>
	<input type="hidden" name="etc" id="etc" value="${vo.etc}"></input>
	<button type="submit">���� ����(���� ����) �ۼ� �ϱ�</button>
</form>
<br/>
<form method="post" action="admin_host_user_remove_request.do">
	<input type="hidden" name="host_apply_no" value="${vo.host_apply_no}"></input>
	<input type="button" class="host_request_refuse" value="�Ǹ��� ��û ���� ����" />
</form>
<br/>
<form method="post" action="admin_host_request.do">
	<button type="submit">��� �ϱ�</button>
</form>


<!-- �Ǹ��� ��Ͻ� ��� -->
<div id="text_modal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div id="text_mohead" class="modal-header"align="center"><h4>�Ǹ��� ���</h4></div>
			<div id="text_mobody" class="modal-body" align="center">
				<h4>�Ǹ��� ��� �Ͻðڽ��ϱ�?</h4>
			</div>
			<div id="text_ft" class="modal-footer">
				<button type='button' class='btn btn-default' to-delete="delete_${vs.count}"  id='text_modal_yes'>Ȯ��</button>
				<button type='button' class='btn btn-primary' id='text_modal_no'>���</button>
			</div>
		</div>
	</div>
</div>

<!-- �Ǹ��� ��û ���� ������ ��� -->
<div id="text_modal2" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div id="text_mohead2" class="modal-header"align="center"><h4>�Ǹ��� ��û ���� ����</h4></div>
			<div id="text_mobody2" class="modal-body" align="center">
				<h4>�Ǹ��� ��û ���� ���� �Ͻðڽ��ϱ�?</h4>
			</div>
			<div id="text_ft2" class="modal-footer">
				<button type='button' class='btn btn-default' to-delete="delete_${vs.count}"  id='text_modal_yes2'>Ȯ��</button>
				<button type='button' class='btn btn-primary' id='text_modal_no2'>���</button>
			</div>
		</div>
	</div>
</div>

</body>
</html>