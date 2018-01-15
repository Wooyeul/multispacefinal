<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


	<script type="text/javascript" src="common.js"></script>
	<script>
	$(document).ready(function(){
		
		$(".s_space_no").on("click",function(e){
			//해당 space_no 클릭시 
			$("#i_space_no").attr("value",$(this).attr("s_spaceNo")); 
			space_no = $("#i_space_no").val();
			location.href="mypage_moveSpaceinfo.do?space_no="+space_no;
		})
	});
	</script>
</head>
<body>
	<table border="1" cellspacing="0" cellpadding="8">
		<tr>
			<th width="40">#</th>
			<th width="40">space_no</th>
			<th width="100">user_id</th>
			<th width="100">du_time</th>
			<th width="100">booking_date</th>
			<th width="100">club_no</th>
			<th width="100">booking_message</th>
		</tr>
		<jl:forEach var="bkInfo" items="${bookingInfo}">
			<tr>
				<td>${bkInfo.booking_no}</td>
				<td><span class="s_space_no" s_spaceNo="${bkInfo.space_no}">${bkInfo.space_no}</span>
					<input id="i_space_no" type="hidden" name="space_no" />
				</td>
				<td>${bkInfo.user_id}</td>
				<td>${bkInfo.du_time}</td>
				<td>${bkInfo.booking_date}</td>
				<td>${bkInfo.club_no}</td>
				<td>${bkInfo.booking_message}</td>
			</tr>
		</jl:forEach>
	</table>



</body>
</html>