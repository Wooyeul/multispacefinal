<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<!-- bootstrap_test17.html

	-->
	<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

h1 {
	font-weight: bold;
}

.jumbotron {
	margin-top: 20px;
	background-color: green;
	color: #FFFFFF;
}

iframe {
	display: block;
	border: none;
	width: 100%;
	height: 1000px;
	align:center;
}


ul {
	display: inline;
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 25%;
	background-color: #f1f1f1;
	height: 100%;
	
}

li a {
	font-weight: bold;
	display: block;
	color: green;
	padding: 8px 16px;
	text-decoration: none;
}

li:hover{
	background-color: green;
}

li a.active {
	background-color: green;
	color: green;
}

li a:hover {
	background-color: green;
	color: green;
}



</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid">

	
	<div class="row">
		<div class="col-sm-2">
		 <ul class="nav" >
		      <li class="active"><a data-toggle="tab" href="#myInfo">내 정보</a></li>
		      <li><a data-toggle="tab" href="#myBooking">구매 정보</a></li>
		      <li><a data-toggle="tab" href="#myBookmark">즐겨찾기</a></li>
		      <li><a data-toggle="tab" href="#myQna">Q&A</a></li>
		      <li><a data-toggle="tab" href="#myReview">내 후기</a></li>
		      <li><a data-toggle="tab" href="#myClub">쪽지 보내기</a></li>
		      <li><a data-toggle="tab" href="#myMessage">쪽지함</a></li>
		   </ul>
	</div>
	
	<div class="tab-content col-sm-10" >
		<div id="myInfo"  class="tab-pane active fade in">	
			<iframe src="myinfo_ckpass.do"  align="center"></iframe>
		</div>
		<div id="#myBooking" class="tab-pane fade">
			<iframe src="mypage_moveMypageBookingPage.do"  align="center"></iframe>
		</div>
		<div id="myBookmark"   class="tab-pane fade">
			<iframe src=""  align="center"></iframe>
		</div>
		<div id="myQna"   class="tab-pane fade">
			<iframe src="mypage_moveMypageQnAPage.do"  align="center"></iframe>
		</div>
		<div id="myReview"   class="tab-pane fade">
			<iframe src=""  align="center"></iframe>
		</div>
		<div id="myClub"   class="tab-pane fade">
			<iframe src="mypage_moveMypageWriteMessagePage.do"  align="center"></iframe>
		</div>
		<div id="myMessage"   class="tab-pane fade">
			<iframe src="mypage_moveMypageReceiveMessagePage.do"  align="center"></iframe>
		</div>
	</div>
	
	</div>
	
</div>
</body>
</html>
