<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



<link rel='stylesheet prefetch'
	href='http://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css'>

<link rel="stylesheet" href="css/style.css">

<style>

.form-text {
	float: left; 
	padding:10px;
}
.form-input {
	float: left; 
	padding:10px;
}


</style>	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!-- <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script> -->
	<!--  <script type="text/javascript" src="common.js"></script> -->
	
	<script>
/* 	
	window.onload =function () {
		   window.open("popup. html",  "popupNo1", "width=500, height=360");
		}
 */

  $(document).ready(function(){
 		
 		
 		$("#sub-btn").on("click",function(){
 			
 		 var formFindPasswdData = $("#formFindPasswd").serialize();	
	        $.ajax({
		           type : "POST",
		           url : "home_findPassswd.do",
		           data : formFindPasswdData,
		           success   : function(rt) {
	 					alert(rt);
		           },
		           error : function(xhr , option , error){
		        	   alert(error);
		           }
		  	 });
 		});
        
        
	});

 	
 	
 	
 
	</script>
</head>
<body>
	<form id="formFindPasswd">
		<table width="422" align="left">
			<tr>
				<td width="15"></td>
				<td width="12"></td>
				<td width="95" height="35" class="g_13" align="left">이름</td>
				<td width="300" align="left">
					<input name="user_name"	type="text" class="textareabg" size="15" />
				</td>
			</tr>
			
			<tr>
				<td width="15"></td>
				<td width="12"></td>
				<td width="95" height="35" class="g_13" align="left">아이디</td>
				<td width="300" class="g_13" align="left">
					<input name="user_id" class="textareabg" size="15" maxlength="20" />
				</td>
			</tr>
			
			<tr>
				<td width="15"></td>
				<td width="12"></td>
				<td width="95" height="35" class="g_13" align="left">주민번호</td>
				<td width="300" class="g_13" align="left">
					<input name="ssn1" class="textareabg" size="15" maxlength="20" /> - 
					<input name="ssn2" class="textareabg" size="15" maxlength="20" />
				</td>
			</tr>
			

			
			<tr>
				<td width="15"></td>
				<td width="12"></td>
				<td width="95" height="25"></td>
				<td width="15"></td>
			</tr>

			<tr>
				<td width="15"></td>
				<td width="12" height="15"></td>
				<td width="95" height="15"></td>
				<td width="285" height="15"></td>
				<td width="15"></td>
			</tr>
			<tr>
				<td colspan="5" align="center" class="btn_wrap_align_top">
				<button id="sub-btn" class="btn btn-lg btn-success" type="button" >
				비밀번호 찾기
				</button>
				</td>
			</tr>
			<tr>
				<td width="15"></td>
				<td width="12" height="15"></td>
				<td width="95" height="15"></td>
				<td width="285" height="15"></td>
				<td width="15"></td>
			</tr>
		</table>
	</form>
	<!-- 이메일 주소로찾기 폼 끝-->
passwd : ${passwd}


	<div id="messageModal" class="modal " role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">쪽지가 성공적으로 보내졌습니다.</div>
				<div class="modal-footer">
					<button class="btn btn-default" id="move_sendMessageBox">보낸쪽지함 가기</button>
					<button class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div> 

</body>
</html>