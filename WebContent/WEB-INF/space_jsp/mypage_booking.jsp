<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="http://70.12.113.229:8088/msspace_01/mypage_css/Myclub.css">

	<script type="text/javascript" src="common.js"></script>
	<script>
	$(document).ready(function(){
		
		$(".s_space_no").on("click",function(e){
			//해당 space_no 클릭시 
			$("#i_space_no").attr("value",$(this).attr("s_spaceNo")); 
			space_no = $("#i_space_no").val();
			window.parent.location.href="space_detail.do?space_no="+space_no;
		})
	});
	</script>
</head>
<body>
	<table>
		<tr>
			<th width="20%">글번 호</th>
			<th width="30%">예약시간</th>
			<th width="30%">예약한 날짜</th>
			<th width="20%">비고</th>
		</tr>
		<jl:forEach var="bkInfo" items="${bookingInfo}">
			<tr>
				<td>
				<a href="space_detail.do?space_no=${bkInfo.space_no}" target="_parent">${bkInfo.space_no}</a>
				<%-- <span class="s_space_no" s_spaceNo="${bkInfo.space_no}">${bkInfo.space_no}</span>
					<input id="i_space_no" type="hidden" name="space_no" /> --%>
				</td>
				<td>${bkInfo.du_time}</td>
				<td>${bkInfo.booking_date}</td>
				<td>${bkInfo.booking_message}</td>
			</tr>
		</jl:forEach>
	</table>
	
	<ul class="pagination pagination-sm">
			<jl:if test="${pz.hasPrevPagination }">
				<li><a class="page" href="mypage_moveMypageBookingPage.do?pg=${pz.paginationStart-1}">&lt;</a></li>
			</jl:if>
				<jl:if test="${pz.hasPrevPage }">
					<li><a class="page" href="mypage_moveMypageBookingPage.do?pg=${pz.curPagination-1 }">&lt;</a></li>
				</jl:if>
				<jl:forEach begin="${pz.paginationStart }" end="${pz.paginationEnd }" step="1" varStatus="vs">
					<jl:choose>
						<jl:when test="${vs.index!=pz.curPagination }">
							<li><a class="page" href="mypage_moveMypageBookingPage.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:when>
						<jl:otherwise>
							<li class="active"><a class="page" href="mypage_moveMypageBookingPage.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:otherwise>
					</jl:choose>
				</jl:forEach>
				<jl:if test="${pz.hasNextPage }">
					<li><a class="page" href="mypage_moveMypageBookingPage.do?pg=${pz.curPagination+1}">&gt;</a></li>
				</jl:if>
			<jl:if test="${pz.hasNextPagination }">
				<li><a class="page" href="mypage_moveMypageBookingPage.do?pg=${pz.paginationEnd+1 }">&gt;&gt;</a></li>
			</jl:if>
		</ul>



</body>
</html>