<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr><th colspan="2">예약 내용</th></tr>
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
			<td> ${booking.start_time } 시</td>
		</tr>
		<tr>
			<td>종료 시간</td>
			<td> ${booking.end_time } 시</td>
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
		<tr><th>예약자 정보</th></tr>
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
</body>
</html>