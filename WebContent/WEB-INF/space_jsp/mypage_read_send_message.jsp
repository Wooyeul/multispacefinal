<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />

	<link rel="stylesheet" type="text/css" href="./Resources/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="./Resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="./Resources/css/responsive.css">
		
	<script type="text/javascript" src="./Resources/js/jquery.js"></script>
	<script type="text/javascript" src="./Resources/js/main.js"></script>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="./common.js"></script>
	
	<style type="text/css">
		.textarea_h{
			padding: 10px;
			padding-top: 50px;
		}
		.label_reple{
			padding-bottom: 18px;
		}
	</style>
	
	
</head>
<body>

	<div>
		<label><h3>보낸쪽지함</h3></label><label style="margin: 20px;">::</label>
	</div>
	<hr>
	<div class="col-sm-6" align="left">
		<label><span class="glyphicon glyphicon-user"></span>
			받은 사람 : ${sendMessageRead.receive_user_id}</label>
	</div>
	<div class="textarea_h">
		<textarea rows="15" cols="30" disabled="disabled" class="form-control">${sendMessageRead.msg_content}</textarea>
		<br />
	</div>
	<hr>

</body>
</html>