<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<style type="text/css">
		.jumbotron{
			text-align:center;
		}
		.container{
			height : 50px;
		}
		.content{
			height : 100px;
		}
	
	</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<script>
$(document).ready(function(){ 
	// ���� ������ ���
	$("#remove_notice").on("click",function(){
		$("#notice_No").val( $(this).attr("notice_no") );
		$("#text_modal").modal("show");
	});
	$("#text_modal_yes").on("click",function(){
		var del_notice_no = $("#notice_No").val();
			location.href = "admin_notice_del.do?notice_no=" + del_notice_no;
		$("#text_modal_modal").modal("hide");
	});
	$("#text_modal_no").on("click",function(){
		$("#text_modal").modal('hide');
	});
	
	$("#notice_list").on("click",function(){
		location.href="admin_notice_list.do";
	});

});
</script>
</head>
<body>

	<br>
	<div class="row">
		<div class="col-lg-12">
		 <p> <label> �������� �ۺ��� </label></p> 
			<hr style="border: solid 0.5px black;">
			
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>NO</th>
							<th>SUBJECT</th>
						</tr>
					</thead>
					<tr>
						<td>${vo.notice_no}</td>
						<td>${vo.notice_title}</td>
					</tr>
					<tr>
						<td class="table_content" colspan="2">
							<div class="pre" style="padding: 10px; height: auto; min-height: 100px; overflow: auto;">
								<pre style="white-space: pre-wrap;">${vo.notice_content}}</pre>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<form action="admin_notice_mod.do" method="post">
								<input type="hidden" name="notice_no" value="${vo.notice_no}"/>
								<input type="hidden" name="notice_title" value="${vo.notice_title}"/>
								<input type="hidden" name="notice_content" value="${vo.notice_content}"/>
								<input type="button" id="notice_list" value="�������"/> &nbsp;&nbsp;&nbsp;
								<input type="submit" value="��������"/> &nbsp;&nbsp;&nbsp;
								<input type="button" id="remove_notice" notice_no="${vo.notice_no}" value="��������"/>
							</form>
						</td>
					</tr>
					<tr>
						<td>
						
						</td>
					</tr>
				</table>
			</div>
	
		
		

	
	
<!-- ���� ������ ��� -->
<div id="text_modal" class="modal fade" role="dialog">
	<input type="hidden" id="notice_No" value="0"/>
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