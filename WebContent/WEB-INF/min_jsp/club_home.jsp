<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>
		table, tr, td{
			border: 1px solid;
		}
		
	</style>
</head>
<body>
	<div class="container">
		<h2>모임 페이지</h2>
		
		<form id="frm" target="iframe" action="club_list.do">
			<div style="display: inline;">
				<h4>지역별 선택</h4>
				<jl:forEach items="${lmap}" var="l">
					<input type="radio" value="${l.l_category_no}" name="l_category_no" />${l.l_category_name}
				</jl:forEach>
				<br/>
				<h4>분야별 선택</h4>
				<jl:forEach items="${cmap}" var="c">
					<input type="radio" value="${c.c_category_no}" name="c_category_no" />${c.c_category_name}
				</jl:forEach>
			</div><br/>
			<select name="search_option">
				<option value="0"></option>
				<option value="1">제목</option>
				<option value="2">내용</option>
				<option value="3">제목+내용</option>
				<option value="4">작성자</option>
			</select>
			<input type="text" name="search_content"/>
			<br/><input type="button" id="submitBtn" value="검색">
			<input id="curPage" name="curPage" type="hidden" value="1">
		</form>
		<br/><br/>
		<div>
			<iframe id="ifr" name="iframe" width="100%" height="100%"></iframe>
		</div>
		<input id="btn" type="button" value="모임등록"/>
	</div>

	<!-- 자바스크립트 -->	
	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#frm").submit();
			$("#btn").on("click",function(){
				location.href="club_add_page.do";
			});
			$("#submitBtn").on("click",function(){
				$("#frm").submit();
			});
		});
	
		function setCurpage(page){
			$("#curPage").attr("value",page);
			$("#frm").submit();
		}
	</script>
</body>
</html>