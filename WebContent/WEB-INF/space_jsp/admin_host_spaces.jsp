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
				<div class="panel-heading">��������Ʈ<br></div><!-- /.panel-heading -->

			<div class="col-lg-6">
					<br>
					<div class="select">
						<form id="textsearch" action="admin_spaces_search.do">
							<div class="select1">
								<select name="search_option" class="form-control">
									<option value="0">����</option>
									<option value="1">����� ��Ϲ�ȣ</option>
									<option value="2">���� �̸�</option>
									<option value="3">���� ����</option>
									<option value="4">���� �ð�</option>
									<option value="5">Ŭ���� �ð�</option>
									<option value="6">����</option>
									<option value="7">�ִ� �ο�</option>
									<option value="8">�ּ� �ο�</option>
									<option value="9">���� ��ȭ ��ȣ</option>
									<option value="10">�ּ�</option>
									<option value="11">���� ī�װ�</option>
									<option value="12">��� ī�װ�</option>
									<option value="13">������</option>
								</select>
							</div>

							<div class="select2">
								<input class="form-control" type="text" name="search_content">
							</div>

							<div class="select3">
								<input class="btn" type="submit" value="�˻�">
							</div>
						</form>

					</div>
				</div>


			<div class="panel-body">
				<br> <br> <br>
				<table width="100%"
					class="table table-striped table-bordered table-hover"
					id="dataTables-example">
					<thead>
						<tr>
							<th>����� ��� ��ȣ</th>
							<th>���� �̸�</th>
							<th>���� ����</th>
							<th>���� ������ �̹���</th>
							<th>���� �ð�</th>
							<th>Ŭ���� �ð�</th>
							<th>����</th>
							<th>�ִ� �ο�</th>
							<th>�ּ� �ο�</th>
							<th>���� ��ȣ</th>
							<th>�ּ�</th>
							<th>���� ī�װ�</th>
							<th>��� ī�װ�</th>
							<th>������</th>
							<th>�����ϱ�</th>
						</tr>
					</thead>
					<jl:forEach var="vo" items="${ls}">
						<tr>
							<td><a href="admin_space_crn_check.do?crn=${vo.crn}">${vo.crn}</a></td>
							<td>${vo.space_title}</td>
							<td>${vo.space_content}</td>
							<td><a href="space_detail.do?space_no=${vo.space_no}"><img
									src="space_img/${vo.space_thumb_img}"
									style="width: 128px; height: 128px;"></img></a></td>
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
							<td><a href="admin_space_remove.do?space_no=${vo.space_no}">����</a></td>
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
<div class="paginationdiv">
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
</div>

</body>
</html>