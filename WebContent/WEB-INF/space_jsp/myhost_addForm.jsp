<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
	<script type="text/javascript" src="common.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" type="text/css" href="./Resources/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="./Resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="./Resources/css/responsive.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<script type="text/javascript">
	function zipSearch(){
		window.open("find_zipcode.html", "zip", "width=600,height=450");
	}
	</script>
</head>
<body>
	<h3>판매자 등록 form</h3>
	<form action="myhost_addhost.do" method="POST" name="frm">
		<input type="hidden" name="user_id" value="${user_id}" />
		<table border="1">
			<tr>
				<td>대표명</td>
				<td><input type="text" name="host_name" /></td>
			</tr>
			<tr>
				<td>사업자번호</td>
				<td><input type="text" name="crn" /></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><input type="text" name="zipcode" size="8" id="zipcode" />
					<input type="button" name="findzip" value="찾기"
					class="btnzip btn btn-primary" onclick="zipSearch()" /></td>
			</tr>

			<tr>
				<th align="right">주소</th>
				<td><input type="text" size="40" name="addr1" /></td>
			</tr>
			<tr>
				<td>입금계좌</td>
				<td><input type="text" name="host_account" /></td>
			</tr>
		</table>
		<input type="submit" value="등록하기" class="btn btn-primary"/> <input type="reset" value="취소하기" class="btn btn-primary"/>
	</form>

</body>
</html>