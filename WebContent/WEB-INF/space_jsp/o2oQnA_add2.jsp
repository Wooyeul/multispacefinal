<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<title>Welcome to Multi Space</title>
	
	<meta charset="utf-8">
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

.container {
	width: 600px;
		margin:0 auto;
}
.jumbotron {
	text-align: center;
}

.button {
	text-align: center;
}
.t1 {
	text-align: left;
}

</style>

<script>
	$(document).ready(function(){
		$("#cancel").on("click",function(){
			document.frm.method="POST";
			document.frm.action="faq_list.do";
			document.frm.submit();
		});
	});

	$(document).ready(function() {

		var scOffset = $('.navbar-Menu').offset();
		$(window).scroll(function() {
			if ($(document).scrollTop() > scOffset.top) {
				$('.navbar').addClass('navbar-fixed-top');
			} else {
				$('.navbar').removeClass('navbar-fixed-top');
			}
		});

		var url = "chk_login.do";
		ajaxGet(url, function(rt) {

			// 로그인 실패시 : rt값 -> ("/main_html.do")에서 10002 return
			if (rt == "10002") {
				$("#login_nav").hide();
				$("#non_login_nav").show();
			}

			// 로그인 시 : rt값 -> user_name
			else if (rt != "") {
				$("#login_nav").show();
				$("#non_login_nav").hide();
				$("#user_name").text(rt + "님");
			}
		});
	});
</script>
</head>
<body>

	<!-- *********************  header  ************************ -->
         <%@include file="./jsp/header_page.jsp"%>  
	<!-- *********************  header - end  ************************ -->
	
	<div class="jumbotron" style="background-color: #bfd9f2">
		<h1>1:1 문의하기</h1>
	</div>
	
	<div class="container">
		<form action="admin_o2oQnA_add.do" class="form-group" method="POST" name="frm">
			<table>
			<tr>
				<td class="t1"><strong>제목 : </strong></td> 
				<td><input class="form-control" type="text" name="o2o_title" size="30" /></td>
			<tr>
			<tr>
				<td class="t1"><strong>이메일 :</strong></td> 
				<td><input class="form-control" type="text" name="o2o_email" size="30" /></td>
			</tr>
			<tr>
				<td class="t1"><strong>핸드폰번호 :</strong></td> 
				<td><input class="form-control" type="text" name="o2o_phone" size="30" /></td>
			</tr>
			<tr>
				<td class="t1"><strong>서비스분류 :</strong></td> 
				<td><select class="form-control" name="o2o_type">
						<option value="선택">선택하세요</option>
						<option value="회원">회원</option>
						<option value="예약 및 결제">예약 및 결제</option>
						<option value="취소 및 환불">취소 및 환불</option>
						<option value="기타">기타</option>
					</select>
			</td>
			<tr>
			<td class="t1"></td>
			<td>
			<textarea class="form-control" placeholder="문의 내용을 입력하세요."  name="o2o_content" rows="10" cols="60"></textarea>
			</td>
			</tr>
			<tr>
			<td></td>
			<td class="button">
			<a href="faq_list.do"><input type="button"class="btn btn-primary" id="cancel" value="취소하기"/></a>
			<input class="btn btn-default" type="submit" value="문의하기" />
			</tr>
		</table>
		</form>
	</div>

	<!-- ******************************* footer ******************************* -->
		  <%@include file="./jsp/footer.jsp"%>  
	<!--  end footer  -->
</body>
</html>