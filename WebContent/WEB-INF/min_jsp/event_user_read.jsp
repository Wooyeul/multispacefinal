<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
					<li><a href="event_user_list.do">�̺�Ʈ</a></li>	
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
			
			
			���� :<input type="text" name="eve_title" value="${text.eve_title}" readonly /><br/>
			���� :<textarea name="eve_content" rows="7" cols="40" readonly >${text.eve_content}</textarea><br/>
				<img src="thumbnail/${text.eve_thumb_img}" height="100" width="100"/> <br/>
			<input type="button" value="���" onclick= "window.location.href='event_user_list.do'">
</body>
</html>