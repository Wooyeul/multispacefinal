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
p {
	text-align: center;
}

.select {
	float: left;
	padding-right: 5px;
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
	$(document).ready(function() {
		$("#cancel").on("click", function() {
			document.frm.method = "POST";
			document.frm.action = "admin_message_write.do";
			document.frm.submit();
		});

		var flag = 0;
		var user_id;
		$("#primary_id").on("click", function() {
			user_id = $("#receive_user_id").val();
			var url = "overlap.do?user_id=" + user_id;

			ajaxGet(url, function(rt) {
				if (rt == 1) {
					$("#lblContent").text("ID가 존재합니다. 쪽지보내기가 가능합니다.");
					$("#repleModal").modal("show");
					flag = 1;
				} else if (user_id == "") {
					$("#lblContent").text("아이디를 입력하세요");
					$("#repleModal").modal("show");
				} else if (rt == 0) {
					$("#lblContent").text("ID가 존재하지 않아 쪽지 보내기가 불가능 합니다.");
					$("#repleModal").modal("show");
					$("#user_id").val("");

				}
			});
		});
		$("#m_submit").on("click", function() {
			var user_id_check = $("#receive_user_id").val();
			if (user_id_check == "") {
				$("#lblContent").text("아이디를 입력하고 중복검사 해주세요.");
			} else if (flag == 0) {
				$("#lblContent").text("아이디 체크 해주세요.");
			} else {
				$("#m_submit").attr('type', 'submit');
			}
			$("#repleModal").modal("show");
		});
		$("#btnClose").on("click", function() {
			$("#repleModal").modal("hide");
		});
	});
</script>
</head>
<body>
	<br />

	<p>
		<label> 관리자 일대일 쪽지보내기 </label>
	</p>
	<hr style="border: solid 0.5px black;">
	<br />
	<form action="admin_writing_message.do" class="form-group"
		method="POST" name="frm">
		<input type="hidden" name="send_user_id" value="admin" /> <label>받는사람</label>
		<br />
		<div class="select">
			<input type="text" class="form-control" id="receive_user_id"
				name="receive_user_id" style="width: 300px;" />
		</div>

		<input type="button" class="btn" id="primary_id" value="ID 존재 여부 확인" />


		<br /> <label>쪽지내용</label>
		<textarea id="msg_content" name="msg_content" rows="15"
			class="form-control"> </textarea>
		<br> <input id="m_submit" class="btn" type="button"
			value="메시지 보내기" /> <input type="button" class="btn" id="cancel"
			value="취소하기" />
	</form>

	<form id="ck_total">
		<div id="repleModal" class="modal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<label id="lblContent"></label><br />
						<button type="button" class="btn btn-primary btn-sm" id="btnClose"
							data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</form>

</body>
</html>