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

</body>
</html>