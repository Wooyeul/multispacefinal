<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
	<script type="text/javascript" src="common.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<style type="text/css">
		@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		var flag_mod=0;
		$("#cancel").on("click",function(){
			history.back(-1);
		});
		
		$("#delete").on("click",function(){
			$("#lblC").text("삭제하시겠습니까?");
			$("#modal-btn-Yes").text("삭제");
			$("#ck_modal").modal("show");
			flag_mod = 1;
		});
		
		$("#member_join").on("click",function(){
			var passwd = $("#passwd").val();
			var passwd2 = $("#passwd2").val();
			var phone = $("#phone").val();
			var email = $("#email").val();
			var nickname= $("#nickname").val();
			var flag = 0;
			if(passwd==""){
				$("#lblContent").text("비밀번호를 입력하세요.");
				flag = 1;
			} else if(passwd2==""){
				$("#lblContent").text("비밀번호를 입력하세요.");
				flag = 1;
			} else if(passwd != passwd2){
				$("#lblContent").text("비밀번호가 다릅니다.");
				flag = 1;
			} else if(nickname==""){
				$("#lblContent").text("닉네임을 입력하세요.");
				flag = 1;
			} else if(phone==""){
				$("#lblContent").text("핸드폰번호를 입력하세요.");
				flag = 1;
			} else if(email==""){
				$("#lblContent").text("이메일을 입력하세요.");
				flag = 1;
			}  else {
				$("#lblC").text("수정하시겠습니까?");
				$("#modal-btn-Yes").text("수정");
				$("#ck_modal").modal("show");
			}
			
			if(flag == 1){
				$("#repleModal").modal("show");
			}
			
		});
		
		$("#modal-btn-Yes").on("click",function(){
			if(flag_mod==0)
				$("#frm").submit();
			else if(flag_mod ==1){
				document.frm.method="POST";
				document.frm.action = "myinfo_delete.do";
				document.frm.submit();
			}
		});
		
		$("#btnClose").on("click",function(){
			$("#ck_modal").modal("hide");
		});
		$("#btnClose1").on("click",function(){
			$("#repleModal").modal("hide");
		});
		
	});

</script>
</head>
<body>
	
	<form action="myinfo_mod_user2.do" method="POST" id="frm" name="frm">
		<table border="0" cellpadding="8" align="center">
			<tr>
				<th colspan="3" align="center"><h1>회원정보수정</h1></th>
			</tr>

			<tr>
				<th align="right">아이디</th>
				<td><label>${rvo.user_id}</label></td>
				<td></td>
			</tr>

			<tr>
				<th align="right">비밀번호</th>
				<td><input type="password" name="passwd" id="passwd" size="20"  maxlength="20"/></td>
				<td></td>
			</tr>

			<tr>
				<th align="right">비밀번호 확인</th>
				<td><input type="password" name="passwd2" id="passwd2"
					size="20" maxlength="20"/></td>
				<td></td>
			</tr>

			<tr>
				<th align="right">이름</th>
				<td><label>${rvo.user_name}</label>
				<td></td>
			</tr>

			<tr>
				<th align="right">닉네임</th>
				<td><input type="text" name="nickname" id="nickname" size="10" value="${nickname}" maxlength="8"/></td>
				<td></td>
			</tr>

			<tr>
				<th align="right">전화번호</th>
				<td><select name="num">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
				</select> - <input type="text" name="phone_cen" size="5" value="${phone_cen}" maxlength="4"/> - <input
					type="text" name="phone_end" size="5"  value="${phone_end}" maxlength="4"/></td>
				<td></td>
				<td></td>
			</tr>

			<tr>
				<th align="right">이메일</th>
				<td><input type="text" name="email" id="email" size="10" value="${email}"/>@ 
				<select name="home">
						<option value="daum.net">daum.net</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="hanmail.net">hanmail.net</option>
				</select> <!-- <input type="text" name="msg" size="7"/> --></td>
				<td></td>
			</tr>

			<tr>
				<th align="right">우편번호</th>
				<td><input type="hidden" name="zipcode" value="qwer" /> <input
					type="text" name="zip1" size="6" readonly="readonly" /> &nbsp; <input
					type="button" name="findzip" value="찾기" class="btn"
					onclick="zipSearch()" /></td>
				<td></td>
			</tr>

			<tr>
				<th align="right">주소</th>
				<td><input type="text" name="addr1" size="40"
					readonly="readonly" /></td>
				<td></td>
			</tr>

			<tr>
				<th align="right">상세주소</th>
				<td><input type="text" size="20" /></td>
				<td></td>
			</tr>

			<tr>
				<td></td>
				<td>
				<input type="button" name="member_join" id="member_join" value="    수정하기    " class='btn btn-primary'/> &nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="reset" value="      재설정      " class='btn btn-primary'/>&nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="button" value="      취소      "  class='btn btn-primary' id="cancel"/>
					<input type="button" value="      탈퇴       "  class='btn btn-primary' id="delete"/></td>
				<td></td>
			</tr>
		</table>
		<input type="hidden" name="user_id" value="${rvo.user_id}"/>
	</form>
	
	<form>
		<div id="ck_modal" class="modal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body" align="center">
						<label id="lblC"></label><br/>
					</div>
					<div id="ft" class="modal-footer">
							<button type='button' class='btn btn-default' id='modal-btn-Yes' ></button>
							<button type='button' class='btn btn-primary' id='btnClose' data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	
	<form id="ck_total">
		<div id="repleModal" class="modal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
							<label id="lblContent"></label><br/>
							<button type="button" class="btn btn-primary btn-sm" id="btnClose1" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	
</body>
</html>