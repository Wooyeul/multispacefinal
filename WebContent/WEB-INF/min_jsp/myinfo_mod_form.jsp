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
				<th colspan="3" align="center"><h1>ȸ����������</h1></th>
				<!-- <td></td>
		<td></td> -->
			</tr>

			<tr>
				<th align="right">���̵�</th>
				<td><label>${rvo.user_id}</label></td>
				<td></td>
			</tr>

			<tr>
				<th align="right">��й�ȣ</th>
				<td><input type="password" name="passwd" id="passwd" size="20"  maxlength="20"/></td>
				<td></td>
			</tr>

			<tr>
				<th align="right">��й�ȣ Ȯ��</th>
				<td><input type="password" name="passwd2" id="passwd2"
					size="20" maxlength="20"/></td>
				<td></td>
			</tr>

			<tr>
				<th align="right">�̸�</th>
				<td><label>${rvo.user_name}</label>
				<td></td>
			</tr>

			<tr>
				<th align="right">�г���</th>
				<td><input type="text" name="nickname" id="nickname" size="10" value="${nickname}" maxlength="8"/></td>
				<td></td>
			</tr>

			<tr>
				<th align="right">��ȭ��ȣ</th>
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
				<th align="right">�̸���</th>
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
				<th align="right">�����ȣ</th>
				<td><input type="hidden" name="zipcode" value="qwer" /> <input
					type="text" name="zip1" size="6" readonly="readonly" /> &nbsp; <input
					type="button" name="findzip" value="ã��" class="btn"
					onclick="zipSearch()" /></td>
				<td></td>
			</tr>

			<tr>
				<th align="right">�ּ�</th>
				<td><input type="text" name="addr1" size="40"
					readonly="readonly" /></td>
				<td></td>
			</tr>

			<tr>
				<th align="right">���ּ�</th>
				<td><input type="text" size="20" /></td>
				<td></td>
			</tr>

			<tr>
				<td></td>
				<td><input type="submit" name="member_join" id="member_join"
					value="    �����ϱ�    " /> &nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="reset" value="      �缳��      " />&nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="button" value="      ���      " id="cancel"/>
					<input type="button" value="      Ż��       " id="delete"/></td>
				<td></td>
			</tr>
		</table>
		<input type="hidden" name="user_id" value="${rvo.user_id}"/>
	</form>
</body>
</html>