<%@ page contentType="text/html;charset=utf-8" pageEncoding="euc-kr"%><%@
taglib
	prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);


</style>

<script src="common.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>



$(document).ready(function() {
	$("#btnMod").on("click", function() {
		$("#repleModal").modal("hide");

	});

	$("#btnreMod").on("click", function() {
		$("#reple_form").submit();

	});

	$(".modReple").on("click", function() {
		$("#com_board_reple_no").val($(this).attr("xyz"));
		$("#content").val($("#" + $(this).attr("abcd")).text());
		$("lblcontent").text("글번호 :" + $(this).attr("xyz"));
		$("#repleModal").modal("show");
	});
	
	$("#btnClose").on("click",function(){
		document.frm.action ="admin_community_board_read.do?com_board_no=${vo.com_board_no}";
		document.frm.submit();
	});
	

});


window.onload = function() {
	e("btn").onclick = function() {
		var dc = "?dc=" + new Date().getTime();
		ajaxGet("admin_community_board_recom.do" + dc
				+ "&user_id=aav&com_board_no=${vo.com_board_no}", function(rt) {
			if (rt == -1) {
				alert('이미 이 글을 추천하셨습니다');
			} else {
				e("recomCount").innerHTML = rt;
			}
		});
	};
};
</script>
</head>
<body>
	<div class="jumbotron" style="background-color: green"> 
		<h1>자유게시판 글보기 </h1>
	</div>
	<table class="table ">
	
		<tr>
			<td >NO : ${vo.com_board_no} </td>
			
			<td colspan="2"> 제목 : ${vo.com_board_title}</td>
			
		</tr>
		
		<tr>
			<td >ID : ${vo.user_id} </td>
			<td colspan="2">VIEW : ${vo.view_count} LIKE : <div id="recomCount">${vo.recom_count}</div></td>

		</tr>
		
		<tr>
		
			<td colspan="3">${vo.com_board_content}</td>
		</tr>
		<tr>
		<td colspan="6" align="center"></td>
		</tr>
		
		<tr>
			<th>NO</th>
			<th>CONTENT</th>
			<th>TIME</th>
			<th>USERID</th>

		</tr>

		<jl:forEach var="vo2" items="${rl}">
		<tr>
			<td>${vo2.com_board_reple_no}</td>
			<td> <span id="rb_${vo2.com_board_reple_no}"> ${vo2.com_board_reple_content} </span>
			<a abcd="rb_${vo2.com_board_reple_no}" xyz="${vo2.com_board_reple_no}" class="modReple" href="#">수정</a>
			<a href="admin_community_board_repledel.do?com_board_reple_no=${vo2.com_board_reple_no}&com_board_no=${vo2.com_board_no}">[x] </a>
			 </td>
			<td>${vo2.the_time}</td>
			<td>${vo2.user_id}</td>
		
		</tr>
		</jl:forEach>
	</table>

	<form method="POST" action="admin_community_board_replemod.do" id="reple_form" name="frm">
		<div id="repleModal" class="modal" role="dialog">
			<input type="hidden" id="com_board_no" value="${vo.com_board_no}"
				name="com_board_no" /> <input id="com_board_reple_no" type="hidden" name="com_board_reple_no" />
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<div class="form-group">
							<label id="lblContent" for="content"></label>
							<textarea name ="com_board_reple_content" class="form-control" id="content" rows="7"></textarea>
						</div>

						<button class="btn btn-primary btn-sm" id="btnClose">닫기</button>
						<button class="btn btn-primary btn-sm" id="btnreMod">수정</button>
					</div>
				</div>
			</div>
		</div>

	</form>
	
	
	<form action="admin_community_board_mod.do" method="POST">
		<input type="hidden" name="com_board_no" value="${vo.com_board_no}" /> 
		<input type="hidden" name="com_board_title" value="${vo.com_board_title}" /> 
		<input type="hidden" name="user_id" value="${vo.user_id}" /> 
		<input type="hidden" name="com_board_content" value="${vo.com_board_content}" /> 
		<input type="submit" id="mod"  class="btn btn-primary" value="글 수정하기" />
	</form>
	

	
	<form action="admin_community_board_del.do" method="POST">
		<input type="hidden" name="com_board_no" value="${vo.com_board_no}" /> 
		<input type="submit" id="del"  class="btn btn-primary" value="글 삭제하기" />
	</form>
	
	<input type="button" id="btn"  class="btn btn-primary" value="추천버튼" />
	
	<form action="admin_community_board_addreple.do" method="POST">
	댓글: <input type="text" name="com_board_reple_content" size="30"/> 
	<input type="hidden" name="com_board_no" value="${vo.com_board_no}"/> 
	<input type="hidden" name="user_id" value="${user_id}"/> 
	<input type="submit" class="btn btn-primary" value="댓글달기!" />
	</form>
	



</body>
</html>


