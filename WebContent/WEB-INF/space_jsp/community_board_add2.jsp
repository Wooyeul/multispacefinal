<%@ page contentType="text/html;charset=utf-8" pageEncoding="euc-kr"%><%@
taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

</style>
<script src="common.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$("#basic_modal_Yes").on("click",function(){
			$("#basic_modal").modal("hide");
		});
		/* �� ��� ��ư Ŭ�� �� �̺�Ʈ �߻� */
		$("#myAlert").on("click",function(){
			$("#text_modal").modal("show");
			$("#text_yes").on("click",function(){
				$("#text_modal").modal("hide");
				$("#basic_mobody").html("<h4>���� ��� �Ǿ����ϴ�.</h4>");
				$("#basic_modal").modal("show");
				$("#basic_modal").on("hidden.bs.modal",function(){
					$("#text_addform").submit();
				});
			});
			$("#text_no").on("click",function(){
				$("#text_modal").modal("hide");
			});
		});
	})

</script>


</head>
<body>
	<div class="jumbotron" style="background-color: orange">
		<h1>�����Խ��� �۾��� ����</h1>
	</div>
	<form action="community_board_add2.do" class="form-group" method="POST" name="frm" id="text_addform">
		���� : <input type="text" name="com_board_title" size="30" /> <br>
		���Ӹ� : <select name="com_board_type">
			<option value="����">�����ϼ���</option>
			<option value="����">����</option>
			<option value="����">����</option>
			<option value="���">���</option>
			<option value="����">������</option>
			<option value="����">����</option>
		</select> <br>
		
		����:
		<textarea name="com_board_content" rows="10" cols="60"></textarea>
		<br> 
		<input id="myAlert" class="btnAdd btn-success" type="button" value="���" />
		<input type="button"class="btn btn-success" id="cancel" value="���"/>
	</form>
	
	<!--alert �����  -->
	<!-- �۵�� modalâ ���� -->
	<div id="text_modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="mohead" class="modal-header"align="center"><h4>�� ���</h4></div>
				<div id="mobody" class="modal-body" align="center"><h4>���� ��� �Ͻðڽ��ϱ�?</h4></div>
				<div id="ft" class="modal-footer">
					<button type="button" class="btn btn-default" id="text_yes">Ȯ��</button>
					<button type='button' class='btn btn-primary' id='text_no'>���</button>
				</div>
			</div>
		</div>
	</div>
	<!-- �۵�� modalâ �� -->

	<!-- �⺻ modalâ ���� -->
	<div id="basic_modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="basic_mobody" class="modal-body" align="center">
				</div>
				<div id="basic_ft" class="modal-footer">
					<button type='button' class='btn btn-default' id='basic_modal_Yes'>�ݱ�</button>
				</div>
			</div>
		</div>
	</div>
	<!-- �⺻ modalâ �� -->
</body>
</html>