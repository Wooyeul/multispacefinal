<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<script>

</script>
</head>
<body>
<h1>��������Ʈ</h1>
<br>
<a href="admin_user_del_write_list.do">Ż�� ��Ų ���� ����Ʈ ����(�Ǹ��� ����)</a>
<br>
<br>

<table border="1">
	<tr>
		<td>�̸�</td>
		<td>���� ID</td>
		<td>�г���</td>
		<td>����</td>
		<td>�̸���</td>
		<td>�� ����</td>
		<td>Ż�� ��Ű��</td>
	</tr>
	<jl:forEach var="vo" items="${ls}">
		<tr>
			<td>${vo.user_name}</td>
			<td>${vo.user_id}</td>
			<td>${vo.nickname}</td>
			<jl:choose>
						<jl:when test="${vo.gender == 'M'}">
							<td>����</td>
						</jl:when>
						<jl:when test="${vo.gender == 'F'}">
							<td>����</td>
						</jl:when>
			</jl:choose>
			<td>${vo.email}</td>
			<td><a href="admin_user_check.do?user_id=${vo.user_id}">�� ���� Ȯ��</a></td>
			<td><a href="admin_user_del_write.do?user_id=${vo.user_id}&user_name=${vo.user_name}&email=${vo.email}">Ż�� ��Ű��</a></td>
		</tr>
	</jl:forEach>
</table>
<br>
<br>
<form id="textsearch" action="admin_users.do" method="post">
	<select name="search_option">
		<option value="0">�������ּ���</option>
		<option value="1">�̸�</option>
		<option value="2">���� ID</option>
		<option value="3">�г���</option>
		<option value="4">����</option>
		<option value="5">�̸���</option>
		<option value="6">���� ��ȣ</option>
		<option value="7">�� �ּ�</option>
	</select>
	�˻� : <input type="text" name="search_content">
	<input type="submit" value="�˻�">
</form>
	<ul class="pagination pagination-sm">
			<jl:if test="${pz.hasPrevPagination }">
				<li><a class="page" href="admin_users.do?pg=${pz.paginationStart-1}">&lt;</a></li>
			</jl:if>
				<jl:if test="${pz.hasPrevPage }">
					<li><a class="page" href="admin_users.do?pg=${pz.curPagination-1 }">&lt;</a></li>
				</jl:if>
				<jl:forEach begin="${pz.paginationStart }" end="${pz.paginationEnd }" step="1" varStatus="vs">
					<jl:choose>
						<jl:when test="${vs.index!=pz.curPagination }">
							<li><a class="page" href="admin_users.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:when>
						<jl:otherwise>
							<li class="active"><a class="page" href="admin_users.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:otherwise>
					</jl:choose>
				</jl:forEach>
				<jl:if test="${pz.hasNextPage }">
					<li><a class="page" href="admin_users.do?pg=${pz.curPagination+1}">&gt;</a></li>
				</jl:if>
			<jl:if test="${pz.hasNextPagination }">
				<li><a class="page" href="admin_users.do?pg=${pz.paginationEnd+1 }">&gt;&gt;</a></li>
			</jl:if>
		</ul>

</body>
</html>