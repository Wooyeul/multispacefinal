<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script src="common.js" type="text/javascript"></script>
 	<script>
 		$(document).ready(function(){
 			
 			$("#call").on("click",function(){
 				alert("${space.space_call } 모달로 바꿀 예정");
 			});
 			$(".collapsed").on("click",function(){
 				
 				//후기가 있으면 작성 못하게 하는거 & 후기 없으면 안불러 오게 해야함
 				var space_qna_no = $(this).attr("no");
 				ajaxGet("find_space_qna_reple.do?space_qna_no="+space_qna_no,function(rt){
 					var qna_reple = window.eval("("+rt+")");
 					var html = "<table>";
 					html += "<tr>";
 					html += "<td>제목</td>";
 					html += "<td>" + qna_reple.qna_reple_title +"</td>";
 					html +="</tr>";
 					html += "<tr>";
 					html += "<td>내용</td>";
 					html += "<td>" + qna_reple.qna_reple_content+"</td>";
 					html += "</tr>";
 					html+="</table>"
					$("#qna_reple"+space_qna_no).html(html);
 				},
 				function(){alert(2);},
 				function(){alert(3);}
 				);
 			});
 		});
 	</script>
</head>
<body>
	<div class="container">
	<h1>공간 상세 페이지</h1>
		<div>
			<table>
				<tr>
					<th><h1>공간 소개</h1></th>
				</tr>
				<tr>
					<td>공간 이름</td>
					<td>${space.space_title }</td>
				</tr>
				<tr>
					<td>공간 카테고리</td>
					<td>${space.c_category_no } (공사중)</td>
				</tr>
				<tr>
					<td><img src="thumbnail/${space.space_thumb_img }"/></td>
				</tr>
				<tr>
					<td>공간 소개</td>
					<td>${space.space_content }</td>
				</tr>
				<tr>
					<td>이용 시간</td>
					<td>${space.open_time } ~ ${space.close_time }</td>
				</tr>
			</table>
		</div>
		
		<hr/>
		//예약 이동
		<div>
			<table>
				<tr>
					<td>예약 인원</td>
					<td>최소 ${space.min_people } 명~ 최대 ${space.max_people } 명</td>
				</tr>
				<tr>
					<td>${space.price } 원 /시간</td>
				</tr>
				<tr>
					<td><button id="call">전화</button></td>
					<td><button id="qna">문의하기</button></td>
					<td><a href="space_reservation.do?space_no=${space.space_no }"><button>예약하기</button></a></td>
				</tr>
			</table>
		</div>
		
		<div>
		<hr/>
		
		<!-- space q&a 부분 -->
		<div class="col-xs-6">
			<h1>QnA</h1>
			<jl:forEach var="space_qna" items="${list_space_qna }">
				<div class="panel-group" id="accordion${space_qna.space_qna_no }">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								제목 :
								<a data-toggle="collapse" data-parent="#accordion${space_qna.space_qna_no }" href="#collapse${space_qna.space_qna_no }" no="${space_qna.space_qna_no }" class="collapsed">
									 ${space_qna.space_qna_title } <br/>
								</a>
								작성자: ${space_qna.user_id }
							</h4>
						</div>
					</div>
				
				<div id="collapse${space_qna.space_qna_no }" Class="panel-collpase collapse">
					<div class="panel-body">
						<table>
							<tr> 
								<td>내용</td>
								<td>${space_qna.space_qna_content }</td>
							</tr>
							<tr>
								<td>작성 시간</td>
								<td>${space_qna.the_time }</td>
							</tr>
						</table>
							<a href="delete_space_qna.do?space_qna_no=${space_qna.space_qna_no }&space_no=${space_qna.space_no}">질문 삭제</a>
								<div id="qna_reple${space_qna.space_qna_no }"></div>
								<form method="POST" action="add_space_qna_reple.do">
									<input type="hidden" name="space_qna_no" value="${space_qna.space_qna_no }">
									<input type="hidden" name="space_no" value="${space_qna.space_no }">
									<input type="hidden" name="user_id" value="${user_id }">
									<table>
									<tr>
										<td>제목</td>
										<td><input type="text" name="space_qna_reple_title"></td>
									</tr>
									<tr>
										<td>내용</td>
										<td><textarea row="5" col="30" name="space_qna_reple_content"></textarea></td>
									</tr>
									</table>
									<input type="submit">
								</form>
						
							
					</div>
				</div>
				</div>
			</jl:forEach>
			<!-- space q&a 쓰는 곳 -->
			
			<form method="POST" action="add_space_qna.do">
			<table>
				
				<tr><th>질문 하기</th></tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="space_qna_title"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="space_qna_content" rows="5" cols="30"></textarea></td>
				</tr>
				
			</table>
			
			<!-- user_id 보내는거 수정해야됨 -->
			<input type="hidden" name="user_id" value="${user_id }">
			<input type="hidden" name="space_no" value="${space.space_no }">
			<input type="submit">
			</form>
		</div>
			
		
		<!-- 후기 -->
		<div class="col-xs-6">
			<h1>후기</h1>
			<jl:forEach var="review" items="${list_review }">
				<div class="panel-group" id="accordion${review.review_no }">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								제목 :
								<a data-toggle="collapse" data-parent="#accordion${review.review_no }" href="#collapse_review${review.review_no }" class="collapsed">
									 ${review.review_title } <br/>
								</a>
								작성자: ${review.user_id }
							</h4>
						</div>
					</div>
				
				<div id="collapse_review${review.review_no }" Class="panel-collpase collapse">
					<div class="panel-body">
						<div class="col-xs-4"><img src="review_img/${review.review_img }" width="200" height="60" alt="썸네일"></div>
						<div class="col-xs-8">
							<table>
								<tr> 
									<td>내용</td>
									<td>${review.review_content }</td>
									<td>평점</td>
									<td>${review.review_score }</td>
								</tr>
								<tr>
									<td>작성 시간</td>
									<td>${review.the_time }</td>
								</tr>
								
							</table>
							<a href="del_review.do?review_no=${review.review_no }&space_no=${review.space_no}">후기 삭제</a>
						</div>
					</div>
				</div>
				</div>
			</jl:forEach>
			
			<form method="POST" action="review_add.do">
				<input type="hidden" name="user_id" value="${user_id }">
				<input type="hidden" name="space_no" value="${space.space_no }">
				<input type="submit" value="후기 작성">
			</form>
		</div>
		
	</div>
	</div>
	
</body>
</html>