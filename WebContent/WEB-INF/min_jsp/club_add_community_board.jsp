<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#cancel").on("click",function(){
				location.href="club_community.do?club_no="+${club_no};
			});
		});
	</script>
</head>
<body>
	<form action="club_add_community_board_submit.do" method="post">
		<label>제목 : </label><input name="c_board_title" type="text"/><br/>
		<label>말머리 : </label>
		<select name="c_board_subject">
			<option></option>	
			<option value="일반">일반</option>	
			<option value="유머">유머</option>	
			<option value="질문/답변">질문/답변</option>	
		</select>
		<label>내용 : </label><textarea name="c_board_content" rows="15" cols="25"></textarea><br/>
		<input name="club_no" type="hidden" value="${club_no}"/>
		<input name="user_id" type="hidden" value="${user_id}"/>
		<input type="submit" value="등록"/><input id="cancel" type="button" value="취소"/>
	</form>
</body>
</html>