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

th,td,tr {
text-align: center;
}
</style>
<script src="common.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script type="text/javascript">
$(document).ready(function(){
		// �ش� �������� �̵�
		$(".space_no").on("click",function(){
			var temp = $(this).attr("abc");
			document.frm.method="POST";
			document.frm.action="space_detail.do?space_no="+temp;
			document.frm.submit();
		});
		
		// ���� �������� ���
		$(".remove_review").on("click",function(){
			$("#review_No").val( $(this).attr("review_no") );
			$("#space_No").val( $(this).attr("space_no") );
			$("#text_modal").modal("show");
		});
		$("#text_modal_yes").on("click",function(){
			var del_review_no = $("#review_No").val();
			var del_space_no = $("#space_No").val();
				location.href = "admin_community_review_remove.do?review_no=" + 
				del_review_no + "&space_no=" + del_space_no;
			$("#text_modal_modal").modal("hide");
		});
		$("#text_modal_no").on("click",function(){
			$("#text_modal").modal('hide');
		});

	});
</script> 



<body>


<table class="table table-hover">
		<tr>
			<th>��ȣ</th>
			<th>���ȣ</th>
			<th>���̵�</th>
			<th>����</th>
			<th>����</th>
			<th>�ð�</th>
			<th>����</th>
			<th>�̹���</th>
			<th>����</th>
		</tr>

			<jl:forEach items="${ls}" var="rl" varStatus="vs">
		<tr>
				<td>${rl.review_no}</td>
				<td>${rl.space_no}</td>
				<td>${rl.user_id}</td>
				<td><a href="space_detail.do?space_no=${rl.space_no}">${rl.review_title}</a></td>
				<td>${rl.review_content}</td>
				<td>${rl.the_time}</td>
				<td>${rl.review_score}</td>
				<td><img src="img/${rl.review_img}" width="100px" class="space_no" abc="${rl.space_no}"/></td>
				<td><button class="remove_review" review_no="${rl.review_no}" space_no="${rl.space_no}" >�����ϱ�</button></td>
				<%-- <td><a href="admin_community_review_remove.do?review_no=${rl.review_no}&space_no=${rl.space_no}">�����ϱ�</a> 	</td> --%>
			
		</tr>
			</jl:forEach>
	</table>
	<br>
<br>
<form id="form_search" action="admin_community_review_list.do">
	<input type="hidden" name="pg" value="" id="pg">
	<input type="hidden" name="search_content" value="${search.search_content}">
	<input type="hidden" name="search_option" value="${search.search_option}">
</form>
<form id="textsearch" action="admin_community_review_list.do" method="post">
	<select name="search_option">
		<option value="0">�������ּ���</option>
		<option value="1">����</option>
		<option value="2">����</option>
		<option value="3">���� + ����</option>
		<option value="4">�ۼ���</option>
	</select>
	�˻� : <input type="text" name="search_content">
	<input type="submit" value="�˻�">
</form>
	<ul class="pagination pagination-sm">
			<jl:if test="${pz.hasPrevPagination }">
				<li><a class="page" href="admin_community_review_list.do?pg=${pz.paginationStart-1}">&lt;</a></li>
			</jl:if>
				<jl:if test="${pz.hasPrevPage }">
					<li><a class="page" href="admin_community_review_list.do?pg=${pz.curPagination-1 }">&lt;</a></li>
				</jl:if>
				<jl:forEach begin="${pz.paginationStart }" end="${pz.paginationEnd }" step="1" varStatus="vs">
					<jl:choose>
						<jl:when test="${vs.index!=pz.curPagination }">
							<li><a class="page" href="admin_community_review_list.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:when>
						<jl:otherwise>
							<li class="active"><a class="page" href="admin_community_review_list.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:otherwise>
					</jl:choose>
				</jl:forEach>
				<jl:if test="${pz.hasNextPage }">
					<li><a class="page" href="admin_community_review_list.do?pg=${pz.curPagination+1}">&gt;</a></li>
				</jl:if>
			<jl:if test="${pz.hasNextPagination }">
				<li><a class="page" href="admin_community_review_list.do?pg=${pz.paginationEnd+1 }">&gt;&gt;</a></li>
			</jl:if>
		</ul>

<!-- ���� �������� ��� -->
<div id="text_modal" class="modal fade" role="dialog">
	<input type="hidden" id="review_No" value="0"/>
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