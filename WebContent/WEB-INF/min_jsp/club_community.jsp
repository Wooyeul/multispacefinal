<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<style>
		table, tr, td{
			border: 1px solid;
		}
	</style>
	<script type="text/javascript">
		$(document).ready(function(){
			/* 이미 수락한 내용인지 확인  */
			if('${flag}'==1){
				alert("수락 되었습니다.");
			}else if('${flag}'==-1){
				alert("이미 수락 되었습니다.");
			}
			/* 이미 수락한 내용인지 확인  */
			
			$("#noticeBtn").on("click",function(){
				location.href="club_add_community_notice.do?club_no="+${vo.club_no};
			});
			$("#boardBtn").on("click",function(){
				location.href="club_add_community_board.do?club_no="+${vo.club_no};
			});
			
			//이름 클릭하고 쪽지 보낼 팝업창 띄우기
			$(".user_name").on("click",function(e){
				e.preventDefault();  
	            var url = "club_message_popup.do?receive_user_id="+$(this).attr("user_id")+"&send_user_id=admin";
	            window.open(url, "popup","width=300,height=400,toolbar=no,location=no,direcories=no,status=no,menubar=no,resizable=no,scrollbars=no,copyhistory=no");
			});
			
		});
	</script>
</head>
<body>
<div class="container">
	<h2>모임 커뮤니티 페이지</h2>
	<label><h3>공지사항</h3></label><br/>
	<label>모임 이름 : ${vo.club_name}</label><br/>
	<label>모임장 : ${master}</label><br/>
	<table class="table">
		<jl:forEach items="${noticeVO}" var="nvo" varStatus="i">
			<tr>
				<td>${i.count}</td>
				<td><a href="club_notice_detail.do?c_notice_no=${nvo.c_notice_no}">${nvo.c_notice_title}</a></td>
			</tr>
		</jl:forEach>
	</table>
	<input id="noticeBtn" type="button" value="공지쓰기"/><br/><br/>
	<label><h3>커뮤니티 게시판</h3></label><br/>
	<table class="table">
		<jl:forEach items="${boardVO}" var="bvo" varStatus="i">
			<tr>
				<td>${i.count}</td>
				<td>${bvo.c_board_subject }</td>
				<td><a href="club_board_detail.do?c_board_no=${bvo.c_board_no}">${bvo.c_board_title}</a></td>
			</tr>
		</jl:forEach>
	</table>
	<input id="boardBtn" type="button" value="글쓰기"/>
	<br/><br/>
	<label><h3>회원 리스트</h3></label><br/>
	<table class="table">
		<tr>${master}</tr><br/>
		<jl:forEach items="${userVO}" var="uvo">
			<tr><label class="user_name" user_id="${uvo.user_id}">${uvo.user_name}</label></tr><br/>
		</jl:forEach>
	</table>
	<br/><br/>
	<label><h3>신청 현황 리스트</h3></label><br/>
	<table class="table">
		<tr>
			<td>이름</td>
			<td>신청내용</td>
			<td>신청승인</td>
		</tr>
		<jl:forEach items="${applyVO}" var="avo">
			<tr>
				<td>${avo.user_name}</td>
				<td>${avo.apply_content}</td>
				<td><a href="club_apply_agree.do?club_no=${vo.club_no}&user_id=${avo.user_id}">수락</a>
				<a href="club_apply_disagree.do?club_no=${vo.club_no}&user_id=${avo.user_id}">거절</a></td>
			</tr>
		</jl:forEach>
	</table>
	
</div>
</body>
</html>