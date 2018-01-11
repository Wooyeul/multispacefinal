<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<style type="text/css">
		.jumbotron{
			text-align:center;
		}
		.content{
			height : 100px;
		}
		td, th {
			text-align:center;
		}
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script>

$(document).ready(function() {
	$("#btnClose").on("click", function() {
		$("#repleModal").modal("hide");
		document.frm.action="admin_community_qna_read.do?com_qna_no=${vo.com_qna_no}";
		document.frm.submit();

	});

	$("#btnreMod").on("click", function() {
		$("#reple_form").submit();

	});

	$(".modReple").on("click", function() {
		$("#com_qna_reple_no").val($(this).attr("xyz"));
		$("#content").val($("#" + $(this).attr("abcd")).text());
		$("lblcontent").text("글번호 :" + $(this).attr("xyz"));
		$("#repleModal").modal("show");
	});
});

</script>
	
</head>
<body>
	<div id="i" class="jumbotron panel-primary">
		<h1>QnA</h1>
	</div>
	
	<div class="container">
		<div class="title">
			<label>제목:</label>
			<span>${vo.com_qna_title}</span><br>
		</div>
		
		<div class="user_id">
			<label>아이디:</label>
			<span>${vo.user_id}</span><br>
		</div>
		
		<div class="content">
			<label>내용</label><br/>
			<span>${vo.com_qna_content}</span><br/>
		</div>
		
		<table border="1" cellspacing="0" cellpadding="8">
		<tr>
			<th>유저</th>
			<th width="200">댓글내용</th>
			<th>시간</th>
			<th>추천수</th>
			<th>추천하기</th>
			<th>댓글삭제</th>
		</tr>
		<jl:forEach var="rpl" items="${rp}">
			<tr>
				<td>${rpl.user_id}</td>
				<td>
				<span id="rb_${rpl.com_qna_reple_no}"> ${rpl.com_qna_reple_content} </span>
				<a abcd="rb_${rpl.com_qna_reple_no}" xyz="${rpl.com_qna_reple_no}" class="modReple" href="#">수정</a>
				</td>
				<td>${rpl.the_time}</td>
				<td>
					<div id="recom_count">${rpl.recom_count}</div>
				</td>
				<td>
					[<a href="admin_community_qna_reple_recom.do?user_id=${user_id}&com_qna_reple_no=${rpl.com_qna_reple_no}&com_qna_no=${rpl.com_qna_no}">추천</a>]
				</td>
				<td>[<a href="admin_community_qna_reple_del.do?com_qna_no=${rpl.com_qna_no }&com_qna_reple_no=${rpl.com_qna_reple_no}">삭제</a>]</td>
			</tr>
		</jl:forEach>
	</table>
	
		<form method="POST" action="admin_community_qna_reple_mod.do" id="reple_form" name="frm">
		<div id="repleModal" class="modal" role="dialog">
			<input type="hidden" id="com_qna_no" value="${vo.com_qna_no}"
				name="com_qna_no" /> <input id="com_qna_reple_no" type="hidden" name="com_qna_reple_no" />
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<div class="form-group">
							<label id="lblContent" for="content"></label>
							<textarea name ="com_qna_reple_content" class="form-control" id="content" rows="7"></textarea>
						</div>
						<button class="btn btn-primary btn-sm" id="btnClose">닫기</button>
						<button class="btn btn-primary btn-sm" id="btnreMod">수정</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	
		<form action="admin_community_qna_reple_add.do" method="post">
			<input type="text" name="com_qna_reple_content" />
			<input type="hidden" name="user_id" value="${user_id}"/>
			<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}"/>
			<input type="submit" value="댓글작성"/>
		</form>
		
		<form action="admin_community_qna_list.do" method="post">
			<input type="submit" value="QnA목록"/>
		</form>
		
		<form action="admin_community_qna_mod.do" method="post">
			<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}"/>
			<input type="hidden" name="com_qna_title" value="${vo.com_qna_title}"/>
			<input type="hidden" name="com_qna_content" value="${vo.com_qna_content}"/>
			<input type="submit" value="QnA수정"/>
		</form>
		
		<form action="admin_community_qna_del.do" method="post">
			<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}"/>
			<input type="submit" value="QnA삭제"/>
		</form>
		
		
	</div>
</body>
</html>