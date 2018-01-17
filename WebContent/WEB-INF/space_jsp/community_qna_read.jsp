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
		
		/* 기본 모달 창 닫기 버튼 눌렀을 때 이벤트 발생 */
		$("#basic_modal_Yes").on("click",function(){
			$("#basic_modal").modal("hide");
		});
		
		/* 댓글 작성 버튼 클릭 시 이벤트 발생 */
		$("#reple_submit_btn").on("click", function() {
			$("#add_reple_modal").modal("show");
			$("#add_reple_modal_Yes").on("click",function(){
				$("#add_reple_modal").modal("hide");
				$("#basic_mobody").html("<h4>댓글이 등록 되었습니다.</h4>");
				$("#basic_modal").modal("show");
				$("#basic_modal").on("hidden.bs.modal",function(){
					$("#reple_submit").submit();
				});
			});
			$("#add_reple_modal_No").on("click",function(){
				$("#add_reple_modal").modal("hide");
			});
		});
		
		
		
		$("#btnClose").on("click", function() {
			$("#repleModal").modal("hide");
			$("#rsModal").modal("hide");
			$("#rdModal").modal("hide");
			$("#repleModal").modal("hide");
		});
		
		$("#btnModRep").on("click", function() {
			$("#reple_mod").submit();
		});
		
		$("#btnSub").on("click", function() {
			$("#replewritecompleteModal").modal("show");
		});
		
		$("#replewritecompleteModal").on("hidden.bs.modal",function(){
			$("#reple_submit").submit();
		});
		
		/* 댓글 삭제 이벤트 */
		$(".showDelModal").on("click",function()
		{
			$("#del_com_qna_no").val( $(this).attr("del_com_qna_no") );
			$("#del_com_qna_reple_no").val( $(this).attr("del_com_qna_reple_no") );
			$('#del_modal').modal('show');
			$("#del_modal_Yes").on("click",function(){
				var del_com_qna_no = $("#del_com_qna_no").val();
				var del_com_qna_reple_no = $("#del_com_qna_reple_no").val();
				$("#del_modal").modal("hide");
				$("#basic_mobody").html("<h4>댓글이 삭제 되었습니다.</h4>");
				$("#basic_modal").modal("show");
				$("#basic_modal").on("hidden.bs.modal",function(){
					location.href = "community_qna_reple_del.do?com_qna_no=" + 
					del_com_qna_no + "&com_qna_reple_no=" + del_com_qna_reple_no;
				});
			});
			$("#del_modal_No").on("click",function(){
				$("#del_modal").modal("hide");
			});
		});
		/* 댓글 삭제 이벤트 */
		
		$(".btnDel").on("click", function() {
			$("#repledeletecompleteModal").modal("show");
		});
		
		$("#btnDelQna").on("click", function() {
			$("#qnadeletecompleteModal").modal("show");
			
		});
		
		/* 글 삭제 이벤트 */
		$("#text_del_Yes").on("click",function(){
			$("#text_del_modal").modal("hide");
			$("#basic_mobody").html("<h4>글이 삭제되었습니다.</h4>");
			$("#basic_modal").modal("show");
			$("#basic_modal").on("hidden.bs.modal",function(){
				/* location.href="community_qna_list.do" */
				$("#Qna_delete").submit();
			});
		});
		$("#text_del_No").on("click",function(){
			$("#text_del_modal").modal("hide");
		});
		/* 글 삭제 이벤트 */
		
		
		/* 댓글 수정 이벤트 */
		$(".modReple").on("click", function() {
			$("#com_qna_reple_no").val($(this).attr("xyz"));
			$("#content").val($("#" + $(this).attr("abcd")).text());	
			$("#repleModal").modal("show");
			$("#btnMod").on("click",function(){
				$("#repleModal").modal("hide");
				$("#basic_mobody").html("<h4>댓글이 수정 되었습니다.</h4>");
				$("#basic_modal").modal("show");
				$("#basic_modal").on("hidden.bs.modal",function(){
					$("#reple_form").submit();
				});
			});
			$("#btn_mod_Close").on("click",function(){
				$("#repleModal").modal("hide");
			});
		});
		/* 댓글 수정 이벤트 */
		
		$(".recom").on("click", function() {
			var user_id=$(this).attr("user_id");
			var com_qna_reple_no=$(this).attr("com_qna_reple_no");
			var dc = "?dc=" + new Date().getTime();
			var url ="community_qna_reple_recom.do" + dc +"&com_qna_reple_no="+com_qna_reple_no+"&user_id="+user_id;
			ajaxGet(url, function(rt) {
				$("#recom_count"+com_qna_reple_no).html(rt);
			});
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
			<th>#</th>		
			<th>ID</th>
			<th width="400">CONTENT</th>
			<th>TIME</th>
			<th>RECOM</th>
			<th>추천</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<jl:forEach var="rpl" items="${rp}" varStatus="vs">
			<tr>
				<td>${rpl.com_qna_reple_no}</td>
				<td>${rpl.user_id}</td>
				<td>
					<span id="rb_${rpl.com_qna_reple_no}"> ${rpl.com_qna_reple_content} </span>
				</td>
				<td>${rpl.the_time}</td>
				<td>
					<div id="recom_count${rpl.com_qna_reple_no}">${rpl.recom_count}</div>
				</td>
				<td>
					<!-- <a user_id="${user_id}" com_qna_reple_no="${rpl.com_qna_reple_no}" id="recom" class="btn btn-primary btn-sm" href="community_qna_reple_recom.do?user_id=${user_id }&com_qna_reple_no=${rpl.com_qna_reple_no}&com_qna_no=${rpl.com_qna_no}">추천</a> -->	
					<jl:if test="${user_id ne ''}">
					<a user_id="${user_id}" com_qna_reple_no="${rpl.com_qna_reple_no}" class="btn btn-primary btn-sm recom"">추천</a>
					</jl:if>
				</td>
				<td> 
					<jl:if test="${rpl.user_id eq user_id}"> 
					<a abcd="rb_${rpl.com_qna_reple_no}" xyz="${rpl.com_qna_reple_no}" class="modReple btn btn-primary btn-sm" href="#">수정</a>
					</jl:if>
				</td>
				<td>
				<jl:if test="${rpl.user_id eq user_id}"> 
					<input type="button" class="btn btn-primary btn-sm showDelModal" 
						del_com_qna_no="${rpl.com_qna_no}"
						del_com_qna_reple_no="${rpl.com_qna_reple_no}"
						value="삭제"/>		
				</jl:if>	
				</td>
			</tr>
		</jl:forEach>

	</table>
	
		<form action="community_qna_reple_add.do" method="post" id="reple_submit">
			<jl:if test="${user_id ne ''}">
				<input type="text" name="com_qna_reple_content" />
				<input type="hidden" name="user_id" value="${user_id}"/>
				<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}"/>
				<input id="reple_submit_btn" type="button" value="댓글작성" class="btn btn-info btn-sm">
			</jl:if>
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
			<jl:if test="${vo.user_id eq user_id}"> 
			<input type="submit" value="QnA수정" class="btn btn-info btn-sm"/>
			</jl:if>
		</form>

		<form action="community_qna_del.do" method="post" id="Qna_delete">
			<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}" />
			<jl:if test="${vo.user_id eq user_id}">
				<input type="button" value="QnA삭제" class="btn btn-info btn-sm" data-toggle="modal" data-target="#text_del_modal" />
			</jl:if>
		</form>
		
	</div>
	
	<div class="modal fade" id="repledeletecompleteModal" role="dialog">
		    <div class="modal-dialog">
		      <!-- Modal content-->
		      <div class="modal-content" >
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        <div class="modal-body">
		          <p>댓글 삭제 완료!</p>
		        </div>
		         <div class="modal-footer">
		        <input type="button" class="btn btn-primary btn-sm" data-dismiss="modal" value="확인">
		        </div>
		      </div>
	    </div>
	</div>
	
		<div class="modal fade" id="qnadeletecompleteModal" role="dialog">
		    <div class="modal-dialog">
		      <!-- Modal content-->
		      <div class="modal-content" >
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        <div class="modal-body">
		          <p>QnA 삭제 완료!</p>
		        </div>
		         <div class="modal-footer">
		        <input type="button" class="btn btn-primary btn-sm" data-dismiss="modal" value="확인">
		        </div>
		      </div>
	    </div>
	</div>
	
	<div class="modal fade" id="replemodcompleteModal" role="dialog">
		    <div class="modal-dialog">
		      <!-- Modal content-->
		      <div class="modal-content" >
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        <div class="modal-body">
		          <p>댓글 수정 완료!</p>
		        </div>
		         <div class="modal-footer">
		        <input type="button" class="btn btn-primary btn-sm" data-dismiss="modal" value="확인">
		        </div>
		      </div>
	    </div>
	</div>
	
	<div class="modal fade" id="replewritecompleteModal" role="dialog">
		    <div class="modal-dialog">
		      <!-- Modal content-->
		      <div class="modal-content" >
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        <div class="modal-body">
		          <p>댓글 작성 완료!</p>
		        </div>
		         <div class="modal-footer">
		        <input type="button" class="btn btn-primary btn-sm" data-dismiss="modal" value="확인">
		        </div>
		      </div>
	    </div>
	</div>
	
	
	
	<!-- 모달 부분 -->

	<!-- 댓글 수정 modal창 시작 -->
	<form method="POST" action="community_qna_reple_mod.do" id="reple_form">
		<div id="repleModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div id="mohead" class="modal-header" align="center"><h4>댓글수정</h4></div>
					<div id="mobody" class="modal-body" align="center">
						<textarea id="content" name='com_qna_reple_content'class='form-control' rows='7'></textarea>
					</div>
					<div id="ft" class="modal-footer">
						<button type='button' class='btn btn-default' id='btnMod'>수정</button>
						<button type='button' class='btn btn-primary' id='btn_mod_Close'>취소</button>
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" id="com_qna_no" value="${vo.com_qna_no}" name="com_qna_no" /> 
		<input id="com_qna_reple_no" type="hidden" name="com_qna_reple_no" />
	</form>
	<!-- 댓글 수정 modal창 시작 -->
	
	<!-- 댓글 삭제 modal창 시작 -->
	<div id="del_modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="mohead" class="modal-header" align="center"><h4>댓글 삭제</h4></div>
				<div id="mobody" class="modal-body" align="center">
					<h4>댓글을 삭제하시겠습니까?</h4>
				</div>
				<div id="ft" class="modal-footer">
					<button type='button' class='btn btn-default' id='del_modal_Yes'>삭제</button>
					<button type='button' class='btn btn-primary' id='del_modal_No'>취소</button>
				</div>
			</div>
		</div>
	</div>
   	<input type="hidden" id="del_com_qna_no" value="0"/>
	<input type="hidden" id="del_com_qna_reple_no" value="0"/>
	<!-- 댓글 삭제 modal창 끝 -->
	<!-- 글 삭제 modal창 시작 -->
	<div id="text_del_modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="text_del_head" class="modal-header" align="center"><h4>글 삭제</h4></div>
				<div id="text_del_body" class="modal-body" align="center">
				<h4>글을 삭제 하시겠습니까?</h4>
				</div>
				<div id="ft" class="modal-footer">
					<button type='button' class='btn btn-default' id='text_del_Yes'>수정</button>
					<button type='button' class='btn btn-primary' id='text_del_No'>취소</button>
				</div>
			</div>
		</div>
	</div>		
	<!-- 글 삭제 modal창 시작 -->	
	<!-- 댓글 등록 modal창 시작 -->
	<div id="add_reple_modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="add_reple_mohead" class="modal-header" align="center"><h4>댓글 등록</h4></div>
				<div id="add_reple_mobody" class="modal-body" align="center">
					<h4>댓글을 등록 하시겠습니까?</h4>
				</div>
				<div id="ft" class="modal-footer">
					<button type='button' class='btn btn-default' id='add_reple_modal_Yes'>등록</button>
					<button type='button' class='btn btn-primary' id='add_reple_modal_No'>취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 댓글 등록 modal창 끝 -->
	
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