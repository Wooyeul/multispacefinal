<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
.select {
	float: left;
}

.select1 {
	float: left;
}

.select2 {
	float: left;
}

.select3 {
	float: left;
}
.select4 {
	float: left;
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

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">판매자신청정보</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					
					<table width="100%"
						class="table table-striped table-bordered table-hover"
						id="dataTables-example">
						<thead>
							<tr>
								<td>사업자 번호</td>
								<td>유저 ID</td>
								<td>판매자 이름</td>
								<td>판매자 계좌</td>
								<td>주소</td>
								<td>참고사항(거절 사항)</td>
							</tr>
						</thead>
						<tr>
							<td>${vo.crn}</td>
							<td>${vo.user_id}</td>
							<td>${vo.host_name}</td>
							<td>${vo.host_account}</td>
							<td>${vo.zipcode}</td>
							<td>${vo.etc}</td>
						</tr>
					</table>

					<div class="select">
						<form method="post" action="admin_host_user_accept.do">
							<input type="hidden" name="crn" value="${vo.crn}"></input> <input
								type="hidden" name="user_id" value="${vo.user_id}"></input> <input
								type="hidden" name="host_name" value="${vo.host_name}"></input>
							<input type="hidden" name="host_account"
								value="${vo.host_account}"></input> <input type="hidden"
								name="zipcode" value="${vo.zipcode}"></input>
							<button class="btn" type="submit">판매자 등록 하기</button>
						</form>
					</div>
			
					<div class="select2">
						<form method="post" action="admin_host_user_refuse_write.do">
							<input type="hidden" name="host_apply_no"
								value="${vo.host_apply_no}"></input> <input type="hidden"
								name="etc" value="${vo.etc}"></input>
							<button class="btn" type="submit">참고 사항(거절 사항) 작성 하기</button>
						</form>
					</div>
	
					<div class="select3">
						<form method="post" action="admin_host_user_remove_request.do">
							<input type="hidden" name="host_apply_no"
								value="${vo.host_apply_no}"></input>
							<button class="btn" type="submit">판매자 신청 사항 삭제</button>
						</form>
					</div>
			
				<div class="select4">
						<form method="post" action="admin_host_request.do">
							<button class="btn" type="submit">취소 하기</button>
						</form>
				</div>	
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