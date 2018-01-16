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
		$("#myAlert").on("click",function(e){
			e.preventDefault();
			$("#addwrite2").modal("show");
		});
		
		$("#btn-submit").on("click",function(){
			$('#text_addform').submit();
		});
	});
	
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
		<input id="myAlert" class="btnAdd btn-success" type="submit" value="���" />
		<input type="button"class="btn btn-success" id="cancel" value="���"/>
	</form>
	
	<!--alert �����  -->
	
	<!-- ����� -->
	<div class="modal fade" id="addwrite2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">��</span> <span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">�˸�</h4>
				</div>
				<div class="modal-body">�۵���Ͻðڽ��ϱ�</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
					<button type="button" class="btn btn-primary" id="btn-submit">Ȯ��</button>
				</div>
			</div>
		</div>
	</div>


</body>
</html>