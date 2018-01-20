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
	
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>

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

<br>
	<p class="p"><label>�۾���</label></p>
		<hr style="border: solid 0.5px black;">
		<div class="col-lg-12">
		<div class="container">
		<form action="community_board_add2.do" class="form-group" method="POST" name="frm" id="text_addform">
		<label>���� </label>	
		<input type="text" name="com_board_title" class="form-control" /> <br>
		
		<label>����</label>
		<textarea id="summernote" name="com_board_content" ></textarea>
		<br> 
		<input id="myAlert" class="btn" type="button" value="���" />
		<input type="button" class="btn" id="cancel" value="���"/>
	</form>
	</div>
	</div>
	


	
	
	
	
	
	
	
	
	
	
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