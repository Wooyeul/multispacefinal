<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".space_no").on("click",function(){
		var temp = $(this).attr("abc");
		window.parent.location.href="space_detail.do?space_no="+temp;
	});
});
</script>
<head>
</head>
<body>
	<form action="myhost_addForm.do" method="POST">
		<input type="submit" value="공간추가등록"/>
		<input type="hidden" name="user_id" value="${user_id}"/>
	</form>

	<form name="frm">
	<table border="1">
		<jl:forEach var="ab" items="${rl}" >
			<tr>
				<td>${ab.space_no}</td>
				<td>${ab.space_title}</td>
				<td><img src="thumbnail/${ab.space_thumb_img}" width="100px" class="space_no" abc="${ab.space_no}"/></td>
			</tr>
		</jl:forEach>
	</table>
	</form>
	

	
	
</body>
</html>