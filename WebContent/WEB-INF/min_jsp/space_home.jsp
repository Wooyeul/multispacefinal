<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"> 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script>
 	$(document).ready(function(){
 		$('#boy').on("load",function(){
 			var h = this.contentWindow.document.body.offsetHeight;
 			$(this).height(h);
 		});
 	});
 </script>
 
</head>
<body>

	<div class="container">
		<H1>공간 홈</H1>
		<hr/>
		<a href="space_add.do">공간 등록</a>
		<hr/>
		<hr/>
		<form>
			<div class="form-group">
				<label for="s_category_no">카테고리</label>
				<jl:forEach var="category" items="${category_list }">
					<label class="radio-inline"><input type="radio" name="s_category_no" value="${category.s_category_no }">${category.s_category_name }</label>
				</jl:forEach>
			</div>
			<div class="form-group">
				<label for="l_category_no">지역</label>
				<jl:forEach var="local" items="${local_list }">
					<label class="radio-inline"><input type="radio" name="l_category_no" value="${local.l_category_no }">${local.l_category_name }</label>
				</jl:forEach>
			</div>
			<input type="submit" value="제출">
		</form>
		<hr/>
		<iframe id="boy" src="space_home_iframe.do" width="100%" frameborder="0"></iframe>
	</div>
	
</body>
</html>