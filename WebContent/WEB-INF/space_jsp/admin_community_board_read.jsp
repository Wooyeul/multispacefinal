<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%><%@taglib
	prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css"
	href="./Resources/css/bootstrap.css">
<style type="text/css">
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

.btnheart{
	float: left;
	
}

p{
text-align: center;

}

</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<!-- Bootstrap Core CSS -->
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="./Resouces_admin/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="./Resouces_admin/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="./Resouces_admin/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="./Resouces_admin/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="./Resouces_admin/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<script>
	$(document)
			.ready(
					function() {
						$("#btnMod").on("click", function() {
							$("#repleModal").modal("hide");

						});

						$("#btnreMod").on("click", function() {
							$("#reple_form").submit();

						});

						$(".modReple").on(
								"click",
								function() {
									$("#com_board_reple_no").val(
											$(this).attr("xyz"));
									$("#content").val(
											$("#" + $(this).attr("abcd"))
													.text());
									$("lblcontent").text(
											"글번호 :" + $(this).attr("xyz"));
									$("#repleModal").modal("show");
								});

						$("#btnClose")
								.on(
										"click",
										function() {
											document.frm.action = "admin_community_board_read.do?com_board_no=${vo.com_board_no}";
											document.frm.submit();
										});

					});

	window.onload = function() {
		e("btn").onclick = function() {
			var dc = "?dc=" + new Date().getTime();
			ajaxGet("admin_community_board_recom.do" + dc
					+ "&user_id=aav&com_board_no=${vo.com_board_no}", function(
					rt) {
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
<body>

	<br>
	<div class="row">
		<div class="col-lg-12">
		 <p> <label> 글보기 </label></p> 
<hr style="border: solid 0.5px black;">
			<!-- 테이블 -->

			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>NO</th>
							<th>SUBJECT</th>
							<th>ID</th>
							<th>VIEW</th>
							<th>LIKE</th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<td>${vo.com_board_no}</td>
							<td>${vo.com_board_title}</td>
							<td>${vo.user_id}</td>
							<td>${vo.view_count}</td>
							<td>
							
							<button type="button" id="btn" class="btn btn-default btn-circle" ><i class="fa fa-heart"></i>
							</button>&emsp; ${vo.recom_count}						
							</td>
						</tr>
						<tr>
							<td class="table_content" colspan="5">
								<div class="pre"
									style="padding: 10px; height: auto; min-height: 100px; overflow: auto;">
									<pre style="white-space: pre-wrap;">${vo.com_board_content}</pre>
								</div>
								
						
								
							</td>
						</tr>
					<thead>
						<tr>
							<td>
								<form action="admin_community_board_mod.do" method="POST">
							<input type="hidden" name="com_board_no" value="${vo.com_board_no}" />
							<input type="hidden" name="com_board_title"	value="${vo.com_board_title}" />
							<input type="hidden" name="user_id" value="${vo.user_id}" /> 
							<input type="hidden" name="com_board_content" value="${vo.com_board_content}" /> 
							<div class="select3">
							<input type="submit" id="mod" class="btn" value="글 수정하기" />
							</div>
							</form>
							
							
							<form action="admin_community_board_del.do" method="POST">
								<input type="hidden" name="com_board_no" value="${vo.com_board_no}" />
								<div  class="select3">
								<input type="submit" id="del" class="btn" value="글 삭제하기" />
								</div>
							</form>	
							</td>
						</tr>
					<thead>
						<jl:forEach var="vo2" items="${rl}">
							<tr>
								<td>ID : ${vo2.user_id}</td>
								<td colspan="3"> <span id="rb_${vo2.com_board_reple_no}">
										${vo2.com_board_reple_content} </span>
										<a abcd="rb_${vo2.com_board_reple_no}"
									xyz="${vo2.com_board_reple_no}" class="modReple" href="#">수정</a>
									<a
									href="admin_community_board_repledel.do?com_board_reple_no=${vo2.com_board_reple_no}&com_board_no=${vo2.com_board_no}">[x]
								</a></td>
								<td>${vo2.the_time}</td>
							</tr>
						</jl:forEach>
					</tbody>
					
				</table>
			</div>



			<!-- /.table-responsive -->




		</div>
		<!-- /.col-lg-12 -->
	</div>
<hr style="border: solid 0.5px black;">
	<form action="admin_community_board_addreple.do" method="POST">
<div class="select1">
		<label> 댓글달기 </label>
</div>
<div class="select2">	
		<input type="text" name="com_board_reple_content" style="width: 600px; height:50px;" class="form-control"/>
		<input type="hidden" name="com_board_no" value="${vo.com_board_no}" /> 
		<input type="hidden" name="user_id" value="${user_id}" /> 
	</div>	
<div class="select3">	
		<input type="submit" class="btn" value="댓글달기" />
</div>
	</form>
<div class="select3">	
	<input type="button" id="btn" class="btn" value="추천버튼" />
</div>	
	
<!-- 모달 -->	
	<form method="POST" action="admin_community_board_replemod.do"
		id="reple_form" name="frm">
		<div id="repleModal" class="modal" role="dialog">
			<input type="hidden" id="com_board_no" value="${vo.com_board_no}"
				name="com_board_no" /> <input id="com_board_reple_no" type="hidden"
				name="com_board_reple_no" />
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<div class="form-group">
							<label id="lblContent" for="content"></label>
							<textarea name="com_board_reple_content" class="form-control"
								id="content" rows="7"></textarea>
						</div>

						<button class="btn btn-primary btn-sm" id="btnClose">닫기</button>
						<button class="btn btn-primary btn-sm" id="btnreMod">수정</button>
					</div>
				</div>
			</div>
		</div>
	</form>


</body>
</html>


