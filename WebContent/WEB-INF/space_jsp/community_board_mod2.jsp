<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<title>Welcome to Multi Space</title>
	
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
	
	<link rel="stylesheet" type="text/css" href="./Resources/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="./Resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="./Resources/css/responsive.css">
	
		
	<script type="text/javascript" src="./Resources/js/jquery.js"></script>
	<script type="text/javascript" src="./Resources/js/main.js"></script>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="./common.js"></script>
	<style type="text/css">
	
		.freemod {
			margin-top: 27px;
			margin-bottom: 27px;
			text-align: center;
			font-size: 2em;
			font-family: "lato-regular", Helvetica, Arial, sans-serif;
		}
		.container {
			width: 600px;
		}
		.modbtn {
			text-align:center;
		}
	</style>

<script>

$(document).ready(function(){
	/* 기본 모달창 닫기 버튼 클릭시 이벤트 실행 */
	$("#basic_modal_Yes").on("click",function(){
		$("#basic_modal").modal("hide");
	});
	
	/* 수정 버튼 클릭 시 이벤트 실행 */
	$("#btnMod").on("click",function(){
		$("#text_mod_modal").modal("show");
		$("#text_modal_Yes").on("click",function(){	
			$("#text_mod_modal").modal("hide");	
			$("#basic_mobody").html("<h4>글이 수정되었습니다.</h4>");
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



</head>
<body>
	<div class="freemod"><h2>자유게시판 글 수정</h2></div>
	<div class="container">
		<form action="community_board_mod2.do" method="POST" id="modform">
			<div class="form-group" id="modal_content">
			<label><h3>제목 입력</h3></label>
				<input class="form-control" type="text" name="com_board_title" value="${mvo.com_board_title}"/><br/>
				<input type="hidden"  size="30" name="user_id" value="${mvo.user_id}" />
			<label><h3>내용 입력</h3></label>
			<textarea class="form-control" name="com_board_content" rows="10" cols="100">${mvo.com_board_content}</textarea>
			<input type="hidden" name="com_board_no" value="${mvo.com_board_no}"/>
			</div>
			<div class="modbtn">
				<input type="button" value="수정" class="btn btn-info btn-lg" id="btnMod"/>
			</div>
		</form>
	</div>
	
	
	
	<!-- 글 수정 modal창 시작 -->
	<div id="text_mod_modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="mohead" class="modal-header" align="center"><h4>글 수정</h4></div>
				<div id="mobody" class="modal-body" align="center">
				<h4>글을 수정 하시겠습니까?</h4>
				</div>
				<div id="ft" class="modal-footer">
					<button type='button' class='btn btn-default' id='text_modal_Yes'>수정</button>
					<button type='button' class='btn btn-primary' id='text_modal_No'>취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 글 수정 modal창 끝 -->	
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
	
	<!--글수정모달창 -->
	<div class="modal fade" id="modtext" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">알림</h4>
				</div>
				<div class="modal-body">글을 정말로 정말로 수정하시겠습니깡?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="success">확인</button>
				</div>
			</div>
		</div>
	</div>
	

	<!-- 글수정모달창_수정버튼누르면 -->
	<div class="modal fade" id="modalmod" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">알림</h4>
				</div>
				<div class="modal-body">당신의 훌륭한 글이 수정되었습니다 !</div>
				<div class="modal-footer">
					<button id="modalmodclose"type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				
				</div>
			</div>
		</div>
	</div>


</html>