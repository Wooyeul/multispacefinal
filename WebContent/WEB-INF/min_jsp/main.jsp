<%@ page 
	contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%><!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- bootstrap_test17.html

	-->
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

h1 {
	font-weight: bold;
}

.jumbotron {
	margin-top: 20px;
	background-color: orange;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
				<a class="navbar-brand" href="#">Project name</a>
			</div>
			
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="space_home.do">����</a></li>
					<li><a href="club_list.do">����</a></li>
					<li><a href="community_list.do">Ŀ�´�Ƽ</a></li>
					<li><a href="event_list.do">�̺�Ʈ</a></li>	
					<li><a href="notice_list.do">��������</a></li>
					<li><a href="faq_list.do">FAQ</a></li>			
					<li><a href="admin_main.do">������</a></li>			
				</ul>
				
				<ul class="nav navbar-nav navbar-right">
					<li><a herf="#">${user_name}���� �α��� �ϼ̽��ϴ�.</a></li>
					<li><a href="mypage_moveMypageMainPage.do">����������</a></li>
					<li><a href="#">�α׾ƿ�</a></li>					
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>

	<div class="container">

		<!-- Main component for a primary marketing message or call to action -->
		<div class="jumbotron">
			<h1>Multi Space</h1>
		</div>

	</div>
	<!-- /container -->



</body>
</html>
