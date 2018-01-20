<%@ page contentType="text/html;charset=utf-8" pageEncoding="euc-kr"%><%@
taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>Welcome to Multi Space</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

.p{
text-align: center;
}

</style>
	<link rel="stylesheet" type="text/css" href="./Resources/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="./Resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="./Resources/css/responsive.css">
	
	<script type="text/javascript" src="./Resources/js/jquery.js"></script>
	<script type="text/javascript" src="./Resources/js/main.js"></script>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="common.js"></script>
	

<!-- ������ 3�� -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>
	
	<style type="text/css">
	
		
	</style>

<script>

$(document).ready(function(){
	/* �⺻ ���â �ݱ� ��ư Ŭ���� �̺�Ʈ ���� */
	$("#basic_modal_Yes").on("click",function(){
		$("#basic_modal").modal("hide");
	});
	
	/* ���� ��ư Ŭ�� �� �̺�Ʈ ���� */
	$("#btnMod").on("click",function(){
		$("#text_mod_modal").modal("show");
		$("#text_modal_Yes").on("click",function(){	
			$("#text_mod_modal").modal("hide");	
			$("#basic_mobody").html("<h4>���� �����Ǿ����ϴ�.</h4>");
			$("#basic_modal").modal("show");
			$("#basic_modal").on("hidden.bs.modal",function(){
				$("#modform").submit();
			});
		});//yes
		$("#text_modal_No").on("click",function(){	
			$("#text_mod_modal").modal("hide");	
		});//No
	});//btnMod
	
});//ready

</script> 
<script>
$(document).ready(function() {
	$("#summernote").summernote({
        lang: 'ko-KR',
		height : 300, // set editor height
		minHeight : null, // set minimum height of editor
		maxHeight : null, // set maximum height of editor
		focus : true // set focus to editable area after initializing summernote 
	
	});
});
</script>


</head>
<body>
<br/>
	<p class="p"><label>�ۼ���</label></p>
	<hr style="border: solid 0.5px black;">
		<div class="col-lg-12">
		<div class="container">
		<form action="community_board_mod2.do" method="POST" id="modform">
		
			<label>����</label>
				<input class="form-control" type="text" name="com_board_title" value="${mvo.com_board_title}"/><br/>
				<input type="hidden"  name="user_id" value="${mvo.user_id}" />
			<label>����</label>
				<textarea id="summernote" name="com_board_content">${mvo.com_board_content}</textarea>
				<input type="hidden" name="com_board_no" value="${mvo.com_board_no}"/>
	
				<input type="button" value="����" class="btn" id="btnMod"/>
			
		</form>
		</div>
	</div>

	
	
	
	<!-- �� ���� modalâ ���� -->
	<div id="text_mod_modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="mohead" class="modal-header" align="center"><h4>�� ����</h4></div>
				<div id="mobody" class="modal-body" align="center">
				<h4>���� ���� �Ͻðڽ��ϱ�?</h4>
				</div>
				<div id="ft" class="modal-footer">
					<button type='button' class='btn btn-default' id='text_modal_Yes'>����</button>
					<button type='button' class='btn btn-primary' id='text_modal_No'>���</button>
				</div>
			</div>
		</div>
	</div>
	<!-- �� ���� modalâ �� -->	
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
	
	<!--�ۼ������â -->
	<div class="modal fade" id="modtext" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">��</span> <span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">�˸�</h4>
				</div>
				<div class="modal-body">���� ������ ������ �����Ͻðڽ��ϱ�?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
					<button type="button" class="btn btn-primary" id="success">Ȯ��</button>
				</div>
			</div>
		</div>
	</div>
	

	<!-- �ۼ������â_������ư������ -->
	<div class="modal fade" id="modalmod" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">��</span> <span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">�˸�</h4>
				</div>
				<div class="modal-body">����� �Ǹ��� ���� �����Ǿ����ϴ� !</div>
				<div class="modal-footer">
					<button id="modalmodclose"type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
				
				</div>
			</div>
		</div>
	</div>


</html>