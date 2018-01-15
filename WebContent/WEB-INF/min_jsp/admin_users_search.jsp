<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="common.js" type="text/javascript"></script>
<script>

</script>
</head>
<body>
<h1>유저리스트</h1>
<br>
<a href="admin_user_del_write_list.do">탈퇴 시킨 유저 리스트 보기(판매자 포함)</a>
<br>
<br>

<form id="form_search" action="admin_users_search.do">
	<input type="hidden" name="pg" value="" id="pg">
</form>
<table border="1">
	<tr>
		<td>이름</td>
		<td>유저 ID</td>
		<td>이메일</td>
		<td>탈퇴 시키기</td>
	</tr>
	<jl:forEach var="vo" items="${ls}">
		<tr>
			<td>${vo.user_name}</td>
			<td><a href="admin_user_check.do?user_id=${vo.user_id}">${vo.user_id}</a></td>
			<td>${vo.email}</td>
			<td><a href="admin_user_del_write.do?user_id=${vo.user_id}&user_name=${vo.user_name}&email=${vo.email}">탈퇴 시키기</a></td>
		</tr>
	</jl:forEach>
</table>

	<ul class="pagination pagination-sm">
			<jl:if test="${pz.hasPrevPagination }">
				<li><a class="page" href="admin_users_search.do?pg=${pz.paginationStart-1}">&lt;</a></li>
			</jl:if>
				<jl:if test="${pz.hasPrevPage }">
					<li><a class="page" href="admin_users_search.do?pg=${pz.curPagination-1 }">&lt;</a></li>
				</jl:if>
				<jl:forEach begin="${pz.paginationStart }" end="${pz.paginationEnd }" step="1" varStatus="vs">
					<jl:choose>
						<jl:when test="${vs.index!=pz.curPagination }">
							<li><a class="page" href="admin_users_search.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:when>
						<jl:otherwise>
							<li class="active"><a class="page" href="admin_users_search.do?pg=${vs.index }">${vs.index }</a></li>
						</jl:otherwise>
					</jl:choose>
				</jl:forEach>
				<jl:if test="${pz.hasNextPage }">
					<li><a class="page" href="admin_users_search.do?pg=${pz.curPagination+1}">&gt;</a></li>
				</jl:if>
			<jl:if test="${pz.hasNextPagination }">
				<li><a class="page" href="admin_users_search.do?pg=${pz.paginationEnd+1 }">&gt;&gt;</a></li>
			</jl:if>
		</ul>
</body>
</html>