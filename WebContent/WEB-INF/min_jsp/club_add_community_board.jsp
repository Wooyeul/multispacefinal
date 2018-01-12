<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<form id="add_frm">
		<label>제목 : </label><input name="c_board_title" type="text"/><br/>
		<label>말머리 : </label>
		<select name="c_board_subject">
			<option></option>	
			<option value="일반">일반</option>	
			<option value="유머">유머</option>	
			<option value="질문/답변">질문/답변</option>	
		</select>
		<label>내용 : </label><textarea name="c_board_content" rows="15" cols="25"></textarea><br/>
		<input name="club_no" type="hidden" value="${club_no}"/>
		<input name="user_id" type="hidden" value="${user_id}"/>
		<input id="textSubmit" type="button" value="등록"/><input id="cancel" type="button" value="취소"/>
	</form>
	
	
	<!-- 글 등록 modal창 시작 -->
	<div id="text_add_modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="text_add_head" class="modal-header" align="center"><h4>글 등록</h4></div>
				<div id="text_add_body" class="modal-body" align="center">
					글을 등록 하시 겠습니까?
				</div>
				<div id="ft" class="modal-footer">
					<button type='button' class='btn btn-default' id='text_add__Yes'>등록</button>
					<button type='button' class='btn btn-primary' id='text_add__No'>취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 글 등록 modal창 끝 -->
	
	<!-- 기본 modal창 시작 -->
	<div id="basic_modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="basic_mobody" class="modal-body" align="center">
				</div>
				<div id="basic_ft" class="modal-footer">
					<button type='button' class='btn btn-default' id='basic_modal_Yes'>확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 기본 modal창 끝 -->
	
	<!-- 자바스크립트 -->
	<script type="text/javascript">
		$(document).ready(function(){
			
			//글 등록 하기 버튼 클릭 시 이벤트 발생
			$("#textSubmit").on("click",function(){
				$("#text_add_modal").modal("show");
				$("#text_add__Yes").on("click",function(){
					var formData = $("#add_frm").serialize();
					$.ajax({
						type : "POST",
						url : "club_add_community_board_submit.do",
						data : formData,
						success	: function(rt) {
							if(rt=="ok"){
								$("#text_add_modal").modal("hide");
								$("#basic_mobody").text("글이 등록 되었습니다.");
								$("#basic_modal").modal("show");
								$("#basic_modal_Yes").on("click",function(){
									$("#basic_modal").modal("hide");
									location.href="club_community.do?club_no="+${club_no};
								});
							}else{
								$("#text_add_modal").modal("hide");
								$("#basic_mobody").text("글 등록 처리가 실패 되었습니다.");
								$("#basic_modal").modal("show");
								$("#basic_modal_Yes").on("click",function(){
									$("#basic_modal").modal("hide");
									location.reload();
								}); 
							}
					    }
					});
				});
				$("#text_add_No").on("click",function(){
					$("#text_add_modal").modal("hide");
				});
			});
			// 취소 하기 버튼 클릭 시 이벤트 발생
			$("#cancel").on("click",function(){
				location.href="club_community.do?club_no="+${club_no};
			});
		});
	</script>
</body>
</html>