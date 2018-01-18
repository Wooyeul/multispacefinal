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
<h1>�Ǹ��� ���� �� ����</h1>
<table border="1" width="500">
	<tr>
		<td>�̸�</td>
		<td>���� ID</td>
		<td>�ֹε�Ϲ�ȣ ���ڸ�</td>
		<td>�ֹε�Ϲ�ȣ ���ڸ�</td>
		<td>����</td>
		<td>��ȭ��ȣ</td>
		<td>�г���</td>
		<td>�����ȣ</td>
		<td>���ּ�</td>
		<td>�̸���</td>
	</tr>
	<tr>
		<td>${vo.user_name}</td>
		<td>${vo.user_id}</td>
		<td>${vo.ssn1}</td>
		<td>${vo.ssn2}</td>
		<jl:choose>
			<jl:when test="${vo.gender == 'M'}">
				<td>����</td>
			</jl:when>
			<jl:when test="${vo.gender == 'F'}">
				<td>����</td>
			</jl:when>
		</jl:choose>
		<td>${vo.phone}</td>
		<td>${vo.nickname}</td>
		<td>${vo.zipcode}</td>
		<td>${vo. zipdetail}</td>
		<td>${vo.email}</td>
	</tr>
</table>
<br>
<form method="POST" action="admin_user_mod.do">
	<input type="hidden" name="user_id" value="${vo.user_id}" />
	<button type="submit">�����ϱ�</button>
</form>
<br>
<form method="POST" action="admin_hosts.do">
	<button type="submit">����ϱ�</button>
</form>

</body>
</html>