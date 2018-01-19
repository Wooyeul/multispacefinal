<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
table {
	text-align: center;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<script>
$(document).ready(function(){
	// ���� ������ ���� ���
	$(".remove_space").on("click",function(){
		$("#space_No").val( $(this).attr("space_no") );
		
		$("#text_modal").modal("show");
	});
	
	//yes��ư Ŭ�� ���� �� ������ function
	$("#text_modal_yes").on("click",function(){
		var del_space_no = $("#space_No").val();
			location.href = "admin_space_remove.do?space_no=" + del_space_no;
		$("#text_modal_modal").modal("hide");
	});
	//no��ư Ŭ�� ���� �� ������ function
	$("#text_modal_no").on("click",function(){
		$("#text_modal").modal('hide');
	});
});
</script>
</head>
<body>
	<div class="jumbotron" style="background-color: orange">
		<h1>���� ����</h1> 
	</div> 
	 
	�˻��� ���� �������ּ���.
	<form id="textsearch" action="admin_spaces_search.do" method="post">
		
		<select name="option">
			<option value="crn">����� ��Ϲ�ȣ</option>
			<option value="space_title">���� �̸�</option>
			<option value="space_content">���� ����</option>
			<option value="open_time">���� �ð�</option>
			<option value="close_time">Ŭ���� �ð�</option>
			<option value="price">����</option>
			<option value="max_people">�ִ� �ο�</option>
			<option value="min_people">�ּ� �ο�</option>
			<option value="space_call">���� ��ȭ ��ȣ</option>
			<option value="zipcode">�ּ�</option>
			<option value="s_category_no">���� ī�װ�</option>
			<option value="l_category_no">��� ī�װ�</option>
			<option value="the_time">������</option>
		</select>
		<select name="option2">
			<option value="">������ �������ּ���</option>
			<option value="d_desc">�ֽż����� ����</option>
			<option value="d_asc">�����ȼ����� ����</option>
			<option value="p_desc">��� ������ ����</option>
			<option value="p_asc">���� �� ������ ����</option>
		</select>
		&nbsp;<input type="text" name="content">
		<input type="checkbox" name="re" value="Y">�� �˻� �ҷ��� üũ&nbsp;<br>
		<input type="submit" value="�˻�">
	</form>
	
	<br>
	<br>
	<br>
	<br>
		<table border="1">
		<tr>
			<td>����� ��� ��ȣ</td>
			<td>���� �̸�</td>
			<td>���� ����</td>
			<td>���� ������ �̹���</td>
			<td>���� �ð�</td>
			<td>Ŭ���� �ð�</td>
			<td>����</td>
			<td>�ִ� �ο�</td>
			<td>�ּ� �ο�</td>
			<td>���� ��ȣ</td>
			<td>�ּ�</td>
			<td>���� ī�װ�</td>
			<td>��� ī�װ�</td>
			<td>������</td>
			<td>�����ϱ�</td>
		</tr>
		<jl:forEach var="vo" items="${ls}">
			<tr>
				<td><a href="admin_space_crn_check.do?crn=${vo.crn}">${vo.crn}</a></td>
				<td>${vo.space_title}</td>
				<td>${vo.space_content}</td>
				<td><a href="space_detail.do?space_no=${vo.space_no}"><img src="thumbnail/${vo.space_thumb_img}" style="width:128px;height:128px;"></img></a></td>
				<td>${vo.open_time}</td>
				<td>${vo.close_time}</td>
				<td>${vo.price}</td>
				<td>${vo.max_people}</td>
				<td>${vo.min_people}</td>
				<td>${vo.space_call}</td>
				<td>${vo.zipcode}</td>
				<td>${vo.s_category_no}</td>
				<td>${vo.l_category_no}</td>
				<td>${vo.the_time}</td>
				<td><button class="remove_space" space_no="${vo.space_no}" >�����ϱ�</button></td>
			</tr>
		</jl:forEach>
	</table>
	
<form id="form_search" action="admin_spaces_search.do">
	<input type="hidden" name="pg" value="" id="pg">
	<input type="hidden" name="search_content" value="${search.search_content}">
	<input type="hidden" name="search_option" value="${search.search_option}">
</form>
	<ul class="pagination pagination-sm">
			<jl:if test="${pz.hasPrevPagination }">
				<li><a class="page" href="admin_spaces_search.do?pg=${pz.paginationStart-1}">&lt;</a></li>
			</jl:if>
				<jl:if test="${pz.hasPrevPage }">
					<li><a class="page" href="admin_spaces_search.do?pg=${pz.curPagination-1 }">&lt;</a></li>
				</jl:if>
				<jl:forEach begin="${pz.paginationStart }" end="${pz.paginationEnd }" step="1" varStatus="vs">
					<jl:choose>
						<jl:when test="${vs.index!=pz.curPagination }">
							<li><a class="page" href="admin_spaces_search.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:when>
						<jl:otherwise>
							<li class="active"><a class="page" href="admin_spaces_search.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:otherwise>
					</jl:choose>
				</jl:forEach>
				<jl:if test="${pz.hasNextPage }">
					<li><a class="page" href="admin_spaces_search.do?pg=${pz.curPagination+1}">&gt;</a></li>
				</jl:if>
			<jl:if test="${pz.hasNextPagination }">
				<li><a class="page" href="admin_spaces_search.do?pg=${pz.paginationEnd+1 }">&gt;&gt;</a></li>
			</jl:if>
		</ul>
	
<!-- ���� ������ ���� ��� -->
<div id="text_modal" class="modal fade" role="dialog">
	<input type="hidden" id="space_No" value="0"/>
	<div class="modal-dialog">
		<div class="modal-content">
			<div id="text_mohead" class="modal-header"align="center"><h4>�� ����</h4></div>
			<div id="text_mobody" class="modal-body" align="center">
				<h4>���� ���� �Ͻðڽ��ϱ�?</h4>
			</div>
			<div id="text_ft" class="modal-footer">
				<button type='button' class='btn btn-default' to-delete="delete_${vs.count}"  id='text_modal_yes'>Ȯ��</button>
				<button type='button' class='btn btn-primary' id='text_modal_no'>���</button>
			</div>
		</div>
	</div>
</div>

</body>
</html>