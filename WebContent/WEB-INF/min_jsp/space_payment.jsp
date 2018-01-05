<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
</head>
<body>
	<div class="container">
	<h1>결제페이지</h1>

		<table>
			<tr><th colspan="2">호스트&공간 정보</th></tr>
			<tr>
				<td>호스트 이름</td>
				<td>${host.host_name }</td>
			</tr>
			<tr>
				<td>공간 이름</td>
				<td>${space.space_title }</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>${space.space_call }</td>
			</tr>
		</table>
		
		<hr/>
		
		<table>
			<tr><th colspan="2">예약자 정보</th></tr>
			<tr>
				<td>예약자명</td>
				<td>${booking.booking_user_name }</td>
			</tr>
			<tr>
				<td>예약자 연락처</td>
				<td>${booking.booking_phone }</td>
			</tr>
			<tr>
				<td>요청사항</td>
				<td>${booking.booking_message }</td>
			</tr>
		</table>
		
		<hr/>
		
		<table>
			<tr><th colspan="2">환불 안내</th></tr>
			<tr>
				<td>예약 5일전</td>
				<td>환불 불가</td>
			</tr>
			<tr>
				<td>예약 4일전</td>
				<td>환불 불가</td>
			</tr>
			<tr>
				<td>예약 3일전</td>
				<td>환불 불가</td>
			</tr>
			<tr>
				<td>예약 2일전</td>
				<td>환불 불가</td>
			</tr>
			<tr>
				<td>예약 당일</td>
				<td>환불 불가</td>
			</tr>
			
		</table>
		
		<h3>계좌정보 : ${host.host_account }</h3>
		
		<form method="POST" action="space_payment_clear.do">
			<input type="hidden" value="${booking.space_no }" name="space_no">
			<input type="hidden" value="${booking.user_id }" name="user_id">
			<input type="hidden" value="${booking.booking_date }" name="booking_date">
			<input type="hidden" value="${booking.start_time }" name="start_time">
			<input type="hidden" value="${booking.end_time }" name="end_time">
			<input type="hidden" value="${booking.booking_people }" name="booking_people">
			<input type="hidden" value="${booking.booking_price }" name="booking_price">
			<input type="hidden" value="${booking.booking_user_name }" name="booking_user_name">
			<input type="hidden" value="${booking.booking_phone }" name="booking_phone">
			<input type="hidden" value="${booking.booking_email }" name="booking_email">
			<input type="hidden" value="${booking.booking_message }" name="booking_message">
			
			<input type="submit">
		</form>
	</div>
</body>
</html>