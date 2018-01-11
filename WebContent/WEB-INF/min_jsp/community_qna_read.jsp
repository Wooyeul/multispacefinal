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
	<script src="common.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script>

	$(document).ready(function() {
		$("#btnClose").on("click", function() {
			$("#repleModal").modal("hide");
			$("#rsModal").modal("hide");
			$("#rdModal").modal("hide");
			$("#repModModal").modal("hide");
		});
	
		$("#btnMod").on("click", function() {
			$("#reple_form").submit();
	
		});
		
		$("#btnModRep").on("click", function() {
			$("#reple_mod").submit();
	
		});
		
		$("#btnSub").on("click", function() {
			$("#reple_submit").submit();
	
		});
		
		$("#btnDel").on("click", function() {
			$("#reple_delete").submit();
		});
		
		$("#btnDelQna").on("click", function() {
			$("#Qna_delete").submit();
	
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
			<th>댓글수정</th>
			<th>댓글삭제</th>
		</tr>
		<jl:forEach var="rpl" items="${rp}">
			<tr>
				<td>${rpl.user_id}</td>
				<td>
				<span id="rb_${rpl.com_qna_reple_no}"> ${rpl.com_qna_reple_content} </span>
				
				</td>
				<td>${rpl.the_time}</td>
				
				<td>
					<div id="recom_count">${rpl.recom_count}</div>
				</td>
				
				<td>
					[<a href="community_qna_reple_recom.do?user_id=${user_id}&com_qna_reple_no=${rpl.com_qna_reple_no}&com_qna_no=${rpl.com_qna_no}">추천</a>]
				</td>
				
				<td>
				<form method="POST" action="community_qna_reple_mod.do" id="reple_mod" class="modReple" >
				<input type="hidden" id="com_qna_no" value="${vo.com_qna_no}" name="com_qna_no" /> 
				<input id="com_qna_reple_no" type="hidden" name="com_qna_reple_no" />
				<input type="button" class="btn btn-primary btn-sm" id="reple_mod" value="수정" data-toggle="modal" data-target="#repModModal"/>
				</form>
				</td>
				
				<td>
					<form action="community_qna_reple_del.do" method="post" id="reple_delete">
					<input type="hidden" name="com_qna_no" value="${rpl.com_qna_no}"/>
					<input type="hidden" name="com_qna_reple_no" value="${rpl.com_qna_reple_no}"/>
					<input type="button" class="btn btn-primary btn-sm" value="삭제" data-toggle="modal" data-target="#repDelModal"/>
					<div class="modal fade" id="repDelModal" role="dialog">
					    <div class="modal-dialog">
					      <!-- Modal content-->
					      <div class="modal-content" >
					        <div class="modal-header">
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					        </div>
					        <div class="modal-body">
					          <p>댓글을 삭제 하시겠습니까?</p>
					        </div>
					        <div class="modal-footer">
					        <input type="button" class="btn btn-primary btn-sm" data-dismiss="modal" id="btnClose" value="닫기">
					        <input type="button" class="btn btn-primary btn-sm" data-dismiss="modal" id="btnDel" value="삭제">
					        </div>
					      </div>
					    </div>
					</div>
					</form>
				</td>
			</tr>
		</jl:forEach>
	</table>
	
	
	<form method="POST" action="community_qna_reple_mod.do" id="reple_form" >
		<div id="repleModal" class="modal fade" role="dialog">
			<input type="hidden" id="com_qna_no" value="${vo.com_qna_no}" name="com_qna_no" /> 
			<input id="com_qna_reple_no" type="hidden" name="com_qna_reple_no" />
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<div class="form-group">
							<label id="lblContent" for="content"></label>
							<textarea name ="com_qna_reple_content" class="form-control" id="content" rows="7"></textarea>
						</div>
						<input type="button" class="btn btn-primary btn-sm" id="btnClose" value="닫기"/>
						<input type="button" class="btn btn-primary btn-sm" id="btnMod" value="수정"/>
					</div>
				</div>
			</div>
		</div>
	</form>
	
		<form action="community_qna_reple_add.do" method="post" id="reple_submit">
			<input type="text" name="com_qna_reple_content" />
			<input type="hidden" name="user_id" value="${user_id}"/>
			<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}"/>
			<input type="button" value="댓글작성" class="btn btn-info btn-sm" data-toggle="modal" data-target="#rsModal">
		<div class="modal fade" id="rsModal" role="dialog">
		    <div class="modal-dialog">
		      <!-- Modal content-->
		      <div class="modal-content" >
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        <div class="modal-body">
		          <p>댓글을 작성 하시겠습니까?</p>
		        </div>
		        <div class="modal-footer">
		        <input type="button" class="btn btn-primary btn-sm" data-dismiss="modal" id="btnClose" value="닫기">
		        <input type="button" class="btn btn-primary btn-sm" data-dismiss="modal" id="btnSub" value="작성">
		        </div>
		      </div>
		    </div>
		</div>
		</form>
		
	</div>
	
	<div class="container">
		<form action="community_qna_list.do" method="post">
			<input type="submit" value="QnA목록" class="btn btn-info btn-sm"/>
		</form>
		
		<form action="community_qna_mod.do" method="post">
			<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}"/>
			<input type="hidden" name="com_qna_title" value="${vo.com_qna_title}"/>
			<input type="hidden" name="com_qna_content" value="${vo.com_qna_content}"/>
			<input type="submit" value="QnA수정" class="btn btn-info btn-sm"/>
		</form>
		
		<form action="community_qna_del.do" method="post" id="Qna_delete">
			<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}"/>
			<input type="button" value="QnA삭제" class="btn btn-info btn-sm" data-toggle="modal" data-target="#rdModal"/>
		<div class="modal fade" id="rdModal" role="dialog">
		    <div class="modal-dialog">
		      <!-- Modal content-->
		      <div class="modal-content" >
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        <div class="modal-body">
		          <p>QnA를 삭제 하시겠습니까?</p>
		        </div>
		        <div class="modal-footer">
		        <input type="button" class="btn btn-primary btn-sm" data-dismiss="modal" id="btnClose" value="닫기">
		        <input type="button" class="btn btn-primary btn-sm" data-dismiss="modal" id="btnDelQna" value="삭제">
		        </div>
		      </div>
		    </div>
		</div>
		</form>
	</div>
</body>
</html>