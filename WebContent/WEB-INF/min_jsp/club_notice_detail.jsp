<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<style>
	</style>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#prev").on("click",function(){
				location.href="club_community.do?club_no="+${vo.club_no};
			});
			$("#clubMod").on("click",function(){
				location.href="club_mod_notice_detail.do?c_notice_no="+${vo.c_notice_no};
			});
			//댓글 삭제 버튼 클릭시 호출
			$(".delRe").on("click",function(){
				var reNo = $(this).attr("reNo");
				var noticeNo = $(this).attr("noticeNo");
				$("#mohead").html("<div class='modal-title'align='center'><h4>댓글삭제</h4></div>");
				$("#mobody").html("<h3>댓글을 삭제하시겠습니까?</h3>");
				$("#ft").html("<button type='button' class='btn btn-default' id='modal-btn-Yes'>확인</button>"+
						"<button type='button' class='btn btn-primary' id='modal-btn-No'>취소</button>");
				$("#modal").modal();
				$("#modal-btn-Yes").on("click",function(){
					location.href="club_del_notice_reple.do?c_notice_reple_no="+reNo+"&c_notice_no="+noticeNo;
				});
				$("#modal-btn-No").on("click",function(){
					$("#modal").modal('hide');
				});
			});

			//댓글 수정 버튼 클릭 시 호출
			$(".modRe").on("click",function(){
				$("#mohead").html("<div class='modal-title'align='center'><h4>댓글수정</h4></div>");
				$("#mobody").attr("align","left");
				$("#mobody").html("<textarea name='c_notice_reple_content'class='form-control' rows='7'>"+
						$(this).attr('reText')+"</textarea><input name='c_notice_reple_no' type='hidden'value='"+$(this).attr('reNo')+"'/>"+
						"<input name='c_notice_no' type='hidden'value='"+$(this).attr('noticeNo')+"'/>");
				$("#ft").html("<button type='button' class='btn btn-default' id='modal-btn-Yes'>등록</button>"+
						"<button type='button' class='btn btn-primary' id='modal-btn-No'>취소</button>");
				$("#modal").modal();
				$("#modal-btn-Yes").on("click",function(){
					$("#frm").submit();
				});
				$("#modal-btn-No").on("click",function(){
					$("#modal").modal('hide');
				});
			});
			
		});
	</script>
</head>
<body>
<div class="container">

	<label>${vo.c_notice_title}</label><br/>
	<label>작성시간 : ${vo.the_time}	</label><label>작성자 : ${vo.user_id}</label>
	<label>조회수 : ${vo.view_count}</label><br/>
	<label>소개</label><textarea rows="15" cols="30" disabled="disabled">${vo.c_notice_content}</textarea><br/>
	<input id="clubMod" type="button" value="수정하기"><input id="prev" type="button" value="뒤로가기">
	<br/><hr>
	
	<form method="post" action="club_add_notice_reple.do">
		<div class="form-group" align="left">
			<label id="reple" class="l" style="width: 100px; font-size: 100%">의견쓰기 </label>
			<div class="input-group">
				<input name="c_notice_reple_content" type="text" style="height: 80px;" class="form-control"/>
				<span class="input-group-addon" style="background-color: #00C73C;">
				<input type="submit" class="btn" value="등록" style="color:white; font-weight: bold; background-color: #00C73C;"/></span>
			</div>
			<input type="hidden" name="user_id" value="admin">
			<input type="hidden" name="c_notice_no" value="${vo.c_notice_no}">
		</div>
	</form>
	<br/>
	<div class="form-group" align="left">
	<hr/>
		<jl:forEach var="rvo" items="${reVO}">
			<label id="repleId" class="l" style="font-size: 120%; font-weight: bold;">${rvo.user_id } </label><br/>
			<label id="repleContent" class="l" style="font-size: 100%;">${rvo.c_notice_reple_content } </label><br/>
			<label id="repletime" class="l" style="font-size: 100%; color: gray;">${rvo.the_time } 
			<a class="delRe" reNo="${rvo.c_notice_reple_no}" noticeNo="${rvo.c_notice_no}" userId="${rvo.user_id }" 
			href="#"><span class="glyphicon glyphicon-remove"></span></a>
			<a reNo="${rvo.c_notice_reple_no}"  reText="${rvo.c_notice_reple_content}" noticeNo="${rvo.c_notice_no}" userId="${rvo.user_id}" 
			class="modRe"href="#"><span class="glyphicon glyphicon-pencil"></span></a></label>
			<br/>
			<hr/>
		</jl:forEach>
	</div>	
	
</div>


	<!-- modal창 시작 -->
	<form id="frm" method="post" action="club_mod_notice_reple.do">
		<div id="modal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div id="mohead" class="modal-header"></div>
					<div id="mobody" class="modal-body" align="center"></div>
					<div id="ft" class="modal-footer"></div>
				</div>
			</div>
		</div>
	</form>
	<!-- modal창 끝 -->
	
	
</body>
</html>