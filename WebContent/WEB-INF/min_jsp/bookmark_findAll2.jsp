<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".space_no").on("click",function(){
			/* var temp = $(this).attr("abc");
			alert(temp); */
		});
	});

</script>
<title>Insert title here</title>
</head>
<body>
	<h3>즐겨찾기</h3>
	<form action="bookmark_del.do" method="POST">
		<table border="1">
			<jl:forEach var="ab" items="${rl}" varStatus="i" begin="0">
			<jl:if test="${(i.count-1) % 3 eq 0}">
				<tr>
			</jl:if>
				<td>	
				${ab.space_no}
				<input type="checkbox" class="space_no" name="check" value="${ab.space_no}" abc="${ab.space_no}"/><br/>
				<img src="img/${ab.space_thumb_img}" width="100px" /><br/>
				${ab.space_title}<br/>
				</td>
			</jl:forEach>
		</table>
		<input type="submit" value="삭제하기"/>
	</form>
</body>
</html>