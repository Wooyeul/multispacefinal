<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	 <script src="common.js" type="text/javascript"></script>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
<script>

 	 	function startTimeChange() {
 	 		var x = document.getElementById("start_time_range");
 	 		var y = document.getElementById("start_time");
 	 		y.value=x.value;
 	 	}
 	 	
 	 	function endTimeChange() {
 	 		var a = document.getElementById("end_time_range");
 	 		var b = document.getElementById("end_time");
 	 		b.value=a.value;
 	 	}

 	 	
 	 	$(document).ready(function(){
 	 		 
 	 		 $("#booking_people").val("${space.min_people}");
 	 		 
 	 		 $("#people_plus").on("click",function(){
 	 			var people = $("#booking_people").val();
 	 			people_no=Number(people);
 	 			if(people_no<"${space.max_people}"){
 	 				people_no=people_no+1;
 	 				$("#booking_people").val(people_no);
 	 			}else{
 	 				alert("최대 인원 입니다");
 	 			}
 	 		 });
 	 		 
 	 		$("#people_minus").on("click",function(){
 	 			var people = $("#booking_people").val();
 	 			people_no=Number(people);
 	 			if(people_no>"${space.min_people}"){
 	 				people_no=people_no-1;
 	 				$("#booking_people").val(people_no);
 	 			}else{
 	 				alert("최소 인원 입니다");
 	 			}
 	 		 });
 	 		
 	 		$("#start_time_range").on("change",function(){
 	 			var start_time = $("#start_time_range").val();
 	 			var end_time = $("#end_time_range").val();

 	 			var final_time=Number(end_time)-Number(start_time);
 	 			var final_price=final_time*Number("${space.price}");
 	 			$("#booking_price").val(final_price);
 	 			$("#start").html(start_time);
 	 		});
 	 		
 	 		$("#end_time_range").on("change",function(){
 	 			var start_time = $("#start_time_range").val();
 	 			var end_time = $("#end_time_range").val();
 	 			
 	 			var final_time=Number(end_time)-Number(start_time);
 	 			var final_price=final_time*Number("${space.price}");
 	 			$("#booking_price").val(final_price);
 	 			$("#end").html(end_time);
 	 			
 	 		});
 	 		
 	 		$("#pay").on("click",function(){
 	 			$("#start_time").removeAttr("disabled");
 	 			$("#end_time").removeAttr("disabled");
 	 			$("#booking_date").removeAttr("disabled");
 	 			$("#booking_people").removeAttr("disabled");
 	 			$("#booking_price").removeAttr("disabled");
 	 			$("#pay").attr("type","submit");
 	 		});
 	 		
 	 		$("#booking_date").datepicker({
 	 			dateFormat:"yy-mm-dd"
			});
 	 		$("#date2").datepicker({
 	 			dateFormat:"yy-mm-dd"
			});
 	 			
 	 		$("#date2").on("change",function(){
 	 			var currentDate = $( "#date2" ).datepicker("getDate","dateFormat" );
 	 			$("#booking_date").datepicker("setDate",currentDate);
				var dat = $("#booking_date").val();
 	 			$("#reserve_day").html(dat);
 	 		});
 	 		
 	 	
 	 		
 	 	});
 	 
 	 	$(document).ready(function(){
 	 		var scOffset = $( '.navbar-Menu' ).offset();
 	 		$( window ).scroll( function() {
 	 		if ( $( document ).scrollTop() > scOffset.top ) {
 	 		$( '.navbar' ).addClass( 'navbar-fixed-top' );
 	 		}
 	 		else {

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
 	 		$("#user_name").text(rt+"님이 로그인하셨습니다.");
 	 			}
 	 		 });	


 	 		});


 	 </script>
