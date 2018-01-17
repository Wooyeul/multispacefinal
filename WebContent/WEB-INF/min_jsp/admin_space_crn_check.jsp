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
			<td>${vo.host_name}</td>
		</tr>
	</table>
	
	<br/>
	<br/>
		<table border="1">
		<tr>
			<td>����� ��� ��ȣ</td>
			<td>ȣ��Ʈ ���� ID</td>
			<td>ȣ��Ʈ �̸�</td>
			<td>ȣ��Ʈ ���� ��ȣ</td>
			<td>�ּ�</td>
		</tr>
		<tr>
			<td>${vo.crn}</td>
			<td><a href="admin_host_user_check.do?user_id=${vo.user_id}">${vo.user_id}</a></td>
			<td>${vo.host_name}</td>
			<td>${vo.host_account}</td>
			<td>${vo.zipcode}</td>
		</tr>
	</table>

</body>
</html>