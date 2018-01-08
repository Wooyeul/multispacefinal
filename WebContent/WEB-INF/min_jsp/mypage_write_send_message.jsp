<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<script type="text/javascript" src="common.js"></script>
	
	<script>
	$(document).ready(function(){
		
		$("#select_club").change(function(){
			 club_no = $(this).val();
			 alert(club_no);			
			// location.href="mypage_moveMypageWriteMessageFindUserClubMemberPage.do?club_no="+club_no;
			 
	 
			 url = "mypage_moveMypageWriteMessageFindUserClubMemberPage.do?club_no="+club_no;
			 ajaxGet(url,function(rt){
				 var user_club_member = window.eval("("+rt+")");
				 for( var i = 0 ; i < user_club_member.data.length ; i++ ){
					 alert(user_club_member.data[i]);	 
				 }
	/* 			for(var i=0;i<user_club_member.length;i++){
					alert(user_club_member);
				} */
				/*  $.each(user_club_member,function(i,obj){
					$("<option></option>").text(obj).appendTo("#select_club_member") 
				 }); */

			 });
			 

			 
		});
		
		});
	</script>
</head>
<body>
	<form method="POST" action="" >
		
		
		
<%-- 		<jl:forEach var="ReceiveMessage" items="${receiveMessage}">
			<tr>
				<td>${ReceiveMessage.send_user_id}</td>
				<td><span class="s_msg_no" i="${ReceiveMessage.msg_no}" >${ReceiveMessage.msg_content}</span>
					<input id="i_msg_no" type="hidden" name="msg_no" />
				</td>
				<td>${ReceiveMessage.the_time}</td>
			</tr>
		</jl:forEach>
		
		 --%>
		<label> 모임 </label> 
		
		<select name="club_list" id="select_club">
			<jl:forEach var="User_clubInfo" items="${user_clubInfo}">
				<option value="${User_clubInfo.club_no}">${User_clubInfo.club_no}</option>
			</jl:forEach>
		</select> <br/>
		
		<label> 받는사람 </label> 
		
		<select name="club_member_list" id="select_club_member">

		</select> <br/>
		
		
		<label>쪽지 내용</label>
		<input type="text" name="msg_content"/>
		<input type="submit" value="쪽지 보내기"/>
	</form>


</body>
</html>