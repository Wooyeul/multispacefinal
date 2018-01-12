<%@ page contentType="text/html;charset=utf-8" pageEncoding="euc-kr"%><%@
taglib
	prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

th,td,tr {
text-align: center;
}
</style>
<script src="common.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script type="text/javascript">
$(document).ready(function(){
		$(".space_no").on("click",function(){
			var temp = $(this).attr("abc");
			
			document.frm.method="POST";
			document.frm.action="space_detail.do?space_no="+temp;
			document.frm.submit();
		});
	});
</script> 



<body>


<table class="table table-hover">
		<tr>
			<th>번호</th>
			<th>방번호</th>
			<th>아이디</th>
			<th>제목</th>
			<th>내용</th>
			<th>시간</th>
			<th>별점</th>
			<th>이미지</th>
		</tr>

			<jl:forEach items="${rl}" var="rl">
		<tr>
				<td>${rl.review_no}</td>
				<td>${rl.space_no}</td>
				<td>${rl.user_id}</td>
				<td><a href="space_detail.do?space_no=${rl.space_no}">${rl.review_title}</a></td>
				<td>${rl.review_content}</td>
				<td>${rl.the_time}</td>
				<td>${rl.review_score}</td>
				<td><img src="img/${rl.review_img}" width="100px" class="space_no" abc="${rl.space_no}"/></td>
		</tr>
			</jl:forEach>


	</table>


</body>
</html>