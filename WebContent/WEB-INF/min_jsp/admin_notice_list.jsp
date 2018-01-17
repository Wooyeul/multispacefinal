<%@ page contentType="text/html; charset=utf-8" pageEncoding="euc-kr"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<style type="text/css">
	.jumbotron{
		text-align:center;
	}
	th, td {
		text-align: center;
	}
	</style>
</head>
<body>
	<div id="i" class="jumbotron panel-primary">
		<h1>��������</h1>
	</div>
	<table border="1" cellspacing="0" cellpadding="8">
		<tr>
			<th width="40">������ȣ</th>
			<th width="200">����</th>
			<th>��¥</th>
		</tr>
		<jl:forEach var="vo" items="${rl}">
			<tr>
				<td>${vo.notice_no}</td>
				<td><a href="admin_notice_read.do?notice_no=${vo.notice_no}">${vo.notice_title}</a></td>
				<td>${vo.the_time}</td>
			</tr>
		</jl:forEach>
	</table>
		<form action="admin_notice_add.do" method="post">
			<input type="submit" value="��������"/>
		</form>
	<br>
<br>
<form id="form_search" action="admin_notice_list.do">
	<input type="hidden" name="pg" value="" id="pg">
	<input type="hidden" name="search_content" value="${search.search_content}">
	<input type="hidden" name="search_option" value="${search.search_option}">
</form>
<form id="textsearch" action="admin_notice_list.do" method="post">
	<select name="search_option">
		<option value="0">�������ּ���</option>
		<option value="1">����</option>
		<option value="2">����</option>
		<option value="3">���� + ����</option>
	</select>
	�˻� : <input type="text" name="search_content">
	<input type="submit" value="�˻�">
</form>
	<ul class="pagination pagination-sm">
			<jl:if test="${pz.hasPrevPagination }">
				<li><a class="page" href="admin_notice_list.do?pg=${pz.paginationStart-1}">&lt;</a></li>
			</jl:if>
				<jl:if test="${pz.hasPrevPage }">
					<li><a class="page" href="admin_notice_list.do?pg=${pz.curPagination-1 }">&lt;</a></li>
				</jl:if>
				<jl:forEach begin="${pz.paginationStart }" end="${pz.paginationEnd }" step="1" varStatus="vs">
					<jl:choose>
						<jl:when test="${vs.index!=pz.curPagination }">
							<li><a class="page" href="admin_notice_list.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:when>
						<jl:otherwise>
							<li class="active"><a class="page" href="admin_notice_list.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:otherwise>
					</jl:choose>
				</jl:forEach>
				<jl:if test="${pz.hasNextPage }">
					<li><a class="page" href="admin_notice_list.do?pg=${pz.curPagination+1}">&gt;</a></li>
				</jl:if>
			<jl:if test="${pz.hasNextPagination }">
				<li><a class="page" href="admin_notice_list.do?pg=${pz.paginationEnd+1 }">&gt;&gt;</a></li>
			</jl:if>
		</ul>	
		
</body>
</html>