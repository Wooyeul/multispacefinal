<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
.paginationdiv{
text-align: center;
}
.select {
	float: left;
	
}
.select1 {
	float: left;
}

.select2 {
	float: left;
	padding-left : 5px;
	padding-right : 5px;
}

.select3 {
	float: left;
}

.select4 {
	float: left;
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
<script>
$(document).ready(function(){
	// ���� ������ ���� ���
	$(".remove_space").on("click",function(){
		$("#space_No").val( $(this).attr("space_no") );
		
		$("#text_modal").modal("show");
	});
	//yes��ư Ŭ�� ���� �� ������ function
	$("#text_modal_yes").on("click",function(){
		var del_space_no = $("#space_No").val();
			location.href = "admin_space_remove.do?space_no=" + del_space_no;
		$("#text_modal_modal").modal("hide");
	});
	//no��ư Ŭ�� ���� �� ������ function
	$("#text_modal_no").on("click",function(){
		$("#text_modal").modal('hide');
	});
});
</script>
</head>
<body>
	<br>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading" style="text-align:center;"><b>���� �˻�</b><br></div><!-- /.panel-heading -->
		
		
		<form id="textsearch" action="admin_spaces_search.do" method="post">
			<div class="col-lg-6">
					<br>
					<div class="select">
							<div class="select1">
								<select name="option" class="form-control">
									<option value="crn">����� ��Ϲ�ȣ</option>
									<option value="space_title">�̸�</option>
									<option value="space_content">����</option>
									<option value="open_time">���� �ð�</option>
									<option value="close_time">Ŭ���� �ð�</option>
									<option value="price">����</option>
									<option value="max_people">�ִ� �ο�</option>
									<option value="min_people">�ּ� �ο�</option>
									<option value="space_call">���� ��ȭ ��ȣ</option>
									<option value="zipcode">�����ȣ</option>
									<option value="s_category_no">�о�</option>
									<option value="l_category_no">����</option>
									<option value="the_time">������</option>
								</select>
							</div>
							<div class="select2">
								<input class="form-control" type="text" name="content">
							</div>
							<div class="select3">
								<input class="btn" type="submit" value="�˻�">
							</div>
					</div>
				</div> 

				<div class="col-lg-6">
					<br>
					<div class="select">
							<div class="select2">
								<select name="option2" class="form-control">
									<option value="">������ �������ּ���</option>
									<option value="d_desc">�ֽż����� ����</option>
									<option value="d_asc">�����ȼ����� ����</option>
									<option value="p_desc">��� ������ ����</option>
									<option value="p_asc">���� �� ������ ����</option>
								</select>
							</div>
							
							&nbsp;&nbsp;<input type="checkbox" name="re" value="Y">�� �˻� �ҷ��� üũ<br>
					</div>
				</div> 
		</form>

			<div class="panel-body table-responsive">
				<br> <br> <br>
				<table
					class="table table-striped table-bordered table-hover table_text_align "
					id="dataTables-example">
					<thead>
						<tr>
							<th class="table_text_align">����� ��� ��ȣ</th>
							<th class="table_text_align">�̸�</th>
							<th class="table_text_align">����</th>
							<th class="table_text_align">����� �̹���</th>
							<th class="table_text_align">���� �ð�</th>
							<th class="table_text_align">Ŭ���� �ð�</th>
							<th class="table_text_align">����</th>
							<th class="table_text_align">�ִ� �ο�</th>
							<th class="table_text_align">�ּ� �ο�</th>
							<th class="table_text_align">��ȭ ��ȣ</th>
							<th class="table_text_align">���� ��ȣ</th>
							<th class="table_text_align">�о�</th>
							<th class="table_text_align">����</th>
							<th class="table_text_align">������</th>
							<th class="table_text_align">�����ϱ�</th>
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
							<jl:choose>
									<jl:when test="${vo.s_category_no == 1}">
										<td>����</td>
									</jl:when>
									<jl:when test="${vo.s_category_no == 2}">
										<td>ȸ��</td>
									</jl:when>
									<jl:when test="${vo.s_category_no == 3}">
										<td>��Ƽ</td>
									</jl:when>
									<jl:when test="${vo.s_category_no == 4}">
										<td>����</td>
									</jl:when>
									<jl:when test="${vo.s_category_no == 5}">
										<td>������</td>
									</jl:when>
									<jl:when test="${vo.s_category_no == 6}">
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
							<td>${vo.the_time}</td>
							<td><button class="remove_space btn" space_no="${vo.space_no}" >����</button></td>
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
<form id="form_search" action="admin_spaces_search.do">
	<input type="hidden" name="pg" value="" id="pg">
	<input type="hidden" name="search_content" value="${search.search_content}">
	<input type="hidden" name="search_option" value="${search.search_option}">
</form>
<div class="paginationdiv">
	<ul class="pagination pagination-sm">
			<jl:if test="${pz.hasPrevPagination }">
				<li><a class="page" href="admin_spaces.do?pg=${pz.paginationStart-1}">&lt;</a></li>
			</jl:if>
				<jl:if test="${pz.hasPrevPage }">
					<li><a class="page" href="admin_spaces.do?pg=${pz.curPagination-1 }">&lt;</a></li>
				</jl:if>
				<jl:forEach begin="${pz.paginationStart }" end="${pz.paginationEnd }" step="1" varStatus="vs">
					<jl:choose>
						<jl:when test="${vs.index!=pz.curPagination }">
							<li><a class="page" href="admin_spaces.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:when>
						<jl:otherwise>
							<li class="active"><a class="page" href="admin_spaces.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:otherwise>
					</jl:choose>
				</jl:forEach>
				<jl:if test="${pz.hasNextPage }">
					<li><a class="page" href="admin_spaces.do?pg=${pz.curPagination+1}">&gt;</a></li>
				</jl:if>
			<jl:if test="${pz.hasNextPagination }">
				<li><a class="page" href="admin_spaces.do?pg=${pz.paginationEnd+1 }">&gt;&gt;</a></li>
			</jl:if>
		</ul>
	</div>
<!-- ���� ������ ���� ��� -->
<div id="text_modal" class="modal fade" role="dialog">
	<input type="hidden" id="space_No" value="0"/>
	<div class="modal-dialog">
		<div class="modal-content">
			<div id="text_mohead" class="modal-header"align="center"><h4>�� ����</h4></div>
			<div id="text_mobody" class="modal-body" align="center">
				<h4>���� ���� �Ͻðڽ��ϱ�?</h4>
			</div>
			<div id="text_ft" class="modal-footer">
				<button type='button' class='btn btn-default' to-delete="delete_${vs.count}"  id='text_modal_yes'>Ȯ��</button>
				<button type='button' class='btn btn-primary' id='text_modal_no'>���</button>
			</div>
		</div>
	</div>
</div>        


</body>
</html>