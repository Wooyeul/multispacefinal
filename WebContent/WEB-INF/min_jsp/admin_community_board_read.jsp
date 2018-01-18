<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(document).ready(function() {
	// Ŀ�´�Ƽ ��� ���� �Ϸ� ��� �κ�
	$("#btnreMod").on("click", function() {
		$("#repleModal").modal("hide");
		$("#basic_modal").modal("show");
	});
	$("#basic_mobody").html("<h4>��� ������ �Ϸ� �Ǿ����ϴ�.<h4>");
	$("#basic_modal_yes").on("click",function(){
		var reple_no = $("#com_board_reple_no").val();		
		var com_board_reple_content = $("#content").val();
		var url = "admin_community_board_replemod.do?com_board_reple_no="+reple_no
				+"&com_board_reple_content=" + com_board_reple_content;
		ajaxGet(url,function(rt){ });
		location.reload();
	});

	
	// ��� ���� ��� �ٿ��
	$(".modReple").on("click", function() {
		$("#com_board_reple_no").val($(this).attr("xyz"));
		$("#content").val($("#" + $(this).attr("abcd")).text());
		$("lblcontent").text("�۹�ȣ :" + $(this).attr("xyz"));
		$("#repleModal").modal("show");
	});
	// ��� ���� ��� �����
	$("#btnClose").on("click",function(){
		location.href = "admin_community_board_read.do?com_board_no=${vo.com_board_no}";
	});
	
	
	// Ŀ�´�Ƽ �� ���� ��� �κ�
	$("#remove_free").on("click",function(){
		$("#free_No").val( $(this).attr("free_no") );
		
		$("#text_modal").modal("show");
	});
	$("#text_modal_yes").on("click",function(){
		var del_free_no = $("#free_No").val();
			location.href = "admin_community_board_del.do?com_board_no=" + 
			del_free_no;
		$("#text_modal_modal").modal("hide");
	});
	$("#text_modal_no").on("click",function(){
		$("#text_modal").modal('hide');
	});
	
	
	// �����Խ��� ��� ���� �� ���
	// <a> �±׷� ���� �ҷ� �� �� class ���� �� ���� ��.
	$(".remove_free_re").on("click",function(){
		$("#board_reple_No").val( $(this).attr("board_reple_no") );
		$("#board_No").val( $(this).attr("board_no") );
		
		$("#re_modal").modal("show");
	});
	$("#re_modal_yes").on("click",function(){
		var del_board_reple_no = $("#board_reple_No").val();
		var del_board_no = $("#board_No").val();
			location.href = "admin_community_board_repledel.do?com_board_reple_no=" + 
			del_board_reple_no +"&com_board_no=" + del_board_no;
		$("#re_modal_modal").modal("hide");
	});
	$("#re_modal_no").on("click",function(){
		$("#re_modal").modal('hide');
	});
	
});

