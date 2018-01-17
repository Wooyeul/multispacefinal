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

th,td,tr {
text-align: center;
}
</style>
<script src="common.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".space_no").on("click",function(){
			var temp = $(this).attr("abc");
			
			document.frm.method="POST";
			document.frm.action="space_detail.do?space_no="+temp;
			document.frm.submit();
		});
	});
	function board_list(page){
		$("#cur_page").attr("value",page);
		$("#paging_frm").submit();
	}
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
		</tr>

			<jl:forEach items="${rl}" var="rl">
		<tr>
				<td>${rl.review_no}</td>
				<td>${rl.space_no}</td>
				<td>${rl.user_id}</td>
				<td><a href="space_detail.do?space_no=${rl.space_no}">${rl.review_title}</a></td>
				<td>${rl.review_content}</td>
				<td>${rl.the_time}</td>
				<td>${rl.review_score}</td>
				<td><img src="img/${rl.review_img}" width="100px" class="space_no" abc="${rl.space_no}"/></td>
		</tr>
			</jl:forEach>
	</table>
	
	<!-- ����¡ -->
	<div align="center">
		<ul class="pagination pagination-sm">
			<!-- ���� �������� �̵� : 10������ ��������(��� �̵�) -->
			<jl:if test="${board_pz.hasPrevPagination }">
				<li><a class="page" href="javascript:board_list('${board_pz.paginationStart-1}')">&lt;</a></li>
			</jl:if>
			<!-- ���� �������� �̵� : �������� �������� -->
			<jl:if test="${board_pz.hasPrevPage }">
				<li><a class="page" href="javascript:board_list('${board_pz.curPagination-1 }')">&lt;</a></li>
			</jl:if>
				<!-- ������ ��ȣ ����� -->
				<jl:forEach begin="${board_pz.paginationStart }" end="${board_pz.paginationEnd }" step="1" varStatus="vs">
					<jl:choose>
						<jl:when test="${vs.index!=board_pz.curPagination }">
							<li><a class="page" href="javascript:board_list('${vs.index }')">${vs.index }</a></li>
						</jl:when>
						<jl:otherwise>
							<li class="active"><a class="page" href="javascript:board_list('${vs.index }')">${vs.index }</a></li>
						</jl:otherwise>
					</jl:choose>
				</jl:forEach>
			<!-- ���� �������� �̵� : �������� �̵� -->
			<jl:if test="${board_pz.hasNextPage }">
				<li><a class="page" href="javascript:board_list('${board_pz.curPagination+1}')">&gt;</a></li>
			</jl:if>
			<!-- ���� �������� �̵� : 10������ ���ķ�(��� �̵�) -->
			<jl:if test="${board_pz.hasNextPagination }">
				<li><a class="page" href="javascript:board_list('${board_pz.paginationEnd+1 }')">&gt;&gt;</a></li>
			</jl:if>
		</ul>
	</div>
	<!-- ����¡ -->	

<form id="paging_frm" action="community_review_list.do" method="post">
	<input type="hidden" name="cur_page" id="cur_page" value=""/>
</form>
</body>
</html>