<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>

		


<!DOCTYPE html>
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
					<li><a href="space_home.do">공간</a></li>
					<li><a href="club_list.do">모임</a></li>
					<li><a href="community_list.do">커뮤니티</a></li>
					<li><a href="event_list.do">이벤트</a></li>	
					<li><a href="notice_list.do">공지사항</a></li>
					<li><a href="faq_list.do">FAQ</a></li>			
					<li><a href="admin_main.do">관리자</a></li>			
				</ul>
				
				<ul class="nav navbar-nav navbar-right">
					<li><a herf="#">${user_name}님이 로그인 하셨습니다.</a></li>
					<li><a href="mypage_moveMypageMainPage.do">마이페이지</a></li>
					<li><a href="#">로그아웃</a></li>					
				</ul>
			</div>
			<!--/.nav-collapse -->
			

		<form method="POST" action="event_mod.do" >
			제목 :<input type="text" name="eve_title" value="${text.eve_title}" readonly /><br/>
			내용 :<textarea name="eve_content" rows="7" cols="40" readonly >${text.eve_content}</textarea><br/>
				<input type="hidden" name="eve_no" value="${text.eve_no}" />
				<img src="thumbnail/${text.eve_thumb_img}" height="100" width="100"/><br/>
			<input type="submit" value="수정" />
			<a href="event_del2.do?eve_no=${text.eve_no}">삭제</a>
			<input type="button" value="취소" onclick= "window.location.href='event_list.do'">
		</form>
</body>
</html>