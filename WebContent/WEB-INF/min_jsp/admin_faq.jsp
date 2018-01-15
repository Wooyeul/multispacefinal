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

.jumbotron {
	background-color: orange;
}

.FAQ {
	color: white;
	text-align: center;
}

.table {
	text-align: center;
	border-color: center;
}

.ask {
	text-align: center;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script>
$(document).ready(function(){
	$("#faq_del").on("click",function(){
		document.frm.action="admin_faq_remove.do";
		document.frm.submit();
	});
});
</script>
</head>
<body>

	<div class="jumbotron">
		<div class="FAQ">
			<h1>F A Q</h1>
		</div>
	</div>

	<%-- 되는테이블<table border="1" class="table table-hover" >
		<tr>
			<th>NO</th>
			<th>TITLE</th>
			<th>CONTENT</th>
		</tr>
		<jl:forEach var="vo" items="${rl}">
			<tr>
				<td>${vo.faq_no}</td>
				<td>${vo.faq_title}</td>
				<td>${vo.faq_content}</td>
			</tr>
		</jl:forEach>
	</table> --%>



	<div class="container">
		<h2>FAQ Board</h2>
		<div class="panel-group" id="accordion" role="tablist"
			aria-multiselectable="true">
			<jl:forEach var="vo" items="${rl}">
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#${vo.faq_no}" aria-expanded="true"
								aria-controls="collapseOne">${vo.faq_no} . ${vo.faq_title} </a>
						</h4>
					</div>
					<div id="${vo.faq_no}" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">${vo.faq_content}</div>
						
						<form method="post" action="admin_faq_read.do" name="frm" >
							<input type="hidden" name="faq_no" value="${vo.faq_no}" />
							<input type="hidden" name="faq_title" value="${vo.faq_title}" />
							<input type="hidden" name="faq_content" value="${vo.faq_content}" />
							<button type="submit">수정 하기</button>&nbsp;&nbsp;&nbsp;
							<button id="faq_del" type="submit" >삭제 하기</button> 
						</form>
					</div>
				</div>
			</jl:forEach>
		</div>

		<div class="write">
			<a href="admin_faq_add.do">
				<input class="btn btn-success" type="button" value="write FAQ">
			</a>
		</div>
		
	</div>



</body>
</html>