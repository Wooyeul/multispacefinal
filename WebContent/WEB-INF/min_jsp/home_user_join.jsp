<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="common.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		var flag = 0;
		var user_id;
		$("#primary_id").on("click",function(){
			user_id = $("#user_id").val();
			var url ="overlap.do?user_id="+user_id;
			
			ajaxGet(url,function(rt){
				if(rt==1){
					alert("�ߺ��Ǿ����ϴ�.");
					$("#user_id").val("");
				} else if(user_id==""){
					alert("���̵� �Է��ϼ���");
				} else if( rt == 0){
					alert("��밡���մϴ�.");
					flag = 1;
				} 
			});
		});
		
		$("#member_join").on("click",function(){
			var user_idck = $("#user_id").val();
			var user_id1 = $("#user_id").val();
			var passwd = $("#passwd").val();
			var passwd2 = $("#passwd2").val();
			var user_name = $("#user_name").val();
			var phone = $("#phone").val();
			var email = $("#email").val();
			var ssn1 = $("#ssn1").val();
			var ssn2 = $("#ssn2").val();
			var nickname= $("#nickname").val();
			
			if(user_id1==""){
				alert("���̵� �Է��ϼ���.");
			} else if(passwd==""){
				alert("��й�ȣ �Է��ϼ���");
			} else if(passwd2==""){
				alert("��й�ȣ �Է��ϼ���");
			} else if(passwd != passwd2){
				alert("��й�ȣ �ٸ�");
			} else if(user_name==""){
				alert("�̸��� �Է��ϼ���");
			} else if(nickname==""){
				alert("�г����� �Է��ϼ���");
			} else if(phone==""){
				alert("����ȣ�� �Է��ϼ���");
			} else if(email==""){
				alert("email�� �Է��ϼ���");
			} else if(ssn1==""){
				alert("�ֹι�ȣ�� �Է��ϼ���");
			} else if(ssn2==""){
				alert("�ֹι�ȣ�� �Է��ϼ���");
			} else if(flag==0){
				alert("���̵� �ߺ�üũ ���ּ���");
			} else if(user_id != user_idck){
				alert("���̵� �ߺ�üũ�� �ٽ����ּ���")
			} else {
				$("#member_join").attr('type','submit');
			}
		});
	});
</script>
<form action ="home_user_join2.do" name=frm>
<table border="0" cellpadding = "8" align="center">

	<tr>
		<th colspan="3" align="center"><h1>ȸ������</h1></th>
		<!-- <td></td>
		<td></td> -->
	</tr>
	
	<tr>
		<th align="right">���̵�</th>
		<td>
		
		<input type="text" name="user_id" id="user_id" size="10"/>   
		<input type="button" id="primary_id" value="�ߺ�Ȯ��"/>
		</td>
		<td></td>
	</tr>
	
	<tr>
		<th align="right">��й�ȣ</th>
		<td><input type="password" name="passwd" id="passwd"size="20"/></td>
		<td></td>
	</tr>
	
	<tr>
		<th align="right">��й�ȣ Ȯ��</th>
		<td><input type="password" name="passwd2" id="passwd2" size="20"/></td>
		<td></td>
	</tr>
	
	<tr>
		<th align="right">�̸�</th>
		<td><input type="text" name="user_name" id="user_name" size="10"/></td>
		<td></td>
	</tr>
	
	<tr>
		<th align="right">�г���</th>
		<td><input type="text" name="nickname" id="nickname" size="10"/></td>
		<td></td>
	</tr>
	
	<tr>
		<th align="right">��ȭ��ȣ</th>
		<td>
		     <select name="num">
			<option value="010">010</option>		
			<option value="011">011</option>		
			<option value="017">017</option>		
			<option value="018">018</option>		
			<option value="019">019</option>		
			</select>
			 - 
			 <input type="text" name="phone_cen" size="5"/> - 
			 <input type="text" name="phone_end" size="5"/>
		</td>
		<td></td>
		<td></td>
	</tr>
	
	<tr>
		<th align="right">�̸���</th>
		<td>
			<input type="text" name="email" id="email" size="10"/>@  
			<select name="home">
			<option value="���ϼ���">���ϼ���</option>
			<option value="daum.net">daum.net</option>
			<option value="naver.com">naver.com</option>
			<option value="gmail.com">gmail.com</option>
			<option value="hotmail.com">hotmail.com</option>
			<option value="hanmail.net">hanmail.net</option>
			<option value="�����Է�">�����Է�</option>
			</select>
			<!-- <input type="text" name="msg" size="7"/> -->
		</td>
		<td></td>
	</tr>
	
	<tr>
		<th align="right">�����ȣ</th>
		<td>
		<input type="hidden" name="zipcode" value="qwer"/>
		<input type="text" name="zip1" size="6" readonly="readonly"/> 
		&nbsp;
		
		<input type="button" name="findzip" value="ã��" class="btn"
			onclick="zipSearch()"/>
		</td>
		<td></td>
	</tr>
	
	<tr>
		<th align="right">�ּ�</th>
		<td>
		<input type="text" name="addr1" size="40" readonly="readonly"/>
		</td>
		<td></td>
	</tr>
	
	<tr>
		<th align="right">���ּ�</th>
		<td>
		<input type="text" size="20"/>
		</td>
		<td></td>
	</tr>
	
	<tr>
		<th align="right">�ֹι�ȣ</th>
		<td>
		<input type="text" name="ssn1" id="ssn1" size="6" maxlength="6"/> - 
		<input type="password" name="ssn2" id="ssn2" size="7" maxlength="7"/>
		</td>
		<td></td>
	</tr>
	
	<tr>
		<th align="right">����</th>
		<td>
		<input type="radio" name="gender" value="M" checked="checked"
/> �� 
		<input type="radio" name="gender" value="F"/> �� 
		<input type="hidden" name="grade" value="1"/>
		</td>
		<td></td>
	</tr>
	
	<tr>
		<td></td>
		<td>
		 <input type="button" name="member_join" id="member_join" value="    ȸ������    "/>
		 &nbsp;&nbsp;&nbsp;&nbsp;
		 <input type="reset" value="      �缳��      "/>
		</td>
		<td></td>
	</tr>
</table>
</form>
</body>
</html>