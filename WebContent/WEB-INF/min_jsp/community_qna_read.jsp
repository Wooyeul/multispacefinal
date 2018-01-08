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
			<label>����:</label>
			<span>${vo.com_qna_title}</span><br>
		</div>
		
		<div class="user_id">
			<label>���̵�:</label>
			<span>${vo.user_id}</span><br>
		</div>
		
		<div class="content">
			<label>����</label><br/>
			<span>${vo.com_qna_content}</span><br/>
		</div>
		
		<table border="1" cellspacing="0" cellpadding="8">
		<tr>
			<th>����</th>
			<th width="200">��۳���</th>
			<th>�����ϱ�</th>
			<th>�ð�</th>
			<th>��õ��</th>
			<th>��õ�ϱ�</th>
			<th>��ۻ���</th>
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
					<input type="submit" value="��ۼ���"/>
				</form>
				</td>
				<td>${rpl.the_time}</td>
				<td>
					<div id="recom_count">${rpl.recom_count}</div>
				</td>
				<td>
					[<a href="community_qna_reple_recom.do?user_id=woo&com_qna_reple_no=${rpl.com_qna_reple_no}&com_qna_no=${rpl.com_qna_no}">��õ</a>]
				</td>
				<td>[<a href="community_qna_reple_del.do?com_qna_no=${rpl.com_qna_no }&com_qna_reple_no=${rpl.com_qna_reple_no}">����</a>]</td>
			</tr>
		</jl:forEach>
	</table>
		<form action="community_qna_reple_add.do" method="post">
			<input type="text" name="com_qna_reple_content" />
			<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}"/>
			<input type="submit" value="����ۼ�"/>
		</form>
		
		<form action="community_qna_list.do" method="post">
			<input type="submit" value="QnA���"/>
		</form>
		
		<form action="community_qna_mod.do" method="post">
			<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}"/>
			<input type="hidden" name="com_qna_title" value="${vo.com_qna_title}"/>
			<input type="hidden" name="com_qna_content" value="${vo.com_qna_content}"/>
			<input type="submit" value="QnA����"/>
		</form>
		
		<form action="community_qna_del.do" method="post">
			<input type="hidden" name="com_qna_no" value="${vo.com_qna_no}"/>
			<input type="submit" value="QnA����"/>
		</form>
		
		
	</div>
</body>
</html>