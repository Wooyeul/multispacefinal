<%@ page 
	contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%><!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);



</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="common.js"></script>
	
	<script>
	$(document).ready(function(){
	
		
		if($("#i_top_nav_code").val() == 20000){
			$("#login_nav").show();
			$("#non_login_nav").hide();
		}
		if($("#i_top_nav_code").val() == 20002){
			$("#login_nav").hide();
			$("#non-login").show();
		}

		
	});
	
	

	</script>
</head>
<body>
	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"	aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="main_html.do">Project name</a>
			</div>
			
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="space_home.do">공간</a></li>
					<li><a href="club_home.do">모임</a></li>
					<li><a href="community_list.do">커뮤니티</a></li>
					<li><a href="event_list.do">이벤트</a></li>	
					<li><a href="notice_list.do">공지사항</a></li>
					<li><a href="faq_list.do">FAQ</a></li>			
					<li><a href="admin_main.do">관리자</a></li>			
				</ul>
				
				<ul id="login_nav" class="nav navbar-nav navbar-right">
					<li><a href="#">${user_name}님이 로그인 하셨습니다.</a></li>
					<li><a href="mypage_moveMypageMainPage.do">마이페이지</a></li>
					<li><a href="home_logout.do">로그아웃</a></li>					
				</ul>
				
				<ul id="non_login_nav" class="nav navbar-nav navbar-right">
					<li><a href="#">로그인</a></li>				
				</ul>
				
			</div>
		</div>
	</nav>
	<!--/.nav-collapse -->

	<div class="container">

		<!-- Main component for a primary marketing message or call to action -->
		<div class="jumbotron">
			<h1>Multi Space</h1>
		<!-- <input type="text" id="i_top_nav_code" value="${top_nav_code}"/>  -->	
 <input type="hidden" id="i_top_nav_code" value="${top_nav_code}"/> 
			
		</div>

	</div>
	<!-- /container -->



</body>
</html>
