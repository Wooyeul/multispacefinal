<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<script>
$(document).ready(function(){ 
	$("#basic_mobody").html("<h4>수정이 완료 되었습니다.<h4>");
	$(".mod_complete").on("click",function(){
		$("#basic_modal").modal("show");
	});
	//
	// 창이 닫히면 페이지 reload. 필요한 사람은 사용하세요.
	$("#basic_modal").on("hidden.bs.modal",function(){
		//location.reload();
	});
	$("#basic_modal_yes").on("click",function(){
		$("#frm").submit();
	});

});
</script>
</head>
<body>
	<form action="admin_notice_mod2.do" method="POST" id="frm" >
		제목 : <input type="text" name="notice_title" value="${vo.notice_title}"/><br/>
		내용 :<textarea name="notice_content" rows="7" cols="63">${vo.notice_content}</textarea>
		<input type="hidden" name="notice_no" value="${vo.notice_no}"/>
		<input type="button" class="mod_complete" value="수정완료"/>
	</form>
	
	<div id="basic_modal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div id="basic_mobody" class="modal-body" align="center">
			</div>
			<div id="basic_ft" class="modal-footer">
				<button type='button' class='btn btn-default' id='basic_modal_yes'>닫기</button>
			</div>
		</div>
	</div>
</div>		
</body>
</html>