// ��õ �ٿ�� ���
window.onload = function() {
	e("btn").onclick = function() {
		var dc = "?dc=" + new Date().getTime();
		ajaxGet("admin_community_board_recom.do" + dc
				+ "&user_id=aav&com_board_no=${vo.com_board_no}", function(rt) {
			if (rt == -1) {
				alert('�̹� �� ���� ��õ�ϼ̽��ϴ�');
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
		<h1>�����Խ��� �ۺ��� </h1>
	</div>
	<table class="table ">
	
		<tr>
			<td >NO : ${vo.com_board_no} </td>
			
			<td colspan="2"> ���� : ${vo.com_board_title}</td>
			
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

		<jl:forEach var="vo2" items="${rl}" varStatus="vs2">
		<tr>
			<td>${vo2.com_board_reple_no}</td>
			<td> <span id="rb_${vo2.com_board_reple_no}"> ${vo2.com_board_reple_content} </span>
			<a abcd="rb_${vo2.com_board_reple_no}" xyz="${vo2.com_board_reple_no}" class="modReple" href="#">����</a>
			<%-- <a href="admin_community_board_repledel.do?com_board_reple_no=${vo2.com_board_reple_no}&com_board_no=${vo2.com_board_no}">[x] </a> --%>
			<a class="remove_free_re" board_reple_no="${vo2.com_board_reple_no}" board_no="${vo2.com_board_no}" href="#" >[x] </a>
			 </td>
			<td>${vo2.the_time}</td>
			<td>${vo2.user_id}</td>
		
		</tr>
		</jl:forEach>
	</table>
	<br>
	<input type="button" id="btn" class="btn" value="��õ��ư" />
	
	<form method="POST" action="admin_community_board_replemod.do" id="reple_form" id="frm">
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

						<input type="button" class="btn btn-primary btn-sm" id="btnClose" value="�ݱ�"/>
						<input type="button" class="btn btn-primary btn-sm" id="btnreMod" value="����"/>
					</div>
				</div>
			</div>
		</div>

	</form>
	
	<form action="admin_community_board_addreple.do" method="POST">
	���: <input type="text" name="com_board_reple_content" size="30"/> 
	<input type="hidden" name="com_board_no" value="${vo.com_board_no}"/> 
	<input type="hidden" name="user_id" value="${user_id}"/> 
	<input type="submit" class="btn btn-primary" value="��۴ޱ�!" />
	</form>
	<br>
	<form action="admin_community_board_mod.do" method="POST">
		<input type="hidden" name="com_board_no" value="${vo.com_board_no}" /> 
		<input type="hidden" name="com_board_title" value="${vo.com_board_title}" /> 
		<input type="hidden" name="user_id" value="${vo.user_id}" /> 
		<input type="hidden" name="com_board_content" value="${vo.com_board_content}" /> 
		<input type="submit" id="mod"  class="btn btn-primary" value="�� �����ϱ�" />
		<input type="button" id="remove_free" free_no="${vo.com_board_no}" class="btn btn-primary" value="�� �����ϱ�" />
	</form>

	<br/>
	<br/>

	
<!-- �� ���� ��� -->	
<div id="text_modal" class="modal fade" role="dialog">
	<input type="hidden" id="board_reple_No" value="0"/>
	<input type="hidden" id="board_No" value="0"/>
	<div class="modal-dialog">
		<div class="modal-content">
			<div id="text_mohead" class="modal-header"align="center"><h4>�� ����</h4></div>
			<div id="text_mobody" class="modal-body" align="center">
				<h4>���� ���� �Ͻðڽ��ϱ�?</h4>
			</div>
			<div id="text_ft" class="modal-footer">
				<button type='button' class='btn btn-default' id='text_modal_yes'>Ȯ��</button>
				<button type='button' class='btn btn-primary' id='text_modal_no'>���</button>
			</div>
		</div>
	</div>
</div>

<!-- ��� ���� ��� -->		
<div id="re_modal" class="modal fade" role="dialog">
	<input type="hidden" id="free_No" value="0"/>
	<input type="hidden" id="free_No" value="0"/>
	<div class="modal-dialog">
		<div class="modal-content">
			<div id="re_mohead" class="modal-header"align="center"><h4>��� ����</h4></div>
			<div id="re_mobody" class="modal-body" align="center">
				<h4>����� ���� �Ͻðڽ��ϱ�?</h4>
			</div>
			<div id="re_ft" class="modal-footer">
				<button type='button' class='btn btn-default' to-delete2="delete_${vs2.count}"  id='re_modal_yes'>Ȯ��</button>
				<button type='button' class='btn btn-primary' id='re_modal_no'>���</button>
			</div>
		</div>
	</div>
</div>

<!-- Ȯ�� �Ϸ�� ��� -->
<div id="basic_modal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div id="basic_mobody" class="modal-body" align="center">
			</div>
			<div id="basic_ft" class="modal-footer">
				<button type='button' class='btn btn-default' id='basic_modal_yes'>�ݱ�</button>
			</div>
		</div>
	</div>
</div>

</body>
</html>


