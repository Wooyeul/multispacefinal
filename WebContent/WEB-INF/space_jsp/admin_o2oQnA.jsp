<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
p{
text-align: center;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="./Resouces_admin/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="./Resouces_admin/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="./Resouces_admin/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="./Resouces_admin/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="./Resouces_admin/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script>
	$(document).ready(function(){
		$("#cancel").on("click",function(){
			document.frm.method="POST";
			document.frm.action="admin_o2oQnA.do";
			document.frm.submit();
		});
	});

</script>
</head>
<body>
<br/>
<p><label>�ϴ��� ����</label></p>
	<hr style="border: solid 0.5px black;">
	<form action="admin_o2oQnA_add.do" class="form-group" method="POST" name="frm">
		<label>���� : </label> 
		 <input type="text" name="o2o_title" size="30"  class="form-control"/> <br />
		<label>�̸��� : </label> <input type="text" name="o2o_email" size="30" class="form-control" /> <br />
			<label>�ڵ�����ȣ : </label>  <input type="text" name="o2o_phone" size="30" class="form-control" /><br/>
			<label>���񽺺з� :  </label> 
			<select name="o2o_type" class="form-control">
			<option value="ȸ��">ȸ��</option>
			<option value="���� �� ����">���� �� ����</option>
			<option value="��� �� ȯ��">��� �� ȯ��</option>
			<option value="��Ÿ">��Ÿ</option>
		</select> <br/> 
		
		<label>���� ���� : </label> <br/>
		<textarea name="o2o_content" rows="20" class="form-control"></textarea>
		<br/> <input class="btn" type="submit" value="�����ϱ�" />
		<input type="button"class="btn" id="cancel" value="����ϱ�"/>
	</form>

</body>
</html>