<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<script>

	function ajaxGet( url, a, b, c ){
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if( xhr.readyState == 4 ){
				if( xhr.status == 200 ){
					a( xhr.responseText );
				}
				else if( xhr.status == 404 ){
					alert("404");
					if( b ){
						b();
					}
				}
				else if( xhr.status == 500 ){
					if( c != undefined ){
						c();
					}
				}
			}
		};
		xhr.open("GET",url,true);
		xhr.send(null);
	}
	
	
	$(document).ready(function(){
		
		/* ************************** 질문 클릭시 답변이 밑에 보이는 기능 ************************** */	
		$(".collapsed").on("click",function(e){
			$("#i_space_qna_no").attr("value",$(this).attr("space_qna_no")); // 여기서 바로 값 대입 X
			space_qna_no = $("#i_space_qna_no").val();
			
			var dc = "?dc=" + new Date().getTime();
			var url = "mypage_getMypageQnAReple.do"+dc+"&space_qna_no="+space_qna_no;
			
			// ajax로 해당 QnA 의 reple 받아옴.
			ajaxGet(url,function(rt){
				$(".c_space_qna_reple_content").attr("value",rt);
			}); 
		})
	});
	


	</script>

</head>
<body>

	<table border="1" cellspacing="0" cellpadding="8">
		<tr>
			<th width="40">qna_no</th>
			<th width="40">space_no</th>
			<th width="100">user_id</th>
			<th width="100">space_qna_title</th>
			<th width="100">space_qna_content</th>
			<th width="100">the_time</th>
		</tr>
		<jl:forEach var="QnAInfo" items="${qnaInfo}">
			<tr>
				<td>${QnAInfo.space_qna_no}</td>
				<td><span class="s_space_no" i="${QnAInfo.space_no}">${QnAInfo.space_no}</span>
					<input id="a" type="hidden" name="space_no" />
				</td>
				<td>${QnAInfo.user_id}</td>
				<td>${QnAInfo.space_qna_title}</td>
				<td>${QnAInfo.space_qna_content}</td>
				<td>${QnAInfo.the_time}</td>
			</tr>
		</jl:forEach>
	</table>

	<div id="accordion" role="tablist">
		<div class="card">
			<jl:forEach var="QnAInfo" items="${qnaInfo}">

				<div class="card">
					<div class="card-header" role="tab" id="headingTwo">
						<h5 class="mb-0">
							<a class="collapsed" data-toggle="collapse" href="#${QnAInfo.space_qna_no}"
							space_qna_no="${QnAInfo.space_qna_no}" 
							space_no="${QnAInfo.space_no}" 
							role="button" aria-expanded="false" aria-controls="collapseTwo">
								${QnAInfo.space_qna_content}
								<input type="hidden" name="space_qna_no" id="i_space_qna_no"/>
								<input type="hidden" name="space_no" id="i_space_no"/>
							</a>
						</h5>
					</div>
					<div id="${QnAInfo.space_qna_no}" class="collapse" role="tabpanel"
						aria-labelledby="headingTwo" data-parent="#accordion">
						<div class="card-body">
							<input type="text" class="c_space_qna_reple_content" 
								   name="space_qna_reple_content" />
						</div>
					</div>
				</div>
				
			</jl:forEach>
		</div>
	</div>

</body>
</html>