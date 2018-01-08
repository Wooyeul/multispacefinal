<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style type="text/css">
		.jumbotron{
			text-align:center;
		}
		.content{
			height : 100px;
		}
		td, th {
			text-align:center;
		}
	</style>
	
</head>
<body>
	<div id="i" class="jumbotron panel-primary">
		<h1>QnA</h1>
	</div>
	
	<div class="container">
		<div class="title">
			<label>제목:</label>
			<span>${vo.com_qna_title}</span><br>
		</div>
		
		<div class="user_id">
			<label>아이디:</label>
			<span>${vo.user_id}</span><br>
		</div>
		
		<div class="content">
			<label>내용</label><br/>
			<span>${vo.com_qna_content}</span><br/>
		</div>
		
		<table border="1" cellspacing="0" cellpadding="8">
		<tr>
			<th>유저</th>
			<th width="200">댓글내용</th>
			<th>수정하기</th>
			<th>시간</th>
			<th>추천수</th>
			<th>추천하기</th>
			<th>댓글삭제</th>
		</tr>
		<jl:forEach var="rpl" items="${rp}">
			<tr>
				<td>${rpl.user_id}</td>
				<td>${rpl.com_qna_reple_content}</td>
				<td>
				<form action="community_qna_reple_mod.do" method="post">
				<input type="hidden" name="com_qna_no" value="${rpl.com_qna_no}"/>
					<input type="hidden" name="com_qna_reple_no" value="${rpl.com_qna_reple_no}"/>
					<input type="hidden" name="com_qna_reple_content" value="${rpl.com_qna_reple_content}"/>
					<input type="submit" value="댓글수정"/>
				</form>
				</td>
				<td>${rpl.the_time}</td>
				<td>
					<div id="recom_count">${rpl.recom_count}</div>
				</td>
				<td>
					[<a href="community_qna_reple_recom.do?user_id=woo&com_qna_reple_no=${rpl.com_qna_reple_no}&com_qna_no=${rpl.com_qna_no}">추천</a>]
				</td>
				<td>[<a href="community_qna_reple_del.do?com_qna_no=${rpl.com_qna_no }&com_qna_reple_no=${rpl.com_qna_reple_no}">삭제</a>]</td>
			</tr>
		</jl:forEach>
	</table>
		<form action="community_qna_reple_add.do" method="post">
			<input type="text" name="com_qna_reple_content" />
			<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}"/>
			<input type="submit" value="댓글작성"/>
		</form>
		
		<form action="community_qna_list.do" method="post">
			<input type="submit" value="QnA목록"/>
		</form>
		
		<form action="community_qna_mod.do" method="post">
			<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}"/>
			<input type="hidden" name="com_qna_title" value="${vo.com_qna_title}"/>
			<input type="hidden" name="com_qna_content" value="${vo.com_qna_content}"/>
			<input type="submit" value="QnA수정"/>
		</form>
		
		<form action="community_qna_del.do" method="post">
			<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}"/>
			<input type="submit" value="QnA삭제"/>
		</form>
		
		
	</div>
</body>
</html>