<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
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
<script>

	$(document).ready(function(){
		
		ajaxGet("best_space.do",function(rt){
			var seoul_best = eval("("+rt+")");
			var html ="";
			
			 for(var i=0; i<seoul_best.data.length; i++){
				 html += "<li>";
				 html += "<a href='#'>";
				 html += "<img src='./Resources/img/property_1.jpg'  class='property_img'/>";
				 html += "</a>";
				 html += "<span class='price'>서울</span>";
				 html += "<div class='property_details'>";
				 html += "<h1>";	
				 html += "<a href='#'>"+seoul_best.data[i].space_title+"</a>";	
				 html += "</h1>";	
				 html += "<div class='property_details_box'>";	
				 html += "<div class='property_sub_details_left'>";	
				 html += "<h2>"+seoul_best.data[i].price+"원/시간 </h2>";	
				 html += "</div>";	
				 html += "<div class='property_sub_details_right'>";	
				 html += "<h2><span class='property_size'>즐찾수 "+seoul_best.data[i].count+"</span></h2>";	
				 html += "</div>";	
				 html += "</div>";	
				 html += "</div>";	
				 html += "</li>";	
					
				// alert(seoul_best.data[i].space_title);
			} 
			 $("#seoulbest_properties_list").html(html);
			
		});
		
		ajaxGet("best_space2.do",function(rt){
			var party_best = eval("("+rt+")");
			var html2 ="";
			
			 for(var i=0; i<party_best.data.length; i++){
				 html2 += "<li>";
				 html2 += "<a href='#'>";
				 html2 += "<img src='./Resources/img/property_1.jpg'  class='property_img'/>";
				 html2 += "</a>";
				 html2 += "<span class='price'>서울</span>";
				 html2 += "<div class='property_details'>";
				 html2 += "<h1>";	
				 html2 += "<a href='#'>"+party_best.data[i].space_title+"</a>";	
				 html2 += "</h1>";	
				 html2 += "<div class='property_details_box'>";	
				 html2 += "<div class='property_sub_details_left'>";	
				 html2 += "<h2>"+party_best.data[i].price+"원/시간 </h2>";	
				 html2 += "</div>";	
				 html2 += "<div class='property_sub_details_right'>";	
				 html2 += "<h2><span class='property_size'>즐찾수 "+party_best.data[i].count+"</span></h2>";	
				 html2 += "</div>";	
				 html2 += "</div>";	
				 html2 += "</div>";	
				 html2 += "</li>";	
			 }
			 $("#partybest_properties_list").html(html2);
		});
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

	<section class="hero">
	<header>
	<div class="wrapper">

		<a href="#" class="logo" alt="" titl="">Multi Space</a>
			<nav class="navbar navbar-default">

		<div id="navbar">

			<ul class="nav ">
				<li><a href="space_home.do">공간</a></li>
				<li><a href="club_home.do">모임</a></li>
				<li><a href="community_list.do">커뮤니티</a></li>
				<li><a href="event_user_list.do">이벤트</a></li>
				<li><a href="notice_list.do">공지사항</a></li>
				<li><a href="faq_list.do">FAQ</a></li>
				<li><a href="admin_main.do">관리자</a></li>
			</ul>


			<ul id="login_nav" class="nav navbar-right">
				<li><a href="#" id="user_name"></a></li>
				<li><a href="mypage_moveMypageMainPage.do">마이페이지</a></li>
				<li><a href="home_logout.do">로그아웃</a></li>
			</ul>

			<ul id="non_login_nav" class="nav navbar-right">
				<li><a href="home_moveLoginPage.do">로그인</a></li>
			</ul>


		</div>
		</nav>
	</div>
	</header><!--  end header section  --> 
	</section>



	<section class="listings">
		<div class="wrapper">

			<div class="c_cate_list">
				<div>
					<p>18px</p>
				</div>
				<ul id="seoulbest_properties_list" class="properties_list">
	
				</ul>

				<div>
					<p>18px</p>
				</div>
				<ul id="partybest_properties_list" class="properties_list">

				</ul>

			</div></section>	


		<!-- ******************************* footer ******************************* -->

	<footer>
		<div class="wrapper footer">
			<ul>
			
				<li class="about_multi">
						<p>상호명 : 멀티스페이스</p>
						<p>프로젝트 명 : multi space</p>
						<p>개발자 : 허빛찬샘 | 안수진 | 김세환 | 배승현 |</p>
						<p>조우열 | 이양재 | 임승범 | 김소영</p>
						<p>기  간 : 17/12/22 - 18/01/24</p>
						<p>이메일 : tnwls2274@naver.com</p>
				 </li>
			
			
				<li class="about_multi">
						<p>계좌번호 :</p>
						<p>(국민은행) 464801 - 01 - 061719</p>
						<p>고객센터 :</p>
						<p>AM 10: 00 ~ PM6 : 00</p>
						<p>(오전 9시부터 오후 6시까지 가능합니다.)</p>
						<p>개인정보관리 책임자 : </p>
						<p>이숙희 (madhjh@redholic.com)</p>
				 </li>
			
			
				<li class="links">
					<ul>
						<li><a href="#">공간 예약</a></li>
						<li><a href="#">모임</a></li>
						<li><a href="#">커뮤니티</a></li>
						<li><a href="#">공지사항</a></li>
						<li><a href="#">이벤트</a></li>
					</ul>
				</li>
				
				<li class="about">
					<ul>
						<li><a href="http://facebook.com/pixelhint" class="facebook" target="_blank"></a></li>
						<li><a href="http://twitter.com/pixelhint" class="twitter" target="_blank"></a></li>
						<li><a href="http://plus.google.com/+Pixelhint" class="google" target="_blank"></a></li>
						<li><a href="#" class="skype"></a></li>
					</ul>
				 </li>
			

	
			</ul>
		</div>

		<div class="copyrights wrapper">
			Copyright ⓒ 2018 <a href="http://pixelhint.com" target="_blank" class="ph_link" title="Download more free Templates">MultiSpace</a>. All Rights Reserved.
		</div>
	</footer><!--  end footer  -->
	
</body>
</html>