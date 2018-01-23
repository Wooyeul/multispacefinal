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
.btn {
	color: $F5F5F5
}

.mc {
	text-align: center;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<!-- Bootstrap Core CSS -->
<link href="./Resouces_admin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

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
<script>
$(document).ready(function(){
	// ���� ���� ���� �Ϸ�� ���
	$("#basic_mobody").html("<h4>������ �Ϸ� �Ǿ����ϴ�.<h4>");
	$(".mod_complete").on("click",function(){
		$("#basic_modal").modal("show");
	});
	$("#basic_modal_yes").on("click",function(){
		$("#frm").submit();
	});

});
</script>

</head>

<body>
	<br>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">��������������</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
		
						<table width="100%"
							class="table table-striped table-bordered table-hover"
							id="dataTables-example">
							<thead>
								<tr>
									<td>�̸�</td>
									<td>���� ID</td>
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
									<td>${vo.phone}</td>
									<td>${vo.nickname}</td>
									<td>${vo.zipcode}</td>
									<td>${vo.zipdetail}</td>
									<td>${vo.email}</td>
								</tr>
						</table>
						<br /> <br />
					
						 <p class="fa fa-pencil"> �����ϱ� </p>
						
						 <br /><br />
					
						 <form role="form" method="POST" action="admin_user_mod2.do" id="frm">
                                        <div class="form-group">
                                        	<input type="hidden" name="user_id" value="${vo.user_id}" /> 
                                        	
                                            <label>�̸�</label>
                                            <input class="form-control" value="${vo.user_name}" name="user_name" >
                                            <label>��ȭ��ȣ</label>
                                            <input class="form-control" value="${vo.phone}" name="phone" >
                                            <label>�г���</label>
                                            <input class="form-control" value="${vo.nickname}" name="nickname" >
                                            <label>���� ��ȣ</label>
                                            <input class="form-control" value="${vo.zipcode}" name="zipcode" >
                                            <label>�� �ּ�</label>
                                            <input class="form-control" value="${vo.zipdetail}" name="zipdetail" >
                                            <label>�̸���</label>
                                            <input class="form-control" value="${vo.email}" name="email" >
                                            <br>
                                            <input type="button" class="btn mod_complete" value="���� �Ϸ� �ϱ�"/>
                                         	<a href="admin_users.do"> <button type="button" class="btn" >���</button></a> 
                                        </div>
                                        </form>
                            <!-- /.table-responsive -->
                       
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
             <!-- jQuery -->
    <script src="./Resouces_admin/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="./Resouces_admin/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="./Resouces_admin/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="./Resouces_admin/dist/js/sb-admin-2.js"></script>

<!-- ���� ���� ���� �Ϸ�� ��� -->
<div id="basic_modal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div id="basic_mobody" class="modal-body" align="center">
			</div>
			<div id="basic_ft" class="modal-footer">
				<button type='button' class='btn btn-default' id='basic_modal_yes'>�ݱ�</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>