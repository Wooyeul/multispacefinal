<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#cancel").on("click",function(){
			history.back(-1);
		});
		
		$("#delete").on("click",function(){
			document.frm.method="POST";
			document.frm.action = "myinfo_delete.do";
			document.frm.submit();
		});
	});

</script>
<title>Insert title here</title>
</head>
<body>
	<form action="myinfo_mod_user2.do" method="POST" name="frm">

		<table border="0" cellpadding="8" align="center">
			<tr>
				<th colspan="3" align="center"><h1>회원정보수정</h1></th>
				<!-- <td></td>
		<td></td> -->
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
				<td><input type="submit" name="member_join" id="member_join"
					value="    수정하기    " /> &nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="reset" value="      재설정      " />&nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="button" value="      취소      " id="cancel"/>
					<input type="button" value="      탈퇴       " id="delete"/></td>
				<td></td>
			</tr>
		</table>
		<input type="hidden" name="user_id" value="${rvo.user_id}"/>
	</form>
</body>
</html>