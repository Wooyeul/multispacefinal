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


</head>
<body>
	<div class="jumbotron" style="background-color: orange">
		<h1>자유게시판 글쓰기 공간</h1>
	</div>
	<form action="community_board_add2.do" class="form-group" method="POST" name="frm" id="text_addform">
		제목 : <input type="text" name="com_board_title" size="30" /> <br>
		말머리 : <select name="com_board_type">
			<option value="선택">선택하세요</option>
			<option value="유머">유머</option>
			<option value="맛집">맛집</option>
			<option value="취미">취미</option>
			<option value="감성">감성글</option>
			<option value="공유">공유</option>
		</select> <br>
		
		내용:
		<textarea name="com_board_content" rows="10" cols="60"></textarea>
		<br> 
		<input id="myAlert" class="btnAdd btn-success" type="button" value="등록" />
		<input type="button"class="btn btn-success" id="cancel" value="취소"/>
	</form>
	
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