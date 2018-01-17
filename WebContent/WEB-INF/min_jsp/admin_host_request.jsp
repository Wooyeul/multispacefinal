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

</script>
</head>
<body>
<h1>�Ǹ��� ��û ����Ʈ</h1>
<table border="1">
	<tr>
		<td>���� ID</td>
		<td>ȣ��Ʈ �̸�</td>
		<td>��û ���� Ȯ���ϱ�</td>
		<td>�������(���� ����)</td>
	</tr>
	
	<jl:forEach var="vo" items="${ls}">
		<tr>
			<td><a href="admin_host_user_check.do?user_id=${vo.user_id}">${vo.user_id}</a></td>
			<td>${vo.host_name}</td>
			<td><a href="admin_host_request_view.do?crn=${vo.crn}">���� Ȯ�� �ϱ�</a></td>
			<td>${vo.etc}</td>
		</tr>
	</jl:forEach>
</table>

<br>
<br>
<form id="form_search" action="admin_host_request.do">
	<input type="hidden" name="pg" value="" id="pg">
	<input type="hidden" name="search_content" value="${search.search_content}">
	<input type="hidden" name="search_option" value="${search.search_option}">
</form>
<form id="textsearch" action="admin_host_request.do" method="post">
	<select name="search_option">
		<option value="0">�������ּ���</option>
		<option value="1">����� ��ȣ</option>
		<option value="2">���� ID</option>
		<option value="3">ȣ��Ʈ �̸�</option>
		<option value="4">ȣ��Ʈ ���� ��ȣ</option>
		<option value="5">ȣ��Ʈ ���� ��ȣ</option>
		<option value="6">�������(���� ����)</option>
	</select>
	�˻� : <input type="text" name="search_content">
	<input type="submit" value="�˻�">
</form>
	<ul class="pagination pagination-sm">
			<jl:if test="${pz.hasPrevPagination }">
				<li><a class="page" href="admin_host_request.do?pg=${pz.paginationStart-1}">&lt;</a></li>
			</jl:if>
				<jl:if test="${pz.hasPrevPage }">
					<li><a class="page" href="admin_host_request.do?pg=${pz.curPagination-1 }">&lt;</a></li>
				</jl:if>
				<jl:forEach begin="${pz.paginationStart }" end="${pz.paginationEnd }" step="1" varStatus="vs">
					<jl:choose>
						<jl:when test="${vs.index!=pz.curPagination }">
							<li><a class="page" href="admin_host_request.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:when>
						<jl:otherwise>
							<li class="active"><a class="page" href="admin_host_request.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:otherwise>
					</jl:choose>
				</jl:forEach>
				<jl:if test="${pz.hasNextPage }">
					<li><a class="page" href="admin_host_request.do?pg=${pz.curPagination+1}">&gt;</a></li>
				</jl:if>
			<jl:if test="${pz.hasNextPagination }">
				<li><a class="page" href="admin_host_request.do?pg=${pz.paginationEnd+1 }">&gt;&gt;</a></li>
			</jl:if>
		</ul>
		
</body>
</html>