</head>
<body>
	<div class="jbTitle">
		<h1>Multi Space</h1>
	</div>
	
	<!-- Fixed navbar -->
	<nav class="navbar navbar-default ">
		<div class="container">
		 <div class="navbar-header">
		   <a class="navbar-brand" href="main.html">multi space</a>
		 </div>
	
	 <div id="navbar" class="navbar-collapse collapse navbar-Menu ">
		<ul class="nav navbar-nav ">
	 	 <li><a href="space_home.do">공간</a></li>
		 <li><a href="club_home.do">모임</a></li>
		 <li><a href="community_list.do">커뮤니티</a></li>
		 <li><a href="event_user_list.do">이벤트</a></li>	
		 <li><a href="notice_list.do">공지사항</a></li>
		 <li><a href="faq_list.do">FAQ</a></li>			
		 <li><a href="admin_main.do">관리자</a></li>			
		</ul>
				
	<ul id="login_nav" class="nav navbar-nav navbar-right">
		<li><a href="#" id="user_name"></a></li>
		<li><a href="mypage_moveMypageMainPage.do">마이페이지</a></li>
		<li><a href="home_logout.do">로그아웃</a></li>	
	</ul>
					
		<ul id="non_login_nav" class="nav navbar-nav navbar-right">
		     <li><a href="#">로그인</a></li>		
		</ul>
	
		   </div>
		</div>
	</nav>
	<!-- nav -->
	<div class="container">
	<h1>예약 페이지</h1>
		<div class="text-center">
			<img src="thumbnail/${space.space_thumb_img }"/>
			<h2>공간 이름 : ${space.space_title }</h2>
			<h2>공간 소개 : ${space.space_content }</h2>
		</div>
		 
		

		<form method="POST" action="space_payment.do">

		<div  id="date2" ></div>

			<div class="form-group">
				<label for="booking_date">예약 날짜</label>
				<input type="text"  id="booking_date" name="booking_date" disabled="disabled">
			</div>
			
			<div class="form-group">
					<label for="start_time">대여 시작 시간</label>
					<input id="start_time_range" type="range" min="${space.open_time }" max="${space.close_time }" onchange="startTimeChange();"/>
					<input id="start_time" type="number"  value="0" disabled="disabled" name="start_time"/>시
				</div>
				
				
				<div class="form-group">
					<label for="end_time">대여 종료 시간</label>
					<input id="end_time_range" type="range" min="${space.open_time }" max="${space.close_time }" onchange="endTimeChange();"/>
					<input id="end_time" type="number" value="0" disabled="disabled" name="end_time"/>시
				</div>
				
				
				<div class="form-group">
					<label for="people">대여 인원</label>
					<button id="people_plus" type="button" class="btn btn-default btn-lg">
						<span class="glyphicon glyphicon-plus"></span>
					</button>
					<input id="booking_people" name="booking_people" type="text" disabled="disabled">
					<button id="people_minus" type="button" class="btn btn-default btn-lg">
						<span class="glyphicon glyphicon-minus"></span>
					</button>
					
						
				</div>
				<div class="form-group">
					<label for="solo_and_club">개인회원/모임회원</label>
					<label class="radio-inline"><input type="radio" name="solo_and_club" value="solo">개인 회원</label>
					<label class="radio-inline"><input type="radio" name="solo_and_club" value="club">모임 회원</label>
				</div>
				
				<div class="form-group">
					<label for="club_list">모임 목록</label>
					<select name="club_list" id="club_list">
						<option value="null">개인 회원</option>
						<jl:forEach var="club" items="${club_list }">
						<option value="${club.club_no }">${club.club_name }</option>
						</jl:forEach>
					</select>
				</div>
				
				<div>
					<table>
						<tr>
							<td colspan="3">결제 예정 금액</td>
						</tr>
						<tr>
							<td>예약 날짜</td>
							<td colspan="2" ><div id="reserve_day"></div></td> 
						</tr>
						<tr>
							<td>예약 시간</td>
							<td><label id="start">3</label>시 ~ <label id="end">10</label>시</td>
						</tr>
						<tr>
							<td colspan="2"><input type="text" name="booking_price" id="booking_price" disabled="disabled"></td>
							<td>원</td>
						</tr>
					</table>

					
					<hr/>
					
					<table>
						<tr>
							<th>예약자 정보</th>
						</tr>
						<tr>
							<td>예약자*</td>
							<td><input type="text" name="booking_user_name"></td>
						</tr>
						<tr>
							<td>연락처*</td>
							<td><input type="text" name="booking_phone"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="booking_email"></td>
						</tr>
						<tr>
							<td>요청사항</td>
							<td><textarea name="booking_message"></textarea></td>
						</tr>
					</table>
					
					<input type="hidden" value="${user_id }" id="user_id" name="user_id"/>
					<input type="hidden" value="${space.space_no }" name="space_no"/>
				
					<input id="pay" type="button" value="결제하기"/>
					
				</div>
		</form>
	</div>
</body>
</html>