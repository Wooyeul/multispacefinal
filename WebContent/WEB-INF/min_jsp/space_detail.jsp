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
 	<script>
 		$(document).ready(function(){
 			$("#call").on("click",function(){
 				alert("${space.space_call } 모달로 바꿀 예정");
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
		
		<hr/>
		//space q&a 뿌려주는 곳
		
		<div>
			<jl:forEach var="space_qna" items="${list_space_qna }">
				<div class="panel-group" id="accordion${space_qna.space_qna_no }">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								제목 :
								<a data-toggle="collapse" data-parent="#accordion${space_qna.space_qna_no }" href="#collapse${space_qna.space_qna_no }">
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
							<a href="delete_space_qna.do?space_qna_no=${space_qna.space_qna_no }&space_no=${space_qna.space_no}">삭제</a>
							
							<jl:forEach var="space_qna_reple" items="${list_space_qna_reple }">
							
								리플번호 ${space_qna_reple.space_no }<br/>
								리플제목 ${space_qna_reple.space_qna_reple_title }<br/>
								리플내용 ${space_qna_reple.space_qna_reple_content }
							</jl:forEach>
								<form method="POST" action="add_space_qna_reple.do">
									<input type="hidden" name="space_qna_no" value="${space_qna.space_qna_no }">
									<input type="hidden" name="space_no" value="${space_qna.space_no }">
									<input type="hidden" name="user_id" value="kmk4204">
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

			<hr/>
			//space q&a 쓰는 곳
			
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
			<input type="hidden" name="user_id" value="kmk4204">
			<input type="hidden" name="space_no" value="${space.space_no }">
			<input type="submit">
			</form>
		</div>
	</div>
	
</body>
</html>