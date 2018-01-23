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
.check {
	text-align: center;
}
.table_text_align{
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

<body>

	<br>
	
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">���ӻ�����</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<table width="100%"
						class="table table-striped table-bordered table-hover table_text_align"
						id="dataTables-example">
						<thead>
							<tr>
								<td>���� ��ȣ</td>
								<td>���� �̸�</td>
								<td>������ ���� ID</td>
								<td>���� ����</td>
								<td>���� ����</td>
								<td>���� �̹���</td>
								<td>���� �ִ� �ο�</td>
								<td>���� ������</td>
								<td>�о�</td>
								<td>����</td>
							</tr>
						</thead>
						<tr>
							<td>${vo.club_no}</td>
							<td>${vo.club_name}</td>
							<td>${vo.user_id}</td>
							<td>${vo.club_title}</td>
							<td>${vo.club_content}</td>
							<td><img src="club_img/${vo.club_thumb_img}"
								style="width: 128px; height: 128px;" /></td>
							<td>${vo.max_member}</td>
							<td>${vo.create_time}</td>
							<jl:choose>
									<jl:when test="${vo.c_category_no == 1}">
										<td>����</td>
									</jl:when>
									<jl:when test="${vo.c_category_no == 2}">
										<td>ȸ��</td>
									</jl:when>
									<jl:when test="${vo.c_category_no == 3}">
										<td>��Ƽ</td>
									</jl:when>
									<jl:when test="${vo.c_category_no == 4}">
										<td>����</td>
									</jl:when>
									<jl:when test="${vo.c_category_no == 5}">
										<td>������</td>
									</jl:when>
									<jl:when test="${vo.c_category_no == 6}">
										<td>��Ÿ</td>
									</jl:when>
							</jl:choose>
							<jl:choose>
									<jl:when test="${vo.l_category_no == 1}">
										<td>����</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 2}">
										<td>���</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 3}">
										<td>��õ</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 4}">
										<td>����</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 5}">
										<td>����</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 6}">
										<td>����</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 7}">
										<td>�泲</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 8}">
										<td>���</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 9}">
										<td>�λ�</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 10}">
										<td>���</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 11}">
										<td>�泲</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 12}">
										<td>���</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 13}">
										<td>�뱸</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 14}">
										<td>����</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 15}">
										<td>����</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 16}">
										<td>����</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 17}">
										<td>����</td>
									</jl:when>
									<jl:when test="${vo.l_category_no == 18}">
										<td>����</td>
									</jl:when>
							</jl:choose>
						</tr>
					</table>
					<br /> 
					<a href="club_detail.do?club_no=${vo.club_no}">�ش� �������� ����</a> <br /> <br />
					
						<table width="100%"
						class="table table-striped table-bordered table-hover"
						id="dataTables-example">
						<thead>
						<tr>
							<td>���� ȸ�� ��ϵ�</td>
						</tr>
						</thead>
						<jl:forEach var="ls" items="${ls}">
							<tr>
								<td>${ls.user_id}&nbsp;
								<a href="admin_host_user_check.do?user_id=${ls.user_id}">���� ���� Ȯ���ϱ�</a></td>
							</tr>
						</jl:forEach>
					</table>
					<!-- /.table-responsive -->

				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>

	
	<script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    </script>
</body>
</html>