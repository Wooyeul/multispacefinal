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


</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
</head>
<body>

<div id="header">
		<ul id="Navtab" class="nav nav-pills" role="tablist">
		
			<li role="presentation" class="">
			<a href="#communuty2" role="tab"  id="community" data-toggle="tab" aria-controls="communuty2"
				aria-expanded="false">자유게시판</a></li>
				
			<li role="presentation" class="">
			<a href="#qna2" role="tab" id="qna" data-toggle="tab" aria-controls="qna2"
				aria-expanded="true">질문답변</a></li>
				
			<li role="presentation" class="">
			<a href="#review2" role="tab" id="review" data-toggle="tab" aria-controls="review2"
				aria-expanded="true">후기</a></li>
		</ul>
</div>		

		<div id="Content" class="tab-content">
		
			<div role="tabpanel" class="tab-pane fade active in" id="communuty2" 
				aria-labelledby="community">
	
			<iframe src="community_board_list.do" width='1024px' height='768px'></iframe>

			</div>
			
			<div role="tabpanel" class="tab-pane" id="qna2"
				aria-labelledby="qna">
				community_qna_list.do
				<iframe src="community_qna_list.do" width='1024px' height='768px'></iframe>
			
			</div>

			<div role="tabpanel" class="tab-pane" id="review2"
				aria-labelledby="review">
				community_review_list.do
				<iframe src="community_review_list.do" width='1024px' height='768px'></iframe>
			</div>

		</div>

</body>
</html>