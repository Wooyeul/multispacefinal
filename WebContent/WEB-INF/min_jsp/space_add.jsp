<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
 	 <script>
 	 	function openTimeChange() {
 	 		var x = document.getElementById("open_time_range");
 	 		var y = document.getElementById("open_time");
 	 		y.value=x.value;
 	 	}
 	 	
 	 	function closeTimeChange() {
 	 		var a = document.getElementById("close_time_range");
 	 		var b = document.getElementById("close_time");
 	 		b.value=a.value;
 	 	}
 	 	
 	 </script>
</head>
<body>
	<div class="container">
		<h1>
		ADD
		</h1>
		<form method="POST" action="space_add2.do" enctype="multipart/form-data">
			<div class="form-group">
				<label for="crn">사업자번호(나중에는 db에서 뽑아올 예정)</label>
				<input type="text" id="crn" name="crn" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="space_title">공간 이름</label>
				<input type="text" id="space_title" name="space_title" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="space_title">공간 소개</label>
				<input type="text" id="space_content" name="space_content" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="space_thumb_img">썸네일 이미지</label>
				<input type="file" id="space_thumb_img" name="space_thumb_img" class="form-control"/>
			</div>
			<div class="form-group">
				<label for="open_time">시작 시간</label>
				<input id="open_time_range" type="range" min="0" max="24" onchange="openTimeChange();"/>
				<input id="open_time" name="open_time" type="number" min="0" max="24" value="0"/>시
			</div>
			<div class="form-group">
				<label for="close_time">종료 시간</label>
				<input id="close_time_range" type="range" min="0" max="24" onchange="closeTimeChange();"/>
				<input id="close_time" name="close_time" type="number" min="0" max="24" value="24"/>시
			</div>
			
			<div class="form-group">
				<label for="price">시간당 가격</label>
				<input id="price" type="number" name="price" class="form-control"/>
			</div>
			
			<div class="form-group">
				<label for="min_people">최소 인원</label>
				<input id="min_people" type="number" name="min_people" class="form-control"/>
			</div>
			
			<div class="form-group">
				<label for="max_people">최대 인원</label>
				<input id="max_people" type="number" name="max_people" class="form-control"/>
			</div>
			
			<div class="form-group">
				<label for="space_call">연락 받을 전화번호</label>
				<input id="space_call" type="tel" name="space_call" class="form-control"/>
			</div>
			
			<div class="form-group">
				<label for="l_category_no">지역</label>
				<label class="radio-inline"><input type="radio" name="l_category_no" value="1">서울</label>
				<label class="radio-inline"><input type="radio" name="l_category_no" value="2">경기</label>
				<label class="radio-inline"><input type="radio" name="l_category_no" value="3">강원</label>
			</div>
			
			<div class="form-group">
				<label for="c_category_no">카테고리</label>
				<label class="checkbox-inline"><input type="checkbox" name="c_category_no" value="1">스포츠</label>
				<label class="checkbox-inline"><input type="checkbox" name="c_category_no" value="2">공부</label>
				<label class="checkbox-inline"><input type="checkbox" name="c_category_no" value="3">파티</label>
				<label class="checkbox-inline"><input type="checkbox" name="c_category_no" value="4">취미생활</label>
			</div>
			
			<input type="submit" class="submit"/>
		</form>
	</div>
</body>
</html>