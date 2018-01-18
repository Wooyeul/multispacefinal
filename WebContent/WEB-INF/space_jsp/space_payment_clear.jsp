<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css"
	href="./Resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="./Resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="./Resources/css/responsive.css">

<script type="text/javascript" src="./Resources/js/jquery.js"></script>
<script type="text/javascript" src="./Resources/js/main.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<script src="common.js" type="text/javascript"></script>
<script src="common.js" type="text/javascript"></script>
<script src="common.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
		$("document").ready(function(){
			var scOffset = $( '.navbar-Menu' ).offset();
			$( window ).scroll( function() {
			if ( $( document ).scrollTop() > scOffset.top ) {
				$( '.navbar' ).addClass( 'navbar-fixed-top' );
			}else {
				$( '.navbar' ).removeClass( 'navbar-fixed-top' );
			}
			});
			var url = "chk_login.do";
 	 	 	ajaxGet(url,function(rt){	
		 	 	 // 로그인 실패시 : rt값 -> ("/main_html.do")에서 10002 return
		 	 	 if(rt =="10002"){ 
		 	 		$("#login_nav").hide();				$("#non_login_nav").show();
		 	 	}
		 	 	 					
		 	 	 // 로그인 시 : rt값 -> user_name
		 	 	else if(rt!=""){ 
		 	 	$("#login_nav").show();
		 	 	$("#non_login_nav").hide(); 
		 	 	$("#user_name").text(rt+"님");
		 	 		}
	 	 	 });
		});
	</script>
</head>
<body>
	<!-- *********************  header  ************************ -->
	<%@include file="./jsp/header_page.jsp"%>
	<!-- *********************  header - end  ************************ -->
	<table>
		<tr>
			<th colspan="2">예약 내용</th>
		</tr>
		<tr>
			<td>예약 공간</td>
			<td>${booking.space_no }</td>
		</tr>
		<tr>
			<td>예약 일시</td>
			<td>${booking.booking_date }</td>
		</tr>
		<tr>
			<td>시작 시간</td>
			<td>${booking.start_time } 시</td>
		</tr>
		<tr>
			<td>종료 시간</td>
			<td>${booking.end_time } 시</td>
		</tr>
		<tr>
			<td>예약 인원</td>
			<td>${booking.booking_people }</td>
		</tr>
		<tr>
			<td>요청사항</td>
			<td>${booking.booking_message }</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>예약자 정보</th>
		</tr>
		<tr>
			<td>예약자명</td>
			<td>${booking.booking_user_name }</td>
		</tr>
		<tr>
			<td>연락처</td>
			<td>${booking.booking_phone }</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${booking.booking_email }</td>
		</tr>

	</table>
	<!-- ******************************* footer ******************************* -->
	<%@include file="./jsp/footer.jsp"%>
	<!--  end footer  -->
</body>
</html>