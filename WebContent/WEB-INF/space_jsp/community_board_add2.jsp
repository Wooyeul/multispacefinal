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
		/* 글 등록 버튼 클릭 시 이벤트 발생 */
		$("#myAlert").on("click",function(){
			$("#text_modal").modal("show");
			$("#text_yes").on("click",function(){
				$("#text_modal").modal("hide");
				$("#basic_mobody").html("<h4>글이 등록 되었습니다.</h4>");
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
	<p class="p"><label>글쓰기</label></p>
		<hr style="border: solid 0.5px black;">
		<div class="col-lg-12">
		<div class="container">
		<form action="community_board_add2.do" class="form-group" method="POST" name="frm" id="text_addform">
		<label>제목 </label>	
		<input type="text" name="com_board_title" class="form-control" /> <br>
		
		<label>내용</label>
		<textarea id="summernote" name="com_board_content" ></textarea>
		<br> 
		<input id="myAlert" class="btn" type="button" value="등록" />
		<input type="button" class="btn" id="cancel" value="취소"/>
	</form>
	</div>
	</div>
	


	
	
	
	
	
	
	
	
	
	
	<!--alert 모달폼  -->
	<!-- 글등록 modal창 시작 -->
	<div id="text_modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="mohead" class="modal-header"align="center"><h4>글 등록</h4></div>
				<div id="mobody" class="modal-body" align="center"><h4>글을 등록 하시겠습니까?</h4></div>
				<div id="ft" class="modal-footer">
					<button type="button" class="btn btn-default" id="text_yes">확인</button>
					<button type='button' class='btn btn-primary' id='text_no'>취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 글등록 modal창 끝 -->

	<!-- 기본 modal창 시작 -->
	<div id="basic_modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="basic_mobody" class="modal-body" align="center">
				</div>
				<div id="basic_ft" class="modal-footer">
					<button type='button' class='btn btn-default' id='basic_modal_Yes'>닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 기본 modal창 끝 -->
</body>
</html>