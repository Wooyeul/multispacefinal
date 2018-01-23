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
.check{
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
	<br>
	<br>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">�Ǹ��� ����Ʈ</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
				<form method="POST" action="admin_user_mod.do">
					<table width="100%"
						class="table table-striped table-bordered table-hover"
						id="dataTables-example">
						<thead>
							<tr>
								<td>�̸�</td>
								<td>���� ID</td>
								<td>�ֹε�Ϲ�ȣ ���ڸ�</td>
								<td>�ֹε�Ϲ�ȣ ���ڸ�</td>
								<td>����</td>
								<td>��ȭ��ȣ</td>
								<td>�г���</td>
								<td>���� ��ȣ</td>
								<td>�� �ּ�</td>
								<td>�̸���</td>
							</tr>
						</thead>	
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
								<td>${vo.zipdetail}</td>
								<td>${vo.email}</td>
							</tr>
					</table>
					
				
				
						<input type="hidden" name="user_id" value="${vo.user_id}" />
						<button  class="btn" type="submit">���� �ϱ�</button>
						<a href="admin_hosts.do"><input class="btn" type="button" value="��� �ϱ�"></a>
					</form>
					
					
		
			
                            <!-- /.table-responsive -->
                       
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>

</body>
</html>
