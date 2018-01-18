<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<script>
$(document).ready(function(){
	// ���� ���� ���� �Ϸ�� ���
	$("#basic_mobody").html("<h4>������ �Ϸ� �Ǿ����ϴ�.<h4>");
	$(".mod_complete").on("click",function(){
		$("#basic_modal").modal("show");
	});
	$("#basic_modal_yes").on("click",function(){
		$("#frm").submit();
	});

});
</script>
</head>
<body>
<h1>���� ���� �� ���� �����ϱ�</h1>
<table border="1">
	<tr>
		<td>�̸�</td>
		<td>���� ID</td>
		<td>��ȭ��ȣ</td>
		<td>�г���</td>
		<td>���� ��ȣ</td>
		<td>�� �ּ�</td>
		<td>�̸���</td>
	</tr>
	<tr>
		<td>${vo.user_name}</td>
		<td>${vo.user_id}</td>
		<td>${vo.phone}</td>
		<td>${vo.nickname}</td>
		<td>${vo.zipcode}</td>
		<td>${vo.zipdetail}</td>
		<td>${vo.email}</td>
	</tr>
</table>
<br/>
<br/>
<form method="POST" action="admin_user_mod2.do" method="post" id="frm">
		<input type ="hidden" name="user_id" value="${vo.user_id}"></input>
		�̸� : <input type="text" name="user_name" value="${vo.user_name}" /> <br/>
		��ȭ��ȣ : <input type="text" name="phone" value="${vo.phone}" /> <br/>
		�г��� : <input type="text" name="nickname" value="${vo.nickname}" /> <br/>
		���� ��ȣ : <input type="text" name="zipcode" value="${vo.zipcode}" /> <br/>
		�� �ּ� : <input type="text" name="zipdetail" value="${vo.zipdetail}" /> <br/>
		�̸��� : <input type="text" name="email" value="${vo.email}" /> <br/><br/>
	<input type="button" class="mod_complete" value="���� �Ϸ� �ϱ�"/>
</form>
<br>

<form method="POST" action="admin_users.do">
	<button type="submit">����ϱ�</button>
</form>

<!-- ���� ���� ���� �Ϸ�� ��� -->
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