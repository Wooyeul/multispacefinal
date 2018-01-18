<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<style type="text/css">
		.jumbotron{
			text-align:center;
		}
		.content{
			height : 100px;
		}
		td, th {
			text-align:center;
		}
	</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(document).ready(function() {
	// QnA ���� �Ϸ�� ���
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
	<form action="admin_community_qna_mod2.do" method="POST" id="frm">
		���� : <input type="text" name="com_qna_title" value="${vo.com_qna_title}"/><br/>
		���� :<textarea name="com_qna_content" rows="7" cols="63">${vo.com_qna_content}</textarea>
		<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}"/>
		<input type="button" class="mod_complete" value="�����Ϸ�"/>
	</form>

<!-- QnA ���� �Ϸ�� ��� -->
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