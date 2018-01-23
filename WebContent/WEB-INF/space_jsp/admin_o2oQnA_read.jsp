<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
p {
	text-align: center;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<!-- Bootstrap Core CSS -->
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="./Resouces_admin/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="./Resouces_admin/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="./Resouces_admin/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="./Resouces_admin/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="./Resouces_admin/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<script>
	$(document).ready(function() {
		$("#cancel").on("click", function() {
			document.frm.action = "admin_o2oQnA_list.do";
			document.frm.submit();
		});
	});
</script>
</head>
<body>
	<br />
	<p>
		<label> �ϴ��Ϲ��ǳ���</label>
	</p>
	<hr style="border: solid 0.5px black;">


	<label> ���� ���� : ${vo.o2o_title}</label>
	<br />

	<label> ���� Ÿ�� : ${vo.o2o_type} </label>
	<br />


	<label>���� �ۼ� �ð� : ${vo.the_time} </label>
	<br />


	<label> �̸��� �ּ� : ${vo.o2o_email} </label>
	<br />



	<label> �� ��ȭ ��ȣ : ${vo.o2o_phone} </label>
	<br />

	<label> ���� ���� : ${vo.o2o_content}</label>
	<br />

	<br />

	<form method="post" action="admin_o2oQnA_Email.do" name="frm">
		<input type="hidden" name="o2o_no" value="${vo.o2o_no}"> <input
			type="hidden" name="o2o_title" value="${o2o_title}"> <input
			type="hidden" name="o2o_type" value="${vo.o2o_type}"> <input
			type="hidden" name="the_time" value="${vo.the_time}"> <input
			type="hidden" name="o2o_email" value="${vo.o2o_email}"> <input
			type="hidden" name="o2o_phone" value="${vo.o2o_phone}"> <input
			type="hidden" name="o2o_content" value="${vo.o2o_content}">

		<label> ���Կ��� ���� �亯�ϱ� : </label> <br />

		<textarea name="re_o2o_content" rows="20" class="form-control"></textarea>
		<br /> <br />
		<button type="submit" class="btn">�亯 ������</button>
		<button id="cancel" type="submit" class="btn">����ϱ�</button>
	</form>
</body>
</html>