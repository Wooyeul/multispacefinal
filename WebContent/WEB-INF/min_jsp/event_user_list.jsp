<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head></head>
<body>`
	<table border="1" cellspacing="0" cellpadding="8">
		
		<jl:forEach var="vo" items="${rl}">
			<tr>
				<td>${vo.eve_no}</td>
				<td><a href="event_user_read.do?eve_no=${vo.eve_no}"><img src="img/${vo.eve_thumb_img}"/></a></td>
				<td>
					<a href="event_user_read.do?eve_no=${vo.eve_no}">${vo.eve_title}</a>
				</td>
			</tr>
		</jl:forEach>
	</table>
		
	
</body>
</html>