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
<h1>�Ǹ��� ���� ���� �� ����</h1>
	<table border="1">
		<tr>
			<td>�Ǹ��� �̸�</td>
			<td>${host_name}</td>
		</tr>
	</table>
	<br/>
	<br/>
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
		</tr>
		<jl:forEach var="vo" items="${ls}">
			<tr>
				<td>${vo.crn}</td>
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
			</tr>
		</jl:forEach>
	</table>
	<br>
<br>
<form id="form_search" action="admin_host_spaces.do">
	<input type="hidden" name="pg" value="" id="pg">
	<input type="hidden" name="search_content" value="${search.search_content}">
	<input type="hidden" name="search_option" value="${search.search_option}">
	<input type="hidden" name="host_name" value="${host_name}">
	<input type="hidden" name="crn" value="${search.crn}">
</form>

<form id="textsearch" action="admin_host_spaces.do">
	<select name="search_option">
		<option value="0">�������ּ���</option>
		<option value="1">����� ��Ϲ�ȣ</option>
		<option value="2">���� �̸�</option>
		<option value="3">���� ����</option>
		<option value="4">���� �ð�</option>
		<option value="5">Ŭ���� �ð�</option>
		<option value="6">����</option>
		<option value="7">�ִ� �ο�</option>
		<option value="8">�ּ� �ο�</option>
		<option value="9">���� ��ȭ ��ȣ</option>
		<option value="10">�����ȣ</option>
		<option value="11">���� ī�װ�</option>
		<option value="12">��� ī�װ�</option>
		<option value="13">������</option>
	</select>
	�˻� : <input type="text" name="search_content">
	<input type="submit" value="�˻�">
</form>
	<ul class="pagination pagination-sm">
			<jl:if test="${pz.hasPrevPagination }">
				<li><a class="page" href="admin_host_spaces.do?pg=${pz.paginationStart-1}&crn=${search.crn}&host_name=${host_name}">&lt;</a></li>
			</jl:if>
				<jl:if test="${pz.hasPrevPage }">
					<li><a class="page" href="admin_host_spaces.do?pg=${pz.curPagination-1 }&crn=${search.crn}&host_name=${host_name}">&lt;</a></li>
				</jl:if>
				<jl:forEach begin="${pz.paginationStart }" end="${pz.paginationEnd }" step="1" varStatus="vs">
					<jl:choose>
						<jl:when test="${vs.index!=pz.curPagination }">
							<li><a class="page" href="admin_host_spaces.do?pg=${vs.index }&crn=${search.crn}&host_name=${host_name}">${vs.index }</a></li>
						</jl:when>
						<jl:otherwise>
							<li class="active"><a class="page" href="admin_host_spaces.do?pg=${vs.index }&crn=${search.crn}&host_name=${host_name}">${vs.index }</a></li>
						</jl:otherwise>
					</jl:choose>
				</jl:forEach>
				<jl:if test="${pz.hasNextPage }">
					<li><a class="page" href="admin_host_spaces.do?pg=${pz.curPagination+1}">&gt;</a></li>
				</jl:if>
			<jl:if test="${pz.hasNextPagination }">
				<li><a class="page" href="admin_host_spaces.do?pg=${pz.paginationEnd+1 }">&gt;&gt;</a></li>
			</jl:if>
		</ul>
</body>
</html>