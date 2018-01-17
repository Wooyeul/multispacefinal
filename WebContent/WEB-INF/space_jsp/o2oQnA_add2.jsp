<%@ page contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<title>Welcome to Multi Space</title>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
	
	<link rel="stylesheet" type="text/css" href="./Resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="./Resources/css/responsive.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<script type="text/javascript" src="./Resources/js/jquery.js"></script>
	<script type="text/javascript" src="./Resources/js/main.js"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="./common.js"></script>
<style type="text/css">


.jumbotron {
	text-align: center;
}

.button {
	text-align: center;
}
.t1 {
	text-align: right;
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
				$("#user_name").text(rt + "님이 로그인하셨습니다.");
			}
		});
	});
</script>
</head>
<body>
<section class="hero">
		<header>
			<div class="wrapper">
				<!-- <a href="#"><img src="./Resources/img/logo.png" class="logo" alt="" titl=""/></a> -->
				<a href="#" class="logo" alt="" titl="">Multi Space</a>
				<nav class="navbar navbar-default">

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
							<li><a href="home_moveLoginPage.do">로그인</a></li>
						</ul>
					</div>
				</nav>
			</div>
		</header><!--  end header section  -->
	</section><!--  end hero section  -->
	
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
			Copyright © 2015 <a href="http://pixelhint.com" target="_blank" class="ph_link" title="Download more free Templates">MultiSpace</a>. All Rights Reserved.
		</div>
	</footer><!--  end footer  -->
</body>
</html>