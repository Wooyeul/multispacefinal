<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
	<script type="text/javascript" src="common.js"></script>
	
	<script>
	$(document).ready(function(){

		
		$("#receiveMessageBox").hide();
		$("#sendMessageBox").hide();
		$("#sendMessage").hide();
		
		$("#message_nav").on("click",function(e){
			if($("#receiveMessageBox").css("display") == "none"){
				$("#receiveMessageBox").show();
				$("#sendMessageBox").show();
				$("#sendMessage").show();
			} else {
				$("#receiveMessageBox").hide();
				$("#sendMessageBox").hide();
				$("#sendMessage").hide();
			}
		});
		
		
	});

	</script>
</head>
<body>
<div class="container-fluid">

	
	<div class="row">
		<div class="col-sm-2">
		 <ul class="nav" >
		      <li class="active"><a data-toggle="tab" href="#myInfo">[내 정보]</a></li>
		      <li><a data-toggle="tab" href="#myBooking">구매 정보</a></li>
		      <li><a data-toggle="tab" href="#myBookmark">즐겨찾기</a></li>
		      <li><a data-toggle="tab" href="#myQna">Q&A</a></li>
		      <li><a data-toggle="tab" href="#myClub">내 모임</a></li>
		      <li><a data-toggle="tab" href="#myReview">내 후기</a></li>
		      <li><a data-toggle="tab" id="message_nav" href="#myClub">쪽지 함</a></li>
				   <ul class="sub_message_nav" >
				      <li id="receiveMessageBox" class="active"><a data-toggle="tab" href="#myReceiveMessageBox">받은 쪽지함</a></li>
				      <li id="sendMessageBox"><a data-toggle="tab" href="#mySendMessageBox">보낸 쪽지함</a></li>
				      <li id="sendMessage"><a data-toggle="tab" href="#mySendMessage">쪽지 보내기</a></li>
				   </ul>

<li><a data-toggle="tab" href="#sellerWrite">[판매자]</a></li>
			<li><a data-toggle="tab" href="#sellerWrite">내 글</a></li>	
			<li><a data-toggle="tab" href="#sellerAllChart">전체 통계</a></li>

		   </ul>
	</div>
	

	
	
	<div class="tab-content col-sm-10" >
		<div id="myInfo"  class="tab-pane active fade in">	
			<iframe src="myinfo_ckpass.do"  align="center"></iframe>
		</div>
		<div id="myBooking" class="tab-pane fade">
			<iframe src="mypage_moveMypageBookingPage.do"  align="center"></iframe>
		</div>
		<div id="myBookmark"   class="tab-pane fade">
			<iframe src="bookmark_findAll.do"  align="center"></iframe>
		</div>
		<div id="myQna"   class="tab-pane fade">
			<iframe src="mypage_moveMypageQnAPage.do"  align="center"></iframe>
		</div>
		<div id="myClub"   class="tab-pane fade">
			<iframe src="myclub_findAll.do"  align="center"></iframe>
		</div>
		<div id="myReview"   class="tab-pane fade">
			<iframe src="PMreview_findAll.do"  align="center"></iframe>
		</div>
		<div id="myReceiveMessageBox"   class="tab-pane fade">
			<iframe src="mypage_moveMypageReceiveMessagePage.do"  align="center"></iframe>
		</div>
		<div id="mySendMessageBox"   class="tab-pane fade">
			<iframe src="mypage_moveMypageSendMessagePage.do"  align="center"></iframe>
		</div>
		<div id="mySendMessage"   class="tab-pane fade">
			<iframe src="mypage_moveMypageWriteMessagePage.do"  align="center"></iframe>
		</div>
		
		<!-- **************** 마이페이지-판매자 *************** -->
		
		<div id="sellerWrite"   class="tab-pane fade">
			<iframe src="myhost_findAll.do"  align="center"></iframe>
		</div>
		
		<div id="sellerAllChart"   class="tab-pane fade">
			<iframe src=""  align="center"></iframe>
		</div>
	</div>
	
	</div>
	
</div>
</body>
</html>
