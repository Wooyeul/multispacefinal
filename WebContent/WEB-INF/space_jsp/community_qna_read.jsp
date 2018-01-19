<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
	
	<!-- Bootstrap Core CSS -->
	<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- MetisMenu CSS -->
	<link href="./Resouces_admin/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
	
	<!-- DataTables CSS -->
	<link href="./Resouces_admin/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">
	
	<!-- DataTables Responsive CSS -->
	<link href="./Resouces_admin/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
	
	<!-- Custom CSS -->
	<link href="./Resouces_admin/dist/css/sb-admin-2.css" rel="stylesheet">
	
	<!-- Custom Fonts -->
	<link href="./Resouces_admin/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

	<style type="text/css">
		.content{
			height : 100px;
		}
		.paginationdiv {
			text-align: right;
		}
		
		.select1 {
			float: left;
			padding : 15px;
		}
		
		.select2 {
			float: left;
		
		}
		
		.select3 {
			float: left;
			padding : 8px;
		}
		.row {
			margin-left:10px;
			margin-right:10px;
		}
		.replecontent {
			width: 1200px;
			margin-left:20px;
			float: left;
		}
		.repsumbtn,{
			float: left;
		}
		.replesumtext {
			float:left;
			width: 800px;
		}
		.btnclass {
			width: 600px;
		}
		.btnclass1,.btnclass2{
			float: right;
		}
		.btnclass3 {
			float: right;
		}
	</style>
	
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
	<%-- <div class="container">
	<table class="table-hover">
		<tr>
			<th><label>제목</label></th>
			<th><label>글쓴이</label></th>
		</tr>
		<tr><label>내용</label></tr>
		
		<tr><td>${vo.com_qna_title}</td>
		<td>${vo.user_id}</td>
		</tr>
		<tr>${vo.com_qna_content}</tr>
		
		
		
	</table>
		
		<table class="table-hover">
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

	</table> --%>
	
		<div class="row">
		<div class="col-lg-12">
<hr style="border: solid 0.5px black;">
			<!-- 테이블 -->

			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>조회</th>
							
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${vo.com_qna_no}</td>
							<td>${vo.com_qna_title}</td>
							<td>${vo.user_id}</td>
							<td>${vo.view_count}</td>
							
						</tr>
						<tr>
							<td class="table_content" colspan="5">
								<div class="pre"
									style="padding: 10px; height: auto; min-height: 100px; overflow: auto;">
									<pre style="white-space: pre-wrap;">${vo.com_qna_content}</pre>
								</div>
							</td>
						</tr>
						
					<%-- <thead>
						<tr>
							<div class="btnclass">
									<div class="btnclass1">
										<form action="community_qna_list.do" method="post">
											<input type="submit" value="QnA목록" class="btn btn-basic btn-sm"/>
										</form>
									</div>
									<div class="btnclass2">
										<form action="community_qna_del.do.do" method="POST" id="Qna_delete">
											<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}" />
											<jl:if test="${vo.user_id eq user_id}">
												<input type="button" class="btn btn-danger btn-sm" value="QnA삭제" data-toggle="modal" data-target="#text_del_modal"/>
											</jl:if>
										</form>
									</div>
									<div class="btnclass3">
										<form action="community_qna_mod.do" method="post">
											<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}"/>
											<input type="hidden" name="com_qna_title" value="${vo.com_qna_title}"/>
											<input type="hidden" name="com_qna_content" value="${vo.com_qna_content}"/>
										<jl:if test="${vo.user_id eq user_id}"> 
											<input type="submit" class="btn btn-info btn-sm" value="글 수정하기" />
										</jl:if>
										</form>
									</div>
							</div>
						</tr>
					</thead> --%>
					</table>
					<table class="table table-hover">
						<jl:forEach var="rpl" items="${rp}" varStatus="vs">
							<tr>
								<td width="200"><h4>${rpl.user_id}</h4></td>
								<td width="1000">
									<span id="rb_${rpl.com_qna_reple_no}"><h4>${rpl.com_qna_reple_content}</h4></span>
								</td>
								<td widht="250"><h4>${rpl.the_time}</h4></td>
								<td>
									<div id="recom_count${rpl.com_qna_reple_no}"><h4>${rpl.recom_count}</h4></div>
								</td>
								<td>
								<!-- <a user_id="${user_id}" com_qna_reple_no="${rpl.com_qna_reple_no}" id="recom" class="btn btn-primary btn-sm" href="community_qna_reple_recom.do?user_id=${user_id }&com_qna_reple_no=${rpl.com_qna_reple_no}&com_qna_no=${rpl.com_qna_no}">추천</a> -->	
								<jl:if test="${user_id ne ''}">
									<a user_id="${user_id}" com_qna_reple_no="${rpl.com_qna_reple_no}" class="btn btn-warning btn-xs recom"">추천</a>
								</jl:if>
								</td>
								<td> 
								<jl:if test="${rpl.user_id eq user_id}"> 
									<a abcd="rb_${rpl.com_qna_reple_no}" xyz="${rpl.com_qna_reple_no}" class="modReple btn btn-info btn-xs" href="#">수정</a>
								</jl:if>
								</td>
								<td>
								<jl:if test="${rpl.user_id eq user_id}"> 
								<input type="button" class="btn btn-danger btn-xs showDelModal" 
									del_com_qna_no="${rpl.com_qna_no}"
									del_com_qna_reple_no="${rpl.com_qna_reple_no}" value="삭제"/>		
								</jl:if>	
								</td>
							</tr>
							
						</jl:forEach>
						
					</tbody>
				</table>
			</div>
			<!-- /.table-responsive -->
			
		</div>
		<!-- /.col-lg-12 -->
	</div>
	
	<div class="replecontent">
	<form action="community_qna_reple_add.do" method="post" id="reple_submit">
		<jl:if test="${user_id ne ''}">
			<div class="replesumtext">
				<input class="form-control" type="text" name="com_qna_reple_content" placeholder="댓글을 입력하세요."/>
				<input type="hidden" name="user_id" value="${user_id}"/>
				<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}"/>
			</div>
			<div class="repsumbtn">
				<input id="reple_submit_btn" type="button" value="댓글작성" class="btn btn-info">
			</div>
		</jl:if>
	</form>
		<div class="btnclass1">
			<form action="community_qna_list.do" method="post">
				<input type="submit" value="QnA목록" class="btn btn-basic"/>
			</form>
		</div>
		<div class="btnclass2">
			<form action="community_qna_del.do.do" method="POST" id="Qna_delete">
				<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}" />
				<jl:if test="${vo.user_id eq user_id}">
					<input type="button" class="btn btn-danger" value="QnA삭제" data-toggle="modal" data-target="#text_del_modal"/>
				</jl:if>
			</form>
			</div>
		<div class="btnclass3">
			<form action="community_qna_mod.do" method="post">
				<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}"/>
				<input type="hidden" name="com_qna_title" value="${vo.com_qna_title}"/>
				<input type="hidden" name="com_qna_content" value="${vo.com_qna_content}"/>
				<jl:if test="${vo.user_id eq user_id}"> 
					<input type="submit" class="btn btn-info" value="글 수정하기" />
				</jl:if>
			</form>
		</div>	
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
					<button type='button' class='btn btn-default' id='text_del_Yes'>삭제</button>
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