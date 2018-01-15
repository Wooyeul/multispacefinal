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

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
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
				<th>우편번호</th>
				<td><input type="text" id="sample4_postcode" name="zonecode" value="${zvo.zonecode}" disabled="disabled">
				<input type="button" onclick="sample4_execDaumPostcode()"  value="우편번호 찾기"><br/>
				<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="address" value="${zvo.address}" disabled="disabled">
				<input type="text" id="sample4_jibunAddress" placeholder="지번주소"  name="jibunAddress" value="${zvo.jibunAddress}" disabled="disabled">
					<span id="guide" style="color:#999"></span></td>
			</tr>
			<tr>
				<th align="right">상세주소</th>
				<td><input type="text" size="20" name="detail" value="${zvo.detail}"/></td>
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