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

		var url = "chk_login.do";
 		ajaxGet(url,function(rt){
 			
 				// �α��� ���н� : rt�� -> ("/main_html.do")���� 10002 return
 				if(rt =="10002"){ 
					$("#login_nav").hide();
					$("#non_login_nav").show();
				}
 					
 				// �α��� �� : rt�� -> user_name
				else if(rt!=""){ 
					$("#login_nav").show();
					$("#non_login_nav").hide();
					$("#user_name").text(rt+"���� �α����ϼ̽��ϴ�.");
				}
 			});	
		
		
		var scOffset = $('.navbar-Menu').offset();
			$(window).scroll(function() {
				if ($(document).scrollTop() > scOffset.top) {
					$('.navbar').addClass('navbar-fixed-top');
				} else {
					$('.navbar').removeClass('navbar-fixed-top');
				}
			});
			
			
			
			


		});
	</script>
</head>
<body>


	<input type="hidden" id="i_top_nav_code" /> 
	
	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="main.html">Multi Space</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="space_home.do">����</a></li>
					<li><a href="club_home.do">����</a></li>
					<li><a href="community_list.do">Ŀ�´�Ƽ</a></li>
					<li><a href="event_user_list.do">�̺�Ʈ</a></li>
					<li><a href="notice_list.do">��������</a></li>
					<li><a href="faq_list.do">FAQ</a></li>
					<li><a href="admin_main.do">������</a></li>
				</ul>
				
				<ul id="non_login_nav" class="nav navbar-nav navbar-right">
					<li><a href="home_moveLoginPage.do">�α���</a></li>
				</ul>
				
				<ul id="login_nav" class="nav navbar-nav navbar-right">
					<li><a href="#">${user_name}���� �α��� �ϼ̽��ϴ�.</a></li>
					<li><a href="mypage_moveMypageMainPage.do">����������</a></li>
					<li><a href="/home_logout.do">�α׾ƿ�</a></li>					
				</ul>
				
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>

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
