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
			/* 마스터 이외에게 신청 현황 리스트, 공지쓰기 버튼 보여주지 않기*/
			if('${user_id}'!='${vo.user_id}'){
				$("#applyList").attr("style","display:none");
				$("#noticeBtn").attr("style","display:none");
				$("#delClub").attr("value","탈퇴하기");
			}
			
			/* 해체하기, 혹은 탈퇴하기 버튼을 눌렀을 때 실행*/
			$("#delClub").on("click",function(){
				/*쿠키의 user_id와 모임의 user_id가 같을 때 즉 마스터이면 모임 해체가 가능하다*/
				if('${user_id}'=='${pvo.user_id}'){
					$("#del_club_modal").modal();
					$("#del_club_yes").on("click",function(){
						$("#del_club_frm").submit();
					});
					$("#del_club_no").on("click",function(){
						$("#del_club_modal").modal('hide');
					});
				}else{
					/*그게 아니라면 일반 회원 이므로 유저 탈퇴로 실행*/
					$("#del_user_modal").modal();
					$("#del_user_yes").on("click",function(){
						$("#del_user_frm").submit();
					});
					$("#del_user_no").on("click",function(){
						$("#del_user_modal").modal('hide');
					});
				}
			});
			
			/* 이미 수락한 내용인지 확인  */
			if('${flag}'==1){
				alert("수락 되었습니다.");
			}else if('${flag}'==-1){
				alert("이미 수락 되었습니다.");
			}
			/* 공지사항,자유게시판 글쓰기 버튼 클릭 시 이동  */
			$("#noticeBtn").on("click",function(){
				location.href="club_add_community_notice.do?club_no="+${vo.club_no};
			});
			$("#boardBtn").on("click",function(){
				location.href="club_add_community_board.do?club_no="+${vo.club_no};
			});
			
			/* 뒤로가기 버튼 클릭 시 club_home.do로 이동*/
			$("#prev").on("click",function(){
				location.href="club_home.do";
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
	<label>모임 이름 : ${vo.club_name}</label><br/>
	<label>모임장 : ${master}</label><br/>

	<label><h3>공지사항</h3></label><br/>
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
		<tr>${master}(모임장)</tr><br/>
		<jl:forEach items="${userVO}" var="uvo">
			<tr><label class="user_name" user_id="${uvo.user_id}">${uvo.user_name}</label></tr><br/>
		</jl:forEach>
	</table>
	<br/><br/>
	<div id="applyList">
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
	
	<input id="prev" type="button" value="뒤로가기">
	<input id="delClub" type="button" value="해체하기"/>
</div>



	<!-- 클럽 해체 modal창 시작 -->
	<form id="del_club_frm" method="post" action="club_del_club.do">
		<div id="del_club_modal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div id="mohead" class="modal-header"align="center"><h2>모임 해체</h3></div>
					<div id="mobody" class="modal-body" align="center"><h3>모임을 정말 해체하시겠습니까?</h2></div>
					<div id="ft" class="modal-footer">
						<button type="button" class="btn btn-default" id="del_club_yes">확인</button>
						<button type='button' class='btn btn-primary' id='del_club_no'>취소</button>
					</div>
				</div>
			</div>
		</div>
		<input name="club_no" type="hidden" value="${vo.club_no}"/>
	</form>
	<!-- 클럽 해체 modal창 끝 -->
	
	<!-- 유저 탈퇴 modal창 시작 -->
	<form id="del_user_frm" method="post" action="club_del_user.do">
		<div id="del_user_modal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div id="mohead" class="modal-header"align="center"><h2>모임 탈퇴</h3></div>
					<div id="mobody" class="modal-body" align="center"><h3>모임을 정말 탈퇴하시겠습니까?</h2></div>
					<div id="ft" class="modal-footer">
						<button type="button" class="btn btn-default" id="del_user_yes">확인</button>
						<button type='button' class='btn btn-primary' id='del_user_no'>취소</button>
					</div>
				</div>
			</div>
		</div>
		<input name="club_no" type="hidden" value="${vo.club_no}"/>
		<input name="user_id" type="hidden" value="${user_id}"/>
	</form>
	<!-- 유저 탈퇴 modal창 끝 -->
	




</body>
</html>