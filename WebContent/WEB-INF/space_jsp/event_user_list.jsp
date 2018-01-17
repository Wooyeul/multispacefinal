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
	<link rel="stylesheet" type="text/css" href="./Resources/css/event_hover.css" >
	
		
	<script type="text/javascript" src="./Resources/js/jquery.js"></script>
	<script type="text/javascript" src="./Resources/js/main.js"></script>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="./common.js"></script>
	<style type="text/css">
	
	h1 {
		text-align: center;
	}
	select {
		float: left;
	}
	.eveb {
		margin-top: 27px;
		margin-bottom: 27px;
		text-align: center;
		font-size: 2em;
		font-family: "lato-regular", Helvetica, Arial, sans-serif;
	}
	body {
		background-color: #bfd9f2;
	}
	.property_details {
		background-color: white;
	}
	.selectdiv1{
		vertical-align : middle;
		width: 800px;
		float: left;
	}
	
	.selectdiv2{
		margin-top:5px;
		width: 150px;
		float: left;
	}
	
	 .selectdiv3 {
	 	width: 400px;
		padding : 5px;
		float: left;
	}
	 .selectdiv4 {
	 	width: 100px;
		padding : 5px;
		float: left;
	}
	
	
	</style>
	<script>
		$(document).ready(function(){
			
			var scOffset = $('.navbar-Menu').offset();
			$(window).scroll(function() {
				if ($(document).scrollTop() > scOffset.top) {
					$('.navbar').addClass('navbar-fixed-top');
				} else {
					$('.navbar').removeClass('navbar-fixed-top');
				}
			});
			
			
			
			var url = "chk_login.do";
	 		ajaxGet(url,function(rt){
	 			
	 				// 로그인 실패시 : rt값 -> ("/main_html.do")에서 10002 return
	 				if(rt =="10002"){ 
						$("#login_nav").hide();
						$("#non_login_nav").show();
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


	


<div class="container">
	<div class="eveb">EVENT BOARD</div>

		<div class="wrapper">
			<form action="event_user_list.do">
				<div class="selectdiv1">
					<div class="selectdiv2">
						<select class="form-control" name="eve_option">
							<option value="0">선택하세요</option>
							<option value="1">제목</option>
							<option value="2">내용</option>
							<option value="3">제목+내용</option>
						</select>
					</div>
					<div class="selectdiv3">
						<input class="form-control" type="text" name="eve_key" placeholder="카테고리 선택 -> 내용 입력" />
					</div>
					<div class="selectdiv4">
						<input type="submit" class="btn btn-primary" value="검색"/>				
					</div>
				</div>
			</form>
		</div>

	<section class="listings">
		<div class="wrapper">
		<div class="~~~~" ></div>
			<ul class="properties_list">
			<jl:forEach var="vo" items="${rl}">
			<li>
			<div class="ih-item square colored effect6 from_top_and_bottom"><a href="event_user_read.do?eve_no=${vo.eve_no}">
			<div class="img"><img src="./thumbnail/${vo.eve_thumb_img}" alt="img"></div>
			<div class="info">
				<h3>${vo.eve_no}. ${vo.eve_title}</h3>
				<p><span class="property_size">${vo.eve_content}</span></p>
			</div></a>
		</div>
		<a href="event_user_read.do?eve_no=${vo.eve_no}">
		<div class="property_event_details">
			<h1>Event #${vo.eve_no}<br/>${vo.eve_title}</h1>
			<h6>${vo.the_time}</h6>
		</div></a>
			</li>
			</jl:forEach>
			</ul>
		</div>
	</section>
</div>

	<!-- ******************************* footer ******************************* -->
		  <%@include file="./jsp/footer.jsp"%>  
	<!--  end footer  -->
	
	
	
</body>
</html>



