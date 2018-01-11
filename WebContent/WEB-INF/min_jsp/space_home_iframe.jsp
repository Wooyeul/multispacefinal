<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"> 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script>
 </script>

</head>
<body>
		<table border="1">
		<jl:forEach var="vo" items="${list2 }">
			<tr>
				<td><p onclick="parent.location.href='space_detail.do?space_no=${vo.space_no }'"><img src="thumbnail/${vo.space_thumb_img }" alt="공간 사진 없음"/></p></td>
				<td>${vo.space_no }</td>
				<td>${vo.crn }</td>
			</tr>
		</jl:forEach>
		</table>
		${paginationEnd }
		${paginationStart }
		<ul class="pagination pagination-sm">
			<jl:if test="${pz.hasPrevPagination }">
				<li><a href="space_home_iframe.do?pg=${pz.paginationStart-1}">&lt;</a></li>
			</jl:if>
			<jl:forEach begin="${pz.paginationStart }" end="${pz.paginationEnd }" step="1" varStatus="vs">
				<jl:choose>
					<jl:when test="${vs.index!=curPagination }">
						<li><a href="space_home_iframe.do?pg=${vs.index }">${vs.index }</a></li>
					</jl:when>
					<jl:otherwise>
						<li class="active"><a href="space_home_iframe.do?pg=${vs.index }">&lt;</a></li>
					</jl:otherwise>
				</jl:choose>
			</jl:forEach>
			<jl:if test="${pz.hasNextPagination }">
				<li><a href="space_home_iframe.do?pg=${pz.paginationEnd+1}">&gt;</a></li>
			</jl:if>
		</ul>
</body>
</